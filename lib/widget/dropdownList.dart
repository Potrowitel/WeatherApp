import 'package:flutter/material.dart';
import 'package:weather_app/widget/cityTile.dart';
import '../data/cities.dart';
import '../help/ThemeColors.dart';

class LocationDrowdownList extends StatelessWidget {
  final List<Cities> citiesList;
  String alph = '';
  bool alphFlag = false;
  final void Function(
    String city,
    String country,
    bool visible,
  ) refreshData;

  LocationDrowdownList(this.refreshData, this.citiesList);

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      // onPanDown: (detail) {
      //   refreshData(
      //     '',
      //     '',
      //     false,
      //   );
      // },
      child: Container(
        height: mediaHeight - 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 24),
            Text(
              'Location',
              style: Theme.of(context).textTheme.headline1,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ThemeColors.textFieldBack,
                  suffixIcon: Icon(Icons.location_on),
                  border: InputBorder.none,
                ),
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: Offset(0, 6),
                ),
              ]),
            ),
            SingleChildScrollView(
              child: Container(
                height: mediaHeight - 172,
                child: ListView.builder(
                  itemCount: citiesList.length,
                  itemBuilder: (context, index) {
                    alphFlag = false;
                    String firstChar =
                        citiesList[index].city[0].toUpperCase().toString();
                    if (alph == '') {
                      alphFlag = true;
                      alph = firstChar;
                    }
                    if (alph != firstChar) {
                      alphFlag = true;
                      alph = firstChar;
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        alphFlag
                            ? Container(
                                margin: EdgeInsets.only(left: 30.0),
                                child: Text(
                                  firstChar,
                                  style: TextStyle(
                                    fontFamily: 'Barlow-Light',
                                    fontSize: 40,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            : Container(),
                        GestureDetector(
                          onTap: () {
                            refreshData(
                              citiesList[index].city,
                              citiesList[index].country,
                              false,
                            );
                          },
                          child: Container(
                            child: CityTile(
                                citiesList[index].city,
                                citiesList[index].country,
                                citiesList[index].temp),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

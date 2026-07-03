import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'package:subjeecentral/pages/productpage.dart';

import '../Config.dart';

// class splashscreen extends StatefulWidget {
//   @override
//   splashscreenState createState() => new splashscreenState();
// }

// class splashscreenState extends State<splashscreen> {
//   List<GenderModel> genderModelList = [];
//   String selectedGender;
class cityList extends StatefulWidget {
  @override
  cityListState createState() => cityListState();
}

class cityListState extends State<cityList> {
  late String mySelection;

  String url = Config.url + Config.cityList;
//Production
  // final String url =
  //     "http://13.233.187.96:8083/subjeeCentralService/area/v1/getCityList";

  //dev
  // final String url =
  //     "http://44.192.46.200:8083/subjeeCentralService/area/v1/getCityList";

  //final String url = Config.url + Config.cityList;
  List<dynamic> data = [];
  Future<String> getSWData() async {
    var res = await http
        .get(Uri.parse(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    setState(() {
      data = resBody;
    });
    print(resBody);
    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }

  // asyncFunc(String selCity) async {
  //   // Async func to handle Futures easier; or use Future.then
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('CityName', selCity);
  // }

  void saveSharedPref(String cityname) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString('localCity', jsonEncode(cityname));
    print("city>>>>>>>>>>");
    print(result);
    print("city>>>>>>>>>>");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.lightGreen[200],
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: Text("Welcome"),
          centerTitle: true,
        ),
        body: new Center(
            child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 65),
            width: 600,
            height: 360,
            child: Card(
              child: Column(
                children: [
                  // Container(
                  //   margin: EdgeInsets.all(25),
                  //   // child: ElevatedButton(
                  //   //   child: Text(
                  //   //     'SignUp',
                  //   //     style: TextStyle(fontSize: 20.0),
                  //   //   ),
                  //   //   onPressed: () {
                  //   //     Navigator.of(context).push(MaterialPageRoute(
                  //   //       builder: (context) => MyHomePage(),
                  //   //     ));
                  //   //   },
                  //   // ),
                  // ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Icon(
                      Icons.place,
                      size: 46),
                    ),
                  Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "please select your city",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    width: 122,
                    child: new DropdownButton(
                      items: data.map((item) {
                        return new DropdownMenuItem(
                          child: new Text(
                            item['cityName'],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          value: item['cityName'].toString(),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          mySelection = newVal ?? mySelection;
                          saveSharedPref(newVal ?? '');
                          print(">>>>>>>>>>>>>>>>>>");
                          print(mySelection);
                          print(">>>>>>>>>>>>>>>>>>");
                        });
                      },
                      value: mySelection,
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(25),
                  //   child: ElevatedButton(
                  //     child: Text(
                  //       'LogIn',
                  //       style: TextStyle(fontSize: 20.0),
                  //     ),
                  //     color: Colors.blueAccent,
                  //     textColor: Colors.white,
                  //     onPressed: () {},
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: ElevatedButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      onPressed: () {
                        //asyncFunc(mySelection);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Productpage(
                            categoryId: 1,
                            cityName: mySelection,
                          ),
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ])));
  }
}





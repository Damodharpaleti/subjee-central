import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subjeecentral/Drawer.dart';
import 'package:subjeecentral/models/LocalLoinresponse.dart';

import 'package:subjeecentral/components/globals.dart' as globals;
import 'package:subjeecentral/pages/login.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  bool? namevisible;
  bool? loginvisible;
  String? name;

  MyHomePage({this.namevisible, this.loginvisible, this.name});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool flg = true;
  int counter = 0;
  late int categoryId;
  late String pSname;
  late LocalloginResponse userdata;

  Future<LocalloginResponse> getlocaldata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString("localresponse");
    globals.isLoggedIn = true;
    if (data != null) {
      userdata = new LocalloginResponse.fromJson(json.decode(data));
      this.widget.name = userdata.name ?? '';
    }
    String? data2 = prefs.getString("Eachproduct");
    if (data2 != null) {
      List l = json.decode(data2);
      counter = l.length;
    }
  
    return userdata;
  }

  @override
  Widget build(BuildContext context) {
    return gethomepagedetail();
  }

  Widget gethomepagedetail() {
    return FutureBuilder(
        future: getlocaldata(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            if (globals.isLoggedIn == true) {
              this.widget.namevisible = true;
              this.widget.loginvisible = false;
              return homepagewidget(context);
            }
          } else {
            this.widget.namevisible = false;
            this.widget.loginvisible = true;
          }
          return homepagewidget(context);
        });
  }

  PreferredSizeWidget basicappbar() {
    return AppBar(
      backgroundColor: Colors.green[900],
      //leading: Image.asset('assets/images/logo.png'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: this.widget.namevisible ?? false,
                  child: GestureDetector(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            this.widget.name ?? '',
                            style: TextStyle(fontSize: 13),
                          ),
                          CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.person),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Visibility(
                  visible: this.widget.loginvisible ?? false,
                  child: GestureDetector(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.red)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Login & Sign up',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Login()));
                              }),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        // new IconButton(
        //     icon: new Icon(
        //       Icons.shopping_cart,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //         builder: (context) => CartPage(),
        //       ));
        //     }),
        Container(
          // padding: EdgeInsets.only(right: 10),
          padding: EdgeInsets.only(top: 10),
          child: new Stack(
            children: <Widget>[
              new IconButton(
                  // icon: Icon(Icons.notifications),
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => CartPage(
                    //           username: this.widget.name != null
                    //               ? this.widget.name
                    //               : '',
                    //           namevisible: this.widget.namevisible,
                    //           loginvisible: this.widget.loginvisible,
                    //         )));
                  }),
              counter != 0
                  ? new Positioned(
                      right: 4,
                      top: 6,
                      child: new Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '$counter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : new Container()
            ],
          ),
        ),

        ///
        // Icon(
        //   Icons.notifications_none,
        //   color: Colors.white,
        // ),
        SizedBox(
          width: 20,
        ),
      ],
      // title: TextField(
      //   decoration: InputDecoration(
      //       filled: true,
      //       fillColor: Colors.white,
      //       contentPadding:
      //           const EdgeInsets.only(left: 4.0, bottom: 8.0, top: 8.0),
      //       hintText: 'Search',
      //       focusColor: Colors.black,
      //       border: OutlineInputBorder(),
      //       prefixIcon: Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       )),
      // ),
      ////////////////
      // title: Container(
      //   height: 35.0,
      //   padding: EdgeInsets.only(left: 129, right: 5),
      //   child: TextField(
      //     textInputAction: TextInputAction.search,
      //     onSubmitted: (value) {
      //       String searchInput = value.toString().toLowerCase();
      //       pSname = searchInput;
      //       // if (searchInput == "vegetables") {
      //       //   categoryId = 2;
      //       // } else if (searchInput == "fruits") {
      //       //   categoryId = 1;
      //       // } else if (searchInput == "groceries") {
      //       //   categoryId = 3;
      //       // } else {
      //       //   print("nothing");
      //       // }
      //       print("search>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      //       print(value);
      //       print(categoryId);
      //       // Navigator.push(
      //       //     context,
      //       //     MaterialPageRoute(
      //       //         builder: (context) => ProductPage(
      //       //               categoryId: categoryId,
      //       //               //categoryId: data.categoryId,
      //       //               username:
      //       //                   this.widget.name != null ? this.widget.name : '',
      //       //               namevisible: this.widget.namevisible,
      //       //               loginvisible: this.widget.loginvisible,
      //       //             )));
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => result(
      //                     categoryId: categoryId,
      //                     pname: pSname,
      //                     username: globals.isLoggedIn == true
      //                         ? globals.username
      //                         : 'user',
      //                     namevisible:
      //                         globals.isLoggedIn == true ? true : false,
      //                     loginvisible:
      //                         globals.isLoggedIn == true ? false : true,
      //                     //categoryId: data.categoryId,
      //                     // username:
      //                     //     this.widget.name != null ? this.widget.name : '',
      //                     // namevisible: this.widget.namevisible,
      //                     // loginvisible: this.widget.loginvisible,
      //                   )));
      //       print("search>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      //     },
      //     decoration: InputDecoration(
      //         filled: true,
      //         fillColor: Colors.white,
      //         contentPadding:
      //             const EdgeInsets.only(left: 4.0, bottom: 8.0, top: 8.0),
      //         hintText: 'Search',
      //         focusColor: Colors.black,
      //         enabledBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(color: Colors.white, width: 2.0),
      //           borderRadius: BorderRadius.circular(25.0),
      //         ),
      //         prefixIcon: Icon(
      //           Icons.search,
      //           color: Colors.black,
      //         )),
      //   ),
      // ),
      ////////////////
      title: Text("My Home"),
    );
  }

  Widget homepagewidget(BuildContext context) {
    return Scaffold(
      appBar: basicappbar(),
      drawer: SideMenuDrawer(),
      body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              imageCarousel(context),
              Padding(
                padding: const EdgeInsets.all(0),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     WidgetCategory(
                //       username:
                //           this.widget.name != null ? this.widget.name : '',
                //       namevisible: this.widget.namevisible,
                //       loginvisible: this.widget.loginvisible,
                //     ),
                //   ],
                // ),
              )
            ],
          )),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

Widget imageCarousel(BuildContext context) {
  return new Container(
    width: MediaQuery.of(context).size.width,
    height: 400.0,
    child: CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
      items: [
        'assets/images/Banner3.jpg',
        'assets/images/bg1.png',
        'assets/images/bg5.png',
      ].map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                item,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    ),
  );
}

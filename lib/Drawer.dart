import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subjeecentral/models/LocalLoinresponse.dart';
import 'package:subjeecentral/models/LoginRespose.dart';
import 'package:subjeecentral/components/globals.dart' as globals;
import 'package:subjeecentral/pages/AddTransporterPage.dart';
import 'package:subjeecentral/pages/HomePage.dart';
import 'package:subjeecentral/pages/NonServicePincodes.dart';
import 'package:subjeecentral/pages/PartnerList.dart';
import 'package:subjeecentral/pages/UserFeedbackpage.dart';
import 'package:subjeecentral/pages/addproduct.dart';
import 'package:subjeecentral/pages/login.dart';
import 'package:subjeecentral/pages/orders.dart';
import 'package:subjeecentral/pages/privacypolacies.dart';
import 'package:subjeecentral/pages/promocodelist.dart';
import 'package:subjeecentral/pages/updatePricePage.dart';
import 'package:subjeecentral/pages/updateSamarpanPricePage.dart';
import 'package:subjeecentral/pages/termsandconditions%20.dart';

class SideMenuDrawer extends StatefulWidget {
  @override
  SideMenuDrawerState createState() => SideMenuDrawerState();
}

class SideMenuDrawerState extends State<SideMenuDrawer> {
  late int l;
  int i = 0;
  bool loged = false;
  late String userName;
  late String userEmail;
  late LoginResponse lr;
  late LocalloginResponse lrd;
  String role = "User";

  @override
  void initState() {
    fetch();
    super.initState();

    // var orderProvider = Provider.of<CartProvider>(context, listen: false);
    // orderProvider.fetchOrders();
  }

  Future<LocalloginResponse> fetch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>");
    //print(lr.firstName);
    //print(ldb.firstName);
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>");
    Map<String, dynamic>? userMap;
    final String? userStr = prefs.getString('localresponse');
    final String? roleTemp = prefs.getString("ROLE");
    role = roleTemp ?? "User";
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
    }

    if (userMap != null) {
      globals.isLoggedIn = true;
      // globals.userRole = role;
      print(">>>>>>>>>>>>>>++++++++++++++++++>>>>>>>>>");
      print(globals.isLoggedIn);
      print(role);
      final LocalloginResponse user = LocalloginResponse.fromJson(userMap);
      print("inside Details");
      print(user);
      lrd = user;
      print(user.mobileNumber);
      userName = user.name ?? "User";
      //userEmail = user.emailId;
      l = 1;
      // var orderProvider = Provider.of<CartProvider>(context, listen: false);
      // orderProvider.fetchOrders(token, mobileNumber);
      print(user.name);
      print("inside Drawer Details");

      return user;
    }
    throw Exception("No user logged in");
  }

  // void setUserDetails(String user, String email) {
  //   userName = user;
  //   userEmail = email;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Container(
          //  color: Colors.greenAccent.withOpacity(0.3),
          child: ListView(
            //color: Colors.greenAccent.withOpacity(0. 3),
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: globals.isLoggedIn == true
                    ? Container(
                        padding: EdgeInsets.only(left: 13, bottom: 20),
                        child: Text(globals.username))
                    : Container(
                        padding: EdgeInsets.only(left: 13, bottom: 20),
                        child: Text("user")),
                // accountEmail:
                //     (l == 1) ? Text(userEmail) : Text("user@gmail.com"),
                //currentAccountPicture: Image.asset('assets/images/logo.png'),
                currentAccountPicture: Container(
                  // padding: EdgeInsets.only(left: 70),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/userProfile.jpg"),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.green[900]),
                accountEmail: null,
              ),
              // DrawerHeader(
              //   child: Text('SUYOGA'),
              //   decoration: BoxDecoration(
              //     color: Colors.green[900],
              //   ),
              // ),

              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.green[900],
                ),
                title: Text(
                  'My Home',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green[900]),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
                },
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.greenAccent,
              ),
              // Center(
              //   child: globals.isLoggedIn == true
              //       ? Container(
              //           child: ListTile(
              //             leading: Icon(
              //               Icons.person,
              //               color: Colors.green[900],
              //             ),
              //             title: Text(
              //               'Profile',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.green[900]),
              //             ),
              //             onTap: () {

              //             },
              //           ),
              //         )
              //       : Container(

              //           ),
              // ),
              // Center(
              //   child: globals.isLoggedIn == true
              //       ? Container(
              //           child: Divider(
              //             height: 1,
              //             thickness: 1,
              //             color: Colors.greenAccent,
              //           ),
              //         )
              //       : Container(),
              // ),
              Center(
                child: globals.isLoggedIn == true &&
                        role != "ROLE_SUYOGA_CITY_ADMIN" &&
                        role != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.list,
                            color: Colors.green[900],
                          ),
                          title: Text(
                            'Orders',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => orders()),
                            );
                            // // Update the state of the app.
                            // ...
                          },
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.greenAccent,
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.shop,
                            color: Colors.green[900],
                          ),
                          title: Text(
                            'Products',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // builder: (context) => cityList()),
                                  builder: (context) => updatePricePage()),
                              //updatePricePage
                            );
                            // // Update the state of the app.
                            // ...
                          },
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.greenAccent,
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.shop,
                            color: Colors.green[900],
                          ),
                          title: Text(
                            'Samarpana Products',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // builder: (context) => cityList()),
                                  builder: (context) =>
                                      updateSamarpanaPricePage(
                                        cid: 2,
                                      )),
                              //updatePricePage
                            );
                          },
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.greenAccent,
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.shop,
                            color: Colors.green[900],
                          ),
                          title: Text(
                            'Add Products',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddProductPage()),
                            );
                            // // Update the state of the app.
                            // ...
                          },
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.greenAccent,
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.emoji_transportation,
                            color: Colors.green[900],
                          ),
                          title: Text(
                            'Add Transporter',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddTransporterPage()),
                            );
                            // // Update the state of the app.
                            // ...
                          },
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.greenAccent,
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.edit,
                            color: Colors.green[900],
                          ),
                          title: Text(
                            'Add Pincode',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => partnerList()),
                              // builder: (context) => DataTableDemo()),
                            );
                            // // Update the state of the app.
                            // ...
                          },
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.greenAccent,
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                            globals.userRole == "ROLE_SUYOGA_CITY_ADMIN" ||
                        globals.userRole == "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.edit,
                            color: Colors.green[900],
                          ),
                          title: Text(
                            'Update Price',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => updatePricePage()),
                              // builder: (context) => DataTableDemo()),
                            );
                            // // Update the state of the app.
                            // ...
                          },
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                            globals.userRole == "ROLE_SUYOGA_CITY_ADMIN" ||
                        globals.userRole == "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.greenAccent,
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.feedback,
                            color: Colors.green[900],
                          ),
                          title: Text(
                            'User FeedBack',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserFeedBackPage()),
                            );
                            // // Update the state of the app.
                            // ...
                          },
                        ),
                      )
                    : Container(),
              ),
              Center(
                child: globals.isLoggedIn == true &&
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                        globals.userRole != "ROLE_MANAGING_PARTNER"
                    ? Container(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.greenAccent,
                        ),
                      )
                    : Container(),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.green[900],
                ),
                title: Text(
                  'Add Promocode',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green[900]),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PromoCodeList(),
                  ));
                },
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.greenAccent,
              ),
              ListTile(
                leading: Icon(
                  Icons. edit_off,
                  color: Colors.green[900],
                ),
                title: Text(
                  'Non Service Pincodes',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green[900]),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NonServicePincodeslist(
                      subjeepincodeId: 1,
                    ),
                  ));
                },
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.greenAccent,
              ),

              ListTile(
                leading: Icon(
                  Icons.photo_album_outlined,
                  color: Colors.green[900],
                ),
                title: Text(
                  'Terms & Conditions',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green[900]),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TermsAndConditions(),
                  ));
                },
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.greenAccent,
              ),

              ListTile(
                leading: Icon(
                  Icons.policy,
                  color: Colors.green[900],
                ),
                title: Text(
                  'Privacy Policies',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green[900]),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Privacypolacies1(),
                  ));
                },
              ),

              Divider(
                height: 1,
                thickness: 1,
                color: Colors.greenAccent,
              ),

              // ListTile(
              //   leading: Icon(
              //     Icons.home,
              //     color: Colors.green[900],
              //   ),
              //   title: Text(
              //     'SuyogaShippingAndDeliveryPolacy',
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold, color: Colors.green[900]),
              //   ),
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => suyogaShippingAndDeliveryPolacy(),
              //     ));
              //   },
              // ),

              // Divider(
              //   height: 1,
              //   thickness: 1,
              //   color: Colors.greenAccent,
              // ),
              // ListTile(
              //   leading: Icon(
              //     Icons.home,
              //     color: Colors.green[900],
              //   ),
              //   title: Text(
              //     'SuyogaRefundAndCancellationpolacy',
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold, color: Colors.green[900]),
              //   ),
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => suyogaRefundAndCancellationPolacy(),
              //     ));
              //   },
              // ),

              Divider(
                height: 1,
                thickness: 1,
                color: Colors.greenAccent,
              ),

              Center(
                child: globals.isLoggedIn == true
                    ? Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.green[900],
                          ),
                          title: Text(
                            'Logout',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                          ),
                          onTap: () {
                            _showDialog();
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => MyHomePage(),
                            // ));
                          },
                        ),
                      )
                    : Container(),
              ),
              Divider(
                height: 3,
                thickness: 5,
                //color: Colors.green[900],
              ),
              Container(
                  padding: EdgeInsets.only(top: 15, left: 20),
                  child: Text("CONTACT US",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black))),
              Container(
                  padding: EdgeInsets.only(top: 8, left: 20),
                  child: Text("WhatsApp us: 9980452545",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black))),
              Container(
                  padding: EdgeInsets.only(top: 8, left: 20),
                  child: Text("Call Us : 9980452545",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black))),
              Container(
                  padding: EdgeInsets.only(top: 8, left: 20),
                  child: Text("6:00 AM to 8:00 PM, 365 days",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black))),

              Container(
                  padding: EdgeInsets.only(top: 68, left: 20),
                  child: Text("DOWNLOAD APP",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black))),
              ////
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 5),
                    child: Column(
                      // children: [image: Image.asset('assets/images/logo.png')],
                      children: [
                        new Image.asset(
                          'assets/images/AppStore1.png',
                          height: 90.0,
                          width: 90.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 5),
                    child: Column(
                      children: [
                        new Image.asset(
                          'assets/images/googlePlaystorelogo.png',
                          height: 120.0,
                          width: 120.0,
                        ),
                      ],
                    ),
                  )
                ],
              )

              ///
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Suyoga"),
          content: new Text("Are you sure you want to Logout"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: new Text("YES"),
              onPressed: () {
                globals.isLoggedIn = false;
                // prefs.clear();
                prefs.remove("localresponse");
                prefs.remove("Eachproduct");
                prefs.remove("loginmobileNumber");
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Login(),
                ));
              },
            ),
          ],
        );
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subjeecentral/api_service.dart';
import 'package:subjeecentral/models/LoginRespose.dart';
import 'package:subjeecentral/pages/HomePage.dart';
import 'package:subjeecentral/components/globals.dart' as globals;
import 'package:subjeecentral/utils/form_helper.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  bool loged = false;
  //final dbHelper = DBProvider.instance;
  // SharedPref sharedPref = SharedPref();
  List<LoginResponse> user = [];
  // LoginresponseDB localloginResponsesave = LoginresponseDB();
  //LoginresponseDB localloginResponseLoad = LoginresponseDB();
  bool hidePassword = true;

  bool isApiCallProcess = false;
  late APIService apiService;
  late String password;
  late String username;
  String pending = "P";
  bool priceupdate_value = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool valid_otp = false;
  List _isHovering = [false, false, false, false];
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isenable = false;
  bool enabled = false;
  @override
  void initState() {
    super.initState();
    apiService = new APIService();
    setState(() {
      valid_otp;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: Container(
            color: Colors.green[900],
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text('EXPLORE'),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              _isHovering[0] = value;
                            });
                          },
                          onTap: () {},
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Text('Discover',
                                style: TextStyle(
                                  color: _isHovering[0]
                                      ? Colors.white
                                      : Colors.black,
                                )),
                            SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[0],
                              child: Container(
                                height: 2,
                                width: 40,
                                color: Colors.white,
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(width: screenSize.width / 20),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Contact Us',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Text(
                  //     'Sign Up',
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                  SizedBox(
                    width: screenSize.width / 50,
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Text(
                  //     'Login',
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: Form(
            key: globalFormKey,
            child: Container(
              height: screenSize.height / 1.2,
              width: screenSize.width / 1.5,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  elevation: 5.0,
                  //  color: Colors.greenAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(16),
                        //       //  border: Border.all(),
                        //       color: Colors.greenAccent,
                        //     ),
                        //     height: screenSize.height / 1.5,
                        //     width: screenSize.width / 5,
                        //     //  color: Colors.white,
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         SizedBox(
                        //           height: 10,
                        //         ),
                        //         Text("Welcome to SuyogaCentral")
                        //       ],
                        //     )),
                        //  if (valid_otp == false)
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Welcome to SuyogaCentral",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 70,
                              child: Image.asset('assets/images/logo.png',
                                  width: 100, height: 100, fit: BoxFit.fill),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                                width: screenSize.width / 3,
                                child: TextFormField(
                                  inputFormatters: [
                                    new LengthLimitingTextInputFormatter(10),
                                  ],
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Icon(
                                          Icons.phone,
                                          size: 26,
                                          color: Colors.black,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(255, 95, 167, 1),
                                          )),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      hintText: "Mobile Number ",
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 19,
                                      )),
                                  onChanged: (text) {
                                    username = text;
                                  },
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: Colors.black,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            if (priceupdate_value)
                              SizedBox(
                                  width: screenSize.width / 3,
                                  child: TextFormField(
                                    inputFormatters: [
                                      new LengthLimitingTextInputFormatter(4),
                                    ],
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Icon(
                                            Icons.phone,
                                            size: 26,
                                            color: Colors.black,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                            borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 95, 167, 1),
                                            )),
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        hintText: "OTP Number ",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                        )),
                                    onChanged: (text) {
                                      password = text;
                                    },
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: Colors.black,
                                  )),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    backgroundColor: isenable ? Colors.green : Colors.red,
                                    shape: StadiumBorder(),
                                  ),
                                  onPressed: () async {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    if (valid_otp == false) {
                                      setState(() {
                                        isApiCallProcess = true;
                                        isenable = !isenable;
                                        enabled = !enabled;
                                        priceupdate_value = true;
                                      });
                                      apiService
                                          .loginOTP(username)
                                          .then((value) {
                                        if (value) {
                                          valid_otp = true;
                                          globals.isLoggedIn = true;
                                          FormHelper.showMessage(
                                              context,
                                              "SUYOGA",
                                              "OTP send sucessfully to your mobile number",
                                              "OK", () {
                                            // _insert(value);
                                            Navigator.of(context).pop();
                                          });
                                        } else {
                                          FormHelper.showMessage(
                                              context,
                                              "SUYOGA",
                                              "Login Failed, Please Enter Valid Details",
                                              "OK", () {
                                            // _insert(value);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Login(),
                                              ),
                                            );
                                          });
                                        }
                                      });
                                    } else {
                                      apiService
                                          .login(username, password)
                                          .then((value) {
                                        print(prefs.getString("ROLE"));
                                        String? role = prefs.getString("ROLE");
                                        if (role != null &&
                                            role.isNotEmpty) {
                                          if (role.contains(
                                                  "ROLE_SAMARPANA_ADMIN") ||
                                              role.contains(
                                                  "ROLE_MANAGING_PARTNER") ||
                                              role.contains(
                                                  "ROLE_SUYOGA")) {
                                            print("this comes if role matches");
                                            print(prefs.getString("ROLE"));
                                            FormHelper.showMessage(
                                                context,
                                                "Suyoga Samarpana",
                                                "Login Successfull",
                                                "OK", () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyHomePage()),
                                              );
                                            });
                                          } else {
                                            prefs.remove("ROLE");
                                            FormHelper.showMessage(
                                                context,
                                                "SUYOGA",
                                                "Suyoga Central login Role does not assigned",
                                                "OK", () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Login(),
                                                ),
                                              );
                                            });
                                          }
                                        } else {
                                          prefs.remove("ROLE");
                                          FormHelper.showMessage(
                                              context,
                                              "SUYOGA",
                                              "Login Failed, Please Enter Valid Details",
                                              "OK", () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Login(),
                                              ),
                                            );
                                          });
                                        }
                                      });
                                      //          if (value != null &&
                                      //   prefs.getString("ROLE").isNotEmpty)
                                      // {
                                      //   if (prefs
                                      //           .getString("ROLE")
                                      //           .contains("ROLE_DELIVERY_PARTNER") ||
                                      //       prefs
                                      //           .getString("ROLE")
                                      //           .contains("ROLE_SAMARPANA_ADMIN") ||
                                      //       prefs
                                      //           .getString("ROLE")
                                      //           .contains("ROLE_MANAGING_PARTNER"))
                                      //     {
                                      //             valid_otp = true;
                                      //             globals.isLoggedIn = true;
                                      //             FormHelper.showMessage(
                                      //                 context,
                                      //                 "SUYOGA",
                                      //                 "Login Successful",
                                      //                 "OK", () {
                                      //               // _insert(value);
                                      //               Navigator.push(
                                      //                 context,
                                      //                 MaterialPageRoute(
                                      //                   builder: (context) =>
                                      //                       MyHomePage(),
                                      //                 ),
                                      //               );
                                      //             });
                                      //           } else {
                                      //             FormHelper.showMessage(
                                      //                 context,
                                      //                 "SUYOGA",
                                      //                 "Login Failed, Please Enter Valid Details",
                                      //                 "OK", () {
                                      //               // _insert(value);
                                      //               Navigator.push(
                                      //                 context,
                                      //                 MaterialPageRoute(
                                      //                   builder: (context) => Login(),
                                      //                 ),
                                      //               );
                                      //             });
                                      //           }
                                      //         });
                                    }
                                  },
                                  child: enabled
                                      ? Text("Submit OTP",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          ))
                                      : Text("Generate OTP",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          )),
                                ),
                                // FlatButton(
                                //   padding: EdgeInsets.symmetric(
                                //       horizontal: 40, vertical: 15),
                                //   onPressed: () {
                                //     //  print("deleted");
                                //     print(password);
                                //     if (username != null) {
                                //       setState(() {
                                //         isApiCallProcess = true;
                                //       });
                                //       print(username + password);
                                //       apiService
                                //           .login(username, password)
                                //           .then((value) => {
                                //                 if (value != null)
                                //                   {
                                //                     valid_otp = true,
                                //                     globals.isLoggedIn = true,
                                //                     FormHelper.showMessage(
                                //                         context,
                                //                         "SUYOGA",
                                //                         "Login Successful",
                                //                         "OK", () {
                                //                       // _insert(value);
                                //                       Navigator.push(
                                //                         context,
                                //                         MaterialPageRoute(
                                //                           builder: (context) =>
                                //                               MyHomePage(),
                                //                         ),
                                //                       );
                                //                     }),
                                //                   }
                                //                 else
                                //                   {
                                //                     FormHelper.showMessage(
                                //                         context,
                                //                         "SUYOGA",
                                //                         "Login Failed, Please Enter Valid Details",
                                //                         "OK", () {
                                //                       // _insert(value);
                                //                       Navigator.push(
                                //                         context,
                                //                         MaterialPageRoute(
                                //                           builder: (context) =>
                                //                               Login(),
                                //                         ),
                                //                       );
                                //                     }),
                                //                   }
                                //               });
                                //     } else {
                                //       FormHelper.showMessage(
                                //           context,
                                //           "SUYOGA",
                                //           "Login Failed, Please Enter Valid Details",
                                //           "OK", () {
                                //         Navigator.of(context).pop();
                                //       });
                                //     }
                                //   },
                                //   child: Text(
                                //     "Submit OTP",
                                //     style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 24,
                                //     ),
                                //   ),
                                //   color: Colors.green,
                                //   shape: StadiumBorder(),
                                // ),
                              ],
                            )
                          ],
                        )),
                      ],
                    ),
                  )),
            ),
          ),
        ));
  }

  bool validateandSave() {
    if (_formkey.currentState?.validate() ?? false) {
      _formkey.currentState?.save();
      return true;
    }
    return false;
  }
}
    // return Scaffold(
    //     body: ProgressHUD(
    //         child: new Form(
    //           key: _formkey,
    //           child: formui(),
    //         ),
    //         inAsyncCall: isApiCallProcess,
    //         opacity: 0.3));
  


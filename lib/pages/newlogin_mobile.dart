
import 'package:flutter/material.dart';
import 'package:subjeecentral/api_service.dart';
import 'package:subjeecentral/models/LoginRespose.dart';
import 'package:subjeecentral/pages/HomePage.dart';
import 'package:subjeecentral/utils/ProgressHUD.dart';
import 'package:subjeecentral/components/globals.dart' as globals;

class mobileLogin extends StatefulWidget {
  @override
  mobileLoginState createState() => mobileLoginState();
}

class mobileLoginState extends State<mobileLogin> {
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
  String? username;
  String pending = "P";
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    apiService = new APIService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ProgressHUD(
            child: new Form(
              key: _formkey,
              child: formui(),
            ),
            inAsyncCall: isApiCallProcess,
            opacity: 0.3));
  }

  Widget formui() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
          child: LayoutBuilder(builder: (context, Constraints) {
            if (Constraints.maxWidth < 768) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                elevation: 5.0,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 7.3,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.red[400],
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 85.0, right: 25.0, left: 25.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 6.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 55.0, bottom: 5.0),
                                  child: Text(
                                    "Welcome",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  child: Text(
                                    "Please enter your Details to Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //gggg
                      Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.grey[400],
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: [
                                  SizedBox(height: 3),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 40,
                                        right: 40,
                                        top: 60,
                                        bottom: 10),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 50,
                                      child: Image.asset(
                                          'assets/images/logo.png',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        // padding: EdgeInsets.only(
                                        //     left: 10, right: 10),
                                        child: Container(
                                          height: 50,
                                          width: 400,
                                          // width: double.infinity,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: TextFormField(
                                            onSaved: (input) =>
                                                username = input,
                                            validator: (input) => (input?.length ?? 0) <
                                                    10
                                                ? "Please Enter Valid Mobile Number"
                                                : null,
                                            decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Icon(
                                                    Icons.phone,
                                                    size: 20,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                border: InputBorder.none,
                                                hintText: "Mobile Number",
                                                hintStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 19,
                                                )),
                                            style:
                                                TextStyle(color: Colors.black),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            textInputAction:
                                                TextInputAction.next,
                                            cursorColor: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Container(
                                          height: 50,
                                          // width: double.infinity,
                                          // height:
                                          //   MediaQuery.of(context).size.height / 2,
                                          width: 400,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: TextFormField(
                                            onSaved: (input) =>
                                                password = input ?? '',
                                            validator: (input) => (input?.length ?? 0) <
                                                    3
                                                ? "Password should be more than 3 characters"
                                                : null,
                                            obscureText: hidePassword,
                                            decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                    color: Colors.red),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Icon(
                                                    Icons.lock,
                                                    size: 20,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      hidePassword =
                                                          !hidePassword;
                                                    });
                                                  },
                                                  color: Colors.green
                                                      .withOpacity(0.9),
                                                  icon: Icon(hidePassword
                                                      ? Icons.visibility_off
                                                      : Icons.visibility),
                                                ),
                                                border: InputBorder.none,
                                                hintText: "Password",
                                                hintStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 19,
                                                )),
                                            style:
                                                TextStyle(color: Colors.black),
                                            keyboardType: TextInputType.name,
                                            textInputAction:
                                                TextInputAction.done,
                                            cursorColor: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 1),
                                      GestureDetector(
                                          // child: Text(
                                          //   'Forgot Password',
                                          //   style: TextStyle(
                                          //       fontSize: 20, color: Colors.green),
                                          // ),
                                          child: ElevatedButton(
                                        onPressed: () {
                                          print("forgot password Clickd>>>>");
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => ForgotPassword(),
                                          //   ),
                                          // );
                                        },
                                        child: Text(
                                          'Forgot Password',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.green),
                                        ),
                                      )),
                                      SizedBox(height: 35),
                                    ],
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white, backgroundColor: Colors.green[900],
                                    ),
                                    onPressed: () {
                                      //  print("deleted");
                                      if (validateandSave()) {
                                        setState(() {
                                          isApiCallProcess = true;
                                        });
                                        print('$username$password');
                                        apiService
                                            .login(username ?? '', password)
                                            .then((value) => {
                                                  {
                                                    globals.isLoggedIn = true,
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyHomePage(
                                                                //status: pending,
                                                                ),
                                                      ),
                                                    ),
                                                  }
                                                });
                                      }
                                    },
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      //gggg
                    ],
                  ),
                ),
              );
            } else {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                elevation: 5.0,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 3.3,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.red[400],
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 85.0, right: 50.0, left: 50.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 60.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  child: Text(
                                    "Welcome",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  child: Text(
                                    "Please enter your Details to Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //gggg
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: [
                                  SizedBox(height: 30),
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 50,
                                    child: Image.asset('assets/images/logo.png',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fill),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Container(
                                          height: 60,
                                          width: 480,
                                          // width: double.infinity,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: TextFormField(
                                            onSaved: (input) =>
                                                username = input,
                                            validator: (input) => (input?.length ?? 0) <
                                                    10
                                                ? "Please Enter Valid Mobile Number"
                                                : null,
                                            decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Icon(
                                                    Icons.phone,
                                                    size: 26,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                border: InputBorder.none,
                                                hintText: "Mobile Number",
                                                hintStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 19,
                                                )),
                                            style:
                                                TextStyle(color: Colors.black),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            textInputAction:
                                                TextInputAction.next,
                                            cursorColor: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Container(
                                          height: 60,
                                          // width: double.infinity,
                                          // height:
                                          //   MediaQuery.of(context).size.height / 2,
                                          width: 480,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: TextFormField(
                                            onSaved: (input) =>
                                                password = input ?? '',
                                            validator: (input) => (input?.length ?? 0) <
                                                    3
                                                ? "Password should be more than 3 characters"
                                                : null,
                                            obscureText: hidePassword,
                                            decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                    color: Colors.red),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Icon(
                                                    Icons.lock,
                                                    size: 26,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      hidePassword =
                                                          !hidePassword;
                                                    });
                                                  },
                                                  color: Colors.green
                                                      .withOpacity(0.9),
                                                  icon: Icon(hidePassword
                                                      ? Icons.visibility_off
                                                      : Icons.visibility),
                                                ),
                                                border: InputBorder.none,
                                                hintText: "Password",
                                                hintStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 19,
                                                )),
                                            style:
                                                TextStyle(color: Colors.black),
                                            keyboardType: TextInputType.name,
                                            textInputAction:
                                                TextInputAction.done,
                                            cursorColor: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 1),
                                      GestureDetector(
                                          // child: Text(
                                          //   'Forgot Password',
                                          //   style: TextStyle(
                                          //       fontSize: 20, color: Colors.green),
                                          // ),
                                          child: ElevatedButton(
                                        onPressed: () {
                                          print("forgot password Clickd>>>>");
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => ForgotPassword(),
                                          //   ),
                                          // );
                                        },
                                        child: Text(
                                          'Forgot Password',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green),
                                        ),
                                      )),
                                      SizedBox(height: 35),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      //  print("deleted");
                                      if (validateandSave()) {
                                        setState(() {
                                          isApiCallProcess = true;
                                        });
                                        print('$username$password');
                                        apiService
                                            .login(username ?? '', password)
                                            .then((value) => {
                                                  {
                                                    globals.isLoggedIn = true,
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyHomePage(
                                                                //status: pending,
                                                                ),
                                                      ),
                                                    ),
                                                  }
                                                });
                                      }
                                    },
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      //gggg
                    ],
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }

  bool validateandSave() {
    final form = _formkey.currentState;
    if (form?.validate() ?? false) {
      form?.save();
      return true;
    }
    return false;
  }
}

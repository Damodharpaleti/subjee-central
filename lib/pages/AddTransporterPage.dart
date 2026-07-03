import 'package:flutter/material.dart';

// class AddProductPage extends StatefulWidget {
//   @override
//   _AddProductPageState createState() => _AddProductPageState();
// }

// class _AddProductPageState extends State<AddProductPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:flutter/services.dart';
import 'package:subjeecentral/models/AddTransporterModel.dart';
import 'package:subjeecentral/pages/HomePage.dart';
import 'package:subjeecentral/pages/updatePricePage.dart';
import 'package:subjeecentral/utils/ProgressHUD.dart';

import '../api_service.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../utils/form_helper.dart';

class AddTransporterPage extends StatefulWidget {
  @override
  _AddTransporterPageState createState() => _AddTransporterPageState();
}

class _AddTransporterPageState extends State<AddTransporterPage> {
  late APIService apiService;
  bool isApicallProcess = false;
  bool hidePassword = true;
  // User usersignup;
  late AddTransporterModel addtransporterModel;
  bool isApiCallProcess = false;
  late String password;
  late String lastname;
  late String city;
  String phoneno = '';
  late String mailId;
  late String pincode;
  late String firstname;
  String username = "user";
  String pending = "P";
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late SharedPreferences sharedPrefs;

  @override
  void initState() {
    super.initState();
    apiService = new APIService();
    addtransporterModel = new AddTransporterModel(
      mobileNumber: '',
      emailId: '',
      firstName: '',
      lastName: '',
      location: '',
      address: '',
      transportName: '',
      state: '',
      pinCode: '',
    );
    // this.updatemodel.productId = 0;
    // this.updatemodel.active = "1";

    // this.updatemodel.productvendor = "";
    // this.updatemodel.productweight = "";
    // this.updatemodel.productweightunit = "";

    // this.updatemodel.priceminquantity = 1;
    // this.updatemodel.brandName = "";
    // this.updatemodel.productTitle = "";
    // this.updatemodel.productTitle = "";
    //updatemodel.product_code = this.widget.pdata.productCode;
    print("product code>>>>>>>>>>>>>>>");

    //  usersignup = new User();
    //  this.getSWData();
  }

  // final String url = Config.url + Config.cityList;
  // List data = List();

  // Future<String> getSWData() async {
  //   var res = await http
  //       .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
  //   var resBody = json.decode(res.body);
  //   setState(() {
  //     data = resBody;
  //   });
  //   print(resBody);
  //   return "Sucess";
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: ProgressHUD(
  //           child: new Form(
  //             key: _formkey,
  //             child: formui(),
  //           ),
  //           inAsyncCall: isApicallProcess,
  //           opacity: 0.3));
  // }
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  // Widget _uiSetup() {
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Transporter"),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[], systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      backgroundColor: Colors.greenAccent.withOpacity(0.3),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, Constraints) {
          if (Constraints.maxWidth < 768) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 16, left: 12, right: 12),
                child: Form(
                    key: globalFormKey,
                    child: Column(children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Padding(),
                          Container(
                            // height: 40,
                            // width: 420,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onSaved: (input) =>
                                  this.addtransporterModel.firstName = input ?? '',
                              validator: (input) =>
                                  (input?.isEmpty ?? true) ? "First name" : null,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(top: 6.8, left: 1),
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 20),
                                    // child: Icon(
                                    //   Icons.verified,
                                    //   size: 26,
                                    //
                                    // ),
                                    child: Text("First name :",
                                        style: TextStyle(
                                            // height: 5,
                                            fontSize: 19)),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    fontSize: 19,
                                  )),
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Padding(),
                            Container(
                              // height: 40,
                              // width: 420,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onSaved: (input) =>
                                    this.addtransporterModel.lastName = input ?? '',
                                validator: (input) =>
                                    (input?.isEmpty ?? true) ? "last name" : null,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(top: 6.8, left: 1),
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: 20),
                                      // child: Icon(
                                      //   Icons.verified,
                                      //   size: 26,
                                      //
                                      // ),
                                      child: Text("Last name :",
                                          style: TextStyle(
                                              // height: 5,
                                              fontSize: 19)),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "",
                                    hintStyle: TextStyle(
                                      fontSize: 19,
                                    )),
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // height: 40,
                              // width: 420,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onSaved: (input) =>
                                    this.addtransporterModel.address = input ?? '',
                                validator: (input) =>
                                    (input?.isEmpty ?? true) ? "Address " : null,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(top: 6.8, left: 1),
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: 20),
                                      // child: Icon(
                                      //   Icons.verified,
                                      //   size: 26,
                                      //
                                      // ),
                                      child: Text("Address  :",
                                          style: TextStyle(
                                              // height: 5,
                                              fontSize: 19)),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "",
                                    hintStyle: TextStyle(
                                      fontSize: 19,
                                    )),
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // height: 40,
                              // width: 420,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onSaved: (input) =>
                                    this.addtransporterModel.location = input ?? '',
                                validator: (input) =>
                                    (input?.isEmpty ?? true) ? "Location " : null,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(top: 6.8, left: 1),
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: 20),
                                      // child: Icon(
                                      //   Icons.verified,
                                      //   size: 26,
                                      //
                                      // ),
                                      child: Text("Location :",
                                          style: TextStyle(
                                              // height: 5,
                                              fontSize: 19)),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "",
                                    hintStyle: TextStyle(
                                      fontSize: 19,
                                    )),
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // height: 40,
                              // width: 420,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onSaved: (input) =>
                                    this.addtransporterModel.pinCode = input ?? '',
                                validator: (input) =>
                                    (input?.isEmpty ?? true) ? "Pincode " : null,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(top: 6.8, left: 1),
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: 20),
                                      // child: Icon(
                                      //   Icons.verified,
                                      //   size: 26,
                                      //
                                      // ),
                                      child: Text("Pincode :",
                                          style: TextStyle(
                                              // height: 5,
                                              fontSize: 19)),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "",
                                    hintStyle: TextStyle(
                                      fontSize: 19,
                                    )),
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // height: 40,
                              // width: 420,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onSaved: (input) =>
                                    this.addtransporterModel.state = input ?? '',
                                validator: (input) =>
                                    (input?.isEmpty ?? true) ? "State" : null,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(top: 6.8, left: 1),
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: 20),
                                      // child: Icon(
                                      //   Icons.verified,
                                      //   size: 26,
                                      //
                                      // ),
                                      child: Text("State :",
                                          style: TextStyle(
                                              // height: 5,
                                              fontSize: 19)),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "",
                                    hintStyle: TextStyle(
                                      fontSize: 19,
                                    )),
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // height: 40,
                              // width: 420,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onSaved: (input) => this
                                    .addtransporterModel
                                    .transportName = input ?? '',
                                validator: (input) => (input?.isEmpty ?? true)
                                    ? "Transporter name"
                                    : null,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(top: 6.8, left: 1),
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: 20),
                                      // child: Icon(
                                      //   Icons.verified,
                                      //   size: 26,
                                      //
                                      // ),
                                      child: Text("Transporter name :",
                                          style: TextStyle(
                                              // height: 5,
                                              fontSize: 19)),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "",
                                    hintStyle: TextStyle(
                                      fontSize: 19,
                                    )),
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // height: 40,
                              // width: 420,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onSaved: (input) => this
                                    .addtransporterModel
                                    .mobileNumber = input ?? '',
                                validator: (input) =>
                                    (input?.isEmpty ?? true) ? "Mobile Mobile" : null,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(top: 6.8, left: 1),
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: 20),
                                      // child: Icon(
                                      //   Icons.verified,
                                      //   size: 26,
                                      //
                                      // ),
                                      child: Text("Mobile Number :",
                                          style: TextStyle(
                                              // height: 5,
                                              fontSize: 19)),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "",
                                    hintStyle: TextStyle(
                                      fontSize: 19,
                                    )),
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // height: 40,
                              // width: 420,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onSaved: (input) =>
                                    this.addtransporterModel.emailId = input ?? '',
                                validator: (input) =>
                                    (input?.isEmpty ?? true) ? "Email Id" : null,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.only(top: 6.8, left: 1),
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: 20),
                                      // child: Icon(
                                      //   Icons.verified,
                                      //   size: 26,
                                      //
                                      // ),
                                      child: Text("Email Id :",
                                          style: TextStyle(
                                              // height: 5,
                                              fontSize: 19)),
                                    ),
                                    border: InputBorder.none,
                                    hintText: "",
                                    hintStyle: TextStyle(
                                      fontSize: 19,
                                    )),
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print("update and save clicked>>>>>>>>>>>>");
                                // print(updatemodel.productname);
                                // print(updatemodel.cityName);
                                // print(updatemodel.productdescription);
                                // print(updatemodel.productcode);
                                print("update and save clicked>>>>>>>>>>>>");
                                if (validateAndSave()) {
                                  print(addtransporterModel.toJson());
                                  setState(() {
                                    isApicallProcess = true;
                                  });
                                  apiService
                                      .updateTransporter(
                                          this.addtransporterModel)
                                      .then((ret) {
                                    setState(() {
                                      isApicallProcess = false;
                                    });
                                    FormHelper.showMessage(
                                        context,
                                        "SUYOGA",
                                        "Transporter Added successfully",
                                        "OK", () {
                                      // if (globals.userRole ==
                                      //     "ROLE_SUYOGA_CITY_ADMIN") {
                                      //   // Navigator.push(
                                      //   //   context,
                                      //   //   MaterialPageRoute(
                                      //   //       builder: (context) =>
                                      //   //           updatePricePage(
                                      //   //               //categoryId: 1,
                                      //   //               )),
                                      //   // );
                                      // } else {
                                      //   Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             MyHomePage()),
                                      //   );
                                      // }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage(
                                                //categoryId: 1,
                                                )),
                                      );
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => OTP(
                                      //       user: usersignup,
                                      //     ),
                                      //   ),
                                      // );
                                    });
                                                                    });
                                }
                              },
                              child: Text(
                                "Add Transporter",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])),
              ),
            );
          } else {
            return new Center(
              child: Column(children: <Widget>[
             Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  elevation: 5.0,
                  child: Column(children: <Widget>[
                    Container(
                      child: Form(
                        key: globalFormKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  //padding: EdgeInsets.symmetric(vertical: 10.0),
                                  padding: EdgeInsets.only(
                                      left: 400, right: 30, top: 30),
                                  child: Container(
                                    height: 37,
                                    width: 480,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) => this
                                          .addtransporterModel
                                          .firstName = input ?? '',
                                      validator: (input) => (input?.isEmpty ?? true)
                                          ? "First name"
                                          : null,
                                      decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                top: 6.8, left: 1),
                                            // padding: EdgeInsets.symmetric(
                                            //     horizontal: 20),
                                            // child: Icon(
                                            //   Icons.verified,
                                            //   size: 26,
                                            //
                                            // ),
                                            child: Text("First Name :",
                                                style: TextStyle(
                                                    // height: 5,
                                                    fontSize: 19)),
                                          ),
                                          border: InputBorder.none,
                                          hintText: "",
                                          hintStyle: TextStyle(
                                            fontSize: 19,
                                          )),
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  //padding: EdgeInsets.symmetric(vertical: 10.0),
                                  padding: EdgeInsets.only(
                                      left: 400, right: 30, top: 10),
                                  child: Container(
                                    height: 37,
                                    width: 480,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) => this
                                          .addtransporterModel
                                          .lastName = input ?? '',
                                      validator: (input) =>
                                          (input?.isEmpty ?? true) ? "Last Name" : null,
                                      decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                top: 6.8, left: 1),
                                            // padding: EdgeInsets.symmetric(
                                            //     horizontal: 20),
                                            // child: Icon(
                                            //   Icons.verified,
                                            //   size: 26,
                                            //
                                            // ),
                                            child: Text("Last Name :",
                                                style: TextStyle(
                                                    // height: 5,
                                                    fontSize: 19)),
                                          ),
                                          border: InputBorder.none,
                                          hintText: "",
                                          hintStyle: TextStyle(
                                            fontSize: 19,
                                          )),
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  //padding: EdgeInsets.symmetric(vertical: 10.0),
                                  padding: EdgeInsets.only(
                                      left: 400, right: 30, top: 10),
                                  child: Container(
                                    height: 37,
                                    width: 480,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) => this
                                          .addtransporterModel
                                          .address = input ?? '',
                                      validator: (input) =>
                                          (input?.isEmpty ?? true) ? "Address" : null,
                                      decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                top: 6.8, left: 1),
                                            // padding: EdgeInsets.symmetric(
                                            //     horizontal: 20),
                                            // child: Icon(
                                            //   Icons.verified,
                                            //   size: 26,
                                            //
                                            // ),
                                            child: Text("Address :",
                                                style: TextStyle(
                                                    // height: 5,
                                                    fontSize: 19)),
                                          ),
                                          border: InputBorder.none,
                                          hintText: "",
                                          hintStyle: TextStyle(
                                            fontSize: 19,
                                          )),
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  //padding: EdgeInsets.symmetric(vertical: 10.0),
                                  padding: EdgeInsets.only(
                                      left: 400, right: 30, top: 10),
                                  child: Container(
                                    height: 37,
                                    width: 480,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) => this
                                          .addtransporterModel
                                          .pinCode = input ?? '',
                                      validator: (input) =>
                                          (input?.isEmpty ?? true) ? "Pincode" : null,
                                      decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                top: 6.8, left: 1),
                                            // padding: EdgeInsets.symmetric(
                                            //     horizontal: 20),
                                            // child: Icon(
                                            //   Icons.verified,
                                            //   size: 26,
                                            //
                                            // ),
                                            child: Text("Pincode :",
                                                style: TextStyle(
                                                    // height: 5,
                                                    fontSize: 19)),
                                          ),
                                          border: InputBorder.none,
                                          hintText: "",
                                          hintStyle: TextStyle(
                                            fontSize: 19,
                                          )),
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  //padding: EdgeInsets.symmetric(vertical: 10.0),
                                  padding: EdgeInsets.only(
                                      left: 400, right: 30, top: 10),
                                  child: Container(
                                    height: 37,
                                    width: 480,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) => this
                                          .addtransporterModel
                                          .location = input ?? '',
                                      validator: (input) =>
                                          (input?.isEmpty ?? true) ? "Location" : null,
                                      decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                top: 6.8, left: 1),
                                            // padding: EdgeInsets.symmetric(
                                            //     horizontal: 20),
                                            // child: Icon(
                                            //   Icons.verified,
                                            //   size: 26,
                                            //
                                            // ),
                                            child: Text("Location :",
                                                style: TextStyle(
                                                    // height: 5,
                                                    fontSize: 19)),
                                          ),
                                          border: InputBorder.none,
                                          hintText: "",
                                          hintStyle: TextStyle(
                                            fontSize: 19,
                                          )),
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  //padding: EdgeInsets.symmetric(vertical: 10.0),
                                  padding: EdgeInsets.only(
                                      left: 400, right: 30, top: 10),
                                  child: Container(
                                    height: 37,
                                    width: 480,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) => this
                                          .addtransporterModel
                                          .state = input ?? '',
                                      validator: (input) =>
                                          (input?.isEmpty ?? true) ? "State" : null,
                                      decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                top: 6.8, left: 1),
                                            // padding: EdgeInsets.symmetric(
                                            //     horizontal: 20),
                                            // child: Icon(
                                            //   Icons.verified,
                                            //   size: 26,
                                            //
                                            // ),
                                            child: Text("State :",
                                                style: TextStyle(
                                                    // height: 5,
                                                    fontSize: 19)),
                                          ),
                                          border: InputBorder.none,
                                          hintText: "",
                                          hintStyle: TextStyle(
                                            fontSize: 19,
                                          )),
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  //padding: EdgeInsets.symmetric(vertical: 10.0),
                                  padding: EdgeInsets.only(
                                      left: 400, right: 30, top: 10),
                                  child: Container(
                                    height: 37,
                                    width: 480,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) => this
                                          .addtransporterModel
                                          .transportName = input ?? '',
                                      validator: (input) => (input?.isEmpty ?? true)
                                          ? "Transporter Name"
                                          : null,
                                      decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                top: 6.8, left: 1),
                                            // padding: EdgeInsets.symmetric(
                                            //     horizontal: 20),
                                            // child: Icon(
                                            //   Icons.verified,
                                            //   size: 26,
                                            //
                                            // ),
                                            child: Text("Transporter name :",
                                                style: TextStyle(
                                                    // height: 5,
                                                    fontSize: 19)),
                                          ),
                                          border: InputBorder.none,
                                          hintText: "",
                                          hintStyle: TextStyle(
                                            fontSize: 19,
                                          )),
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  //padding: EdgeInsets.symmetric(vertical: 10.0),
                                  padding: EdgeInsets.only(
                                      left: 400, right: 30, top: 10),
                                  child: Container(
                                    height: 37,
                                    width: 480,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) => this
                                          .addtransporterModel
                                          .mobileNumber = input ?? '',
                                      validator: (input) => (input?.isEmpty ?? true)
                                          ? "Mobile num"
                                          : null,
                                      decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                top: 6.8, left: 1),
                                            // padding: EdgeInsets.symmetric(
                                            //     horizontal: 20),
                                            // child: Icon(
                                            //   Icons.verified,
                                            //   size: 26,
                                            //
                                            // ),
                                            child: Text("Mobile Number :",
                                                style: TextStyle(
                                                    // height: 5,
                                                    fontSize: 19)),
                                          ),
                                          border: InputBorder.none,
                                          hintText: "",
                                          hintStyle: TextStyle(
                                            fontSize: 19,
                                          )),
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  //padding: EdgeInsets.symmetric(vertical: 10.0),
                                  padding: EdgeInsets.only(
                                      left: 400, right: 30, top: 10),
                                  child: Container(
                                    height: 37,
                                    width: 480,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) => this
                                          .addtransporterModel
                                          .emailId = input ?? '',
                                      validator: (input) =>
                                          (input?.isEmpty ?? true) ? "Email Id" : null,
                                      decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                top: 6.8, left: 1),
                                            // padding: EdgeInsets.symmetric(
                                            //     horizontal: 20),
                                            // child: Icon(
                                            //   Icons.verified,
                                            //   size: 26,
                                            //
                                            // ),
                                            child: Text("Email Id :",
                                                style: TextStyle(
                                                    // height: 5,
                                                    fontSize: 19)),
                                          ),
                                          border: InputBorder.none,
                                          hintText: "",
                                          hintStyle: TextStyle(
                                            fontSize: 19,
                                          )),
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 450, top: 20),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      print(
                                          "update and save clicked>>>>>>>>>>>>");
                                      // print(updatemodel.productname);
                                      // print(updatemodel.cityName);
                                      // print(updatemodel.productdescription);
                                      // print(updatemodel.productcode);
                                      print(
                                          "update and save clicked>>>>>>>>>>>>");
                                      if (validateAndSave()) {
                                        print(addtransporterModel.toJson());
                                        setState(() {
                                          isApicallProcess = true;
                                        });
                                        apiService
                                            .updateTransporter(
                                                this.addtransporterModel)
                                            .then((ret) {
                                          setState(() {
                                            isApicallProcess = false;
                                          });
                                          FormHelper.showMessage(
                                              context,
                                              "SUYOGA",
                                              "Transporter Added successfully",
                                              "OK", () {
                                            // if (globals.userRole ==
                                            //     "ROLE_SUYOGA_CITY_ADMIN") {
                                            //   // Navigator.push(
                                            //   //   context,
                                            //   //   MaterialPageRoute(
                                            //   //       builder: (context) =>
                                            //   //           updatePricePage(
                                            //   //               //categoryId: 1,
                                            //   //               )),
                                            //   // );
                                            // } else {
                                            //   Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             MyHomePage()),
                                            //   );
                                            // }
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      updatePricePage(
                                                          //categoryId: 1,
                                                          )),
                                            );
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => OTP(
                                            //       user: usersignup,
                                            //     ),
                                            //   ),
                                            // );
                                          });
                                                                                });
                                      }
                                    },
                                    child: Text(
                                      "Add Transporter",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ])
            )]));
          }
        }),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}







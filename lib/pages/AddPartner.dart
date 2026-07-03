import 'package:flutter/material.dart';

import 'package:subjeecentral/models/PartnerModel.dart';
import 'package:subjeecentral/utils/ProgressHUD.dart';

import '../api_service.dart';
import 'PartnerList.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/form_helper.dart';

class AddPartnerPage extends StatefulWidget {
  // AddPincodePage({Key key, this.patnerId}) : super(key: key);
  // int patnerId;
  @override
  _AddPartnerPageState createState() => _AddPartnerPageState();
}

class _AddPartnerPageState extends State<AddPartnerPage> {
  late APIService apiService;
  bool isApicallProcess = false;
  bool hidePassword = true;
  // User usersignup;
  late PartnerModel partnermodel;
  bool isApiCallProcess = false;
  String? password;
  String? lastname;
  String? city;
  String? phoneno;
  String? mailId;
  String? pincode;
  String? firstname;
  String username = "user";
  String pending = "P";
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late SharedPreferences sharedPrefs;

  @override
  void initState() {
    super.initState();
    apiService = new APIService();
    partnermodel = new PartnerModel();
    this.partnermodel.id = 0;
  }

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
        title: Text("Add Managing partner"),
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
        actions: <Widget>[],
      ),
      backgroundColor: Colors.greenAccent.withOpacity(0.3),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, Constraints) {
          if (Constraints.maxWidth < 768) {
            // String productname;
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
                                height: 40,
                                width: 420,
                                // width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  onSaved: (input) =>
                                      this.partnermodel.partnerName = input,
                                  validator: (input) => (input?.isEmpty ?? true) ? "enter partner name" : null,
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
                                        child: Text("Partner Name :",
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
                              Container(
                                padding: EdgeInsets.only(top: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //Padding(),
                                    Container(
                                      height: 40,
                                      width: 420,
                                      // width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        onSaved: (input) => this
                                            .partnermodel
                                            .mobileNumber = input,
                                        validator: (input) => (input?.isEmpty ?? true)
                                            ? "Mobile number"
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
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                    //Padding(),
                                    Container(
                                      height: 40,
                                      width: 420,
                                      // width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        onSaved: (input) => this
                                            .partnermodel
                                            .partnerAccountnumber = input,
                                        validator: (input) => (input?.isEmpty ?? true)
                                            ? "Enter partner Acc num"
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
                                              child: Text(
                                                  "Partner Account Number:",
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
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                    //Padding(),
                                    Container(
                                      height: 40,
                                      width: 420,
                                      // width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        onSaved: (input) =>
                                            this.partnermodel.city = input,
                                      validator: (input) => (input?.isEmpty ?? true) ? "enter city name" : null,
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
                                              child: Text("City Name :",
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
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 18, horizontal: 110),
                                        shape: StadiumBorder(),
                                      ),
                                      onPressed: () {
                                        if (validateAndSave()) {
                                          print("=== MOBILE VIEW: Add Partner Clicked ===");
                                          print("Partner Name: ${partnermodel.partnerName}");
                                          print("Mobile Number: ${partnermodel.mobileNumber}");
                                          print("Account Number: ${partnermodel.partnerAccountnumber}");
                                          print("City: ${partnermodel.city}");
                                          print("Full JSON: ${partnermodel.toJson()}");
                                          setState(() {
                                            isApicallProcess = true;
                                          });
                                          apiService
                                              .addPartner(this.partnermodel)
                                              .then((ret) {
                                            setState(() {
                                              isApicallProcess = false;
                                            });
                                            // Check if partner was added successfully
                                            if (ret.statusCode == 200 || ret.statusCode == 201) {
                                              FormHelper.showMessage(
                                                  context,
                                                  "SUYOGA",
                                                  "New Partner Added successfully",
                                                  "OK", () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          partnerList()),
                                                );
                                              });
                                            } else {
                                              // Show error message if addition failed
                                              FormHelper.showMessage(
                                                  context,
                                                  "Error",
                                                  ret.message ?? "Failed to add partner. Please try again.",
                                                  "OK", () {
                                                Navigator.pop(context);
                                              });
                                            }
                                          });
                                        }
                                      },
                                      child: Text(
                                        "Add Partner",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]))));
          } else {
            return Card(
                  color: Colors.greenAccent.withOpacity(0.3),
                  //shape: ContinuousRectangleBorder(
                    //  borderRadius: BorderRadius.circular(40.0)),
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
                                      left: 400, right: 160, top: 50),
                                  child: Container(
                                    height: 40,
                                    width: 420,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) =>
                                          this.partnermodel.partnerName = input,
                                      validator: (input) => (input?.isEmpty ?? true)
                                          ? "Enter Partner Name"
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
                                            child: Text("Partner Name :",
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
                                      left: 400, right: 160, top: 20),
                                  //EdgeInsets.only(left: 150, right: 30, top: 10),
                                  child: Container(
                                    height: 40,
                                    width: 420,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) => this
                                          .partnermodel
                                          .mobileNumber = input,
                                      validator: (input) => (input?.isEmpty ?? true)
                                          ? "Mobile number"
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
                              children: [],
                            ),
                            Row(
                              children: [
                                Padding(
                                  //padding: EdgeInsets.symmetric(vertical: 10.0),
                                  padding: EdgeInsets.only(
                                      left: 400, right: 160, top: 20),
                                  //EdgeInsets.only(left: 150, right: 30, top: 10),
                                  child: Container(
                                    height: 40,
                                    width: 420,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) => this
                                          .partnermodel
                                          .partnerAccountnumber = input,
                                    validator: (input) => (input?.isEmpty ?? true)
                                          ? "Enter partner Acc num"
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
                                            child:
                                                Text("Partner Account Number:",
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
                                      left: 400, right: 160, top: 20),
                                  // EdgeInsets.only(left: 150, right: 30, top: 10),
                                  child: Container(
                                    height: 40,
                                    width: 420,
                                    // width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onSaved: (input) =>
                                          this.partnermodel.city = input,
                                    validator: (input) => (input?.isEmpty ?? true)
                                          ? "Enter city name"
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
                                            child: Text("City Name :",
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
                              children: [],
                            ),
                            Row(
                              children: [],
                            ),
                            Container(
                              // padding: EdgeInsets.only(left: 450, top: 50),
                              padding: EdgeInsets.only(
                                  left: 450, right: 160, top: 100),
                              //EdgeInsets.only(left: 200, right: 200, top: 50),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      print(
                                          "=== DESKTOP VIEW: Add Partner Clicked ===");
                                      if (validateAndSave()) {
                                        print("Partner Name: ${partnermodel.partnerName}");
                                        print("Mobile Number: ${partnermodel.mobileNumber}");
                                        print("Account Number: ${partnermodel.partnerAccountnumber}");
                                        print("City: ${partnermodel.city}");
                                        print("Full JSON: ${partnermodel.toJson()}");
                                        setState(() {
                                          isApicallProcess = true;
                                        });
                                        apiService
                                            .addPartner(this.partnermodel)
                                            .then((ret) {
                                          setState(() {
                                            isApicallProcess = false;
                                          });
                                          // Check if partner was added successfully
                                          if (ret.statusCode == 200 || ret.statusCode == 201) {
                                            FormHelper.showMessage(
                                              context,
                                              "SUYOGA",
                                              "New Partner Added successfully",
                                              "OK", () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      partnerList()),
                                            );
                                          });
                                          } else {
                                            // Show error message if addition failed
                                            FormHelper.showMessage(
                                              context,
                                              "Error",
                                              ret.message ?? "Failed to add partner. Please try again.",
                                              "OK", () {
                                            Navigator.pop(context);
                                          });
                                          }
                                        });
                                      }
                                    },
                                    child: Text(
                                      "Add Partner",
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
            );
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







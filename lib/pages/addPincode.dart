import 'package:flutter/material.dart';
import 'package:subjeecentral/models/PincodeModel.dart';
import 'package:subjeecentral/pages/DeliveryPartnersList.dart';
import 'package:subjeecentral/utils/ProgressHUD.dart';

import '../api_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/form_helper.dart';

class AddPincodePage extends StatefulWidget {
  AddPincodePage({Key? key, this.patnerId}) : super(key: key);
  final int? patnerId;
  @override
  _AddPincodePageState createState() => _AddPincodePageState();
}

class _AddPincodePageState extends State<AddPincodePage> {
  late APIService apiService;
  bool isApicallProcess = false;
  bool hidePassword = true;
  // User usersignup;
  late PincodeModel pincodeModel;
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
    pincodeModel = new PincodeModel();
    this.pincodeModel.id = 0;
    this.pincodeModel.partnerId = this.widget.patnerId;
    this.pincodeModel.userStatus = 0;

    print("product code>>>>>>>>>>>>>>>");

    //  usersignup = new User();
    //  this.getSWData();
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
        title: Text("Add New Pincode"),
        centerTitle: true,

        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.push(
            // context,
            // MaterialPageRoute(builder: (context) => DeliverypartnerList()),
            // builder: (context) => DataTableDemo()),
            // );
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
            return SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(top: 16, left: 12, right: 12),
                    child: Form(
                        key: globalFormKey,
                        child: Column(children: <Widget>[
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 420,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) =>
                                        this.pincodeModel.postalcode = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true) ? "Postal code" : null,
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
                                          child: Text("Postal Code :",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //Padding(),
                                      Container(
                                        height: 40,
                                        width: 420,
                                        // width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextFormField(
                                          onSaved: (input) => this
                                              .pincodeModel
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //Padding(),
                                      Container(
                                        height: 40,
                                        width: 420,
                                        // width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextFormField(
                                          onSaved: (input) => this
                                              .pincodeModel
                                              .vendorName = input,
                                          validator: (input) => (input?.isEmpty ?? true)
                                              ? "vendor name"
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
                                                child: Text("Vendor name:",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //Padding(),
                                      Container(
                                        height: 40,
                                        width: 420,
                                        // width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextFormField(
                                          onSaved: (input) => this
                                              .pincodeModel
                                              .address1 = input,
                                          validator: (input) => (input?.isEmpty ?? true)
                                              ? " Enter Address"
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
                                                child: Text("Address 1:",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //Padding(),
                                      Container(
                                        height: 40,
                                        width: 420,
                                        // width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextFormField(
                                          onSaved: (input) => this
                                              .pincodeModel
                                              .address2 = input,
                                          validator: (input) => (input?.isEmpty ?? true)
                                              ? "Address 2"
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
                                                child: Text("Address 2:",
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
                                      Container(
                                        padding: EdgeInsets.only(top: 6),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                  print(pincodeModel.toJson());
                                                  setState(() {
                                                    isApicallProcess = true;
                                                  });
                                                  apiService
                                                      .updatePincode(
                                                          this.pincodeModel)
                                                      .then((ret) {
                                                    setState(() {
                                                      isApicallProcess = false;
                                                    });
                                                    FormHelper.showMessage(
                                                        context,
                                                        "SUYOGA",
                                                        "New Pincode Added successfully",
                                                        "OK", () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                DeliverypartnerList(
                                                                  subjeepartnerId: widget
                                                                      .patnerId!,
                                                                )),
                                                      );
                                                    });
                                                  });
                                                }
                                              },
                                              child: Text(
                                                "Save Pincode",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ]))));
          } else {
            return Card(
                color: Colors.greenAccent.withOpacity(0.3),
                //shape: ContinuousRectangleBorder(
                // borderRadius: BorderRadius.circular(40.0)),
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
                                        this.pincodeModel.postalcode = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true) ? "Postal code" : null,
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
                                          child: Text("Postal Code :",
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
                                    onSaved: (input) =>
                                        this.pincodeModel.mobileNumber = input,
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
                                    onSaved: (input) =>
                                        this.pincodeModel.vendorName = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true) ? "vendor name" : null,
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
                                          child: Text("Vendor name:",
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
                                    onSaved: (input) =>
                                        this.pincodeModel.address1 = input,
                                    validator: (input) => (input?.isEmpty ?? true)
                                        ? " Enter Address"
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
                                    onSaved: (input) =>
                                        this.pincodeModel.address2 = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true) ? "Pincode city" : null,
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
                                          child: Text("Pincode city:",
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
                          // Row(
                          //   children: [
                          //     Padding(
                          //       //padding: EdgeInsets.symmetric(vertical: 10.0),
                          //       padding: EdgeInsets.only(
                          //           left: 400, right: 160, top: 20),
                          //       //EdgeInsets.only(left: 150, right: 30, top: 10),
                          //       child: Container(
                          //         height: 40,
                          //         width: 420,
                          //         // width: double.infinity,
                          //         decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           borderRadius: BorderRadius.circular(10),
                          //         ),
                          //         child: TextFormField(
                          //           onSaved: (input) =>
                          //               this.pincodeModel.email = input,
                          //           validator: (input) => input.length < 1
                          //               ? "Enter Email ID"
                          //               : null,
                          //           decoration: InputDecoration(
                          //               errorStyle: TextStyle(
                          //                 color: Colors.red,
                          //                 fontWeight: FontWeight.bold,
                          //                 fontSize: 12,
                          //               ),
                          //               prefixIcon: Padding(
                          //                 padding: EdgeInsets.only(
                          //                     top: 6.8, left: 1),
                          //                 // padding: EdgeInsets.symmetric(
                          //                 //     horizontal: 20),
                          //                 // child: Icon(
                          //                 //   Icons.verified,
                          //                 //   size: 26,
                          //                 //
                          //                 // ),
                          //                 child: Text("Email :",
                          //                     style: TextStyle(
                          //                         // height: 5,
                          //                         fontSize: 19)),
                          //               ),
                          //               border: InputBorder.none,
                          //               hintText: "",
                          //               hintStyle: TextStyle(
                          //
                          //                 fontSize: 19,
                          //               )),
                          //           style: TextStyle(color: Colors.black),
                          //           keyboardType: TextInputType.emailAddress,
                          //           textInputAction: TextInputAction.next,
                          //           cursorColor: Colors.black,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Row(
                            children: [],
                          ),
                          Container(
                            // padding: EdgeInsets.only(left: 450, top: 50),
                            padding:
                                EdgeInsets.only(left: 450, right: 160, top: 20),
                            //EdgeInsets.only(left: 200, right: 200, top: 50),
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
                                      print(pincodeModel.toJson());
                                      setState(() {
                                        isApicallProcess = true;
                                      });
                                      apiService
                                          .updatePincode(this.pincodeModel)
                                          .then((ret) {
                                        setState(() {
                                          isApicallProcess = false;
                                        });
                                        FormHelper.showMessage(
                                            context,
                                            "SUYOGA",
                                            "New Pincode Added successfully",
                                            "OK", () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DeliverypartnerList(
                                                      subjeepartnerId: widget
                                                          .patnerId!,
                                                    )),
                                          );
                                        });
                                      });
                                    }
                                  },
                                  child: Text(
                                    "Save Pincode",
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
                ]));
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






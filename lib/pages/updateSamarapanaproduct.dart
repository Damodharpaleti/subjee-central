import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subjeecentral/Config.dart';
import 'package:subjeecentral/models/product.dart';
import 'package:subjeecentral/models/updateProductModel.dart';
import 'package:subjeecentral/pages/updateSamarpanPricePage.dart';
import 'package:subjeecentral/utils/ProgressHUD.dart';

import '../api_service.dart';
import 'package:subjeecentral/components/globals.dart' as globals;


import 'package:shared_preferences/shared_preferences.dart';

import '../utils/form_helper.dart';

class updatesamarpanaproduct extends StatefulWidget {
  updatesamarpanaproduct({Key? key, required this.pdata}) : super(key: key);
  final Product pdata;
  @override
  _updatesamarpanaproductState createState() => _updatesamarpanaproductState();
}

class _updatesamarpanaproductState extends State<updatesamarpanaproduct> {
  late APIService apiService;
  bool isApicallProcess = false;
  bool hidePassword = true;
  // User usersignup;
  late updateProductModel updatemodel;
  bool isApiCallProcess = false;
  late String password;
  late String lastname;
  late String city;
  late String phoneno;
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
    updatemodel = new updateProductModel();
    this.updatemodel.productId = this.widget.pdata.productId;
    this.updatemodel.productvendor = "";
    this.updatemodel.productweight = "";
    this.updatemodel.productweightunit = "";

    this.updatemodel.priceminquantity = 1;
    this.updatemodel.brandName = "";
    this.updatemodel.productTitle = "";
    this.updatemodel.active = "";
    this.updatemodel.productTitle = "";
    this.updatemodel.cityId = 1;
    this.updatemodel.categoryid = this.widget.pdata.cId;
    //updatemodel.product_code = this.widget.pdata.productCode;
    print("product code>>>>>>>>>>>>>>>");
    print(this.widget.pdata.productCode);
    print(this.widget.pdata.productName);
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
        title: Text("Edit Samarpana Product"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green[900],
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
                // padding: EdgeInsets.all(15),
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SafeArea(
                      child: new Center(
                          child: Column(children: <Widget>[
                        Container(
                          // padding: EdgeInsets.only(
                          //     top: 15.0, right: 10.0, left: 150.0, bottom: 10.0),
                          // padding: EdgeInsets.only(top: 5, left: 19, right: 19),
                          padding: EdgeInsets.only(top: 10, left: 8, right: 8),
                          child: Column(children: <Widget>[
                            // Text(
                            //   "Sign Up",
                            //   style: TextStyle(
                            //       color: Colors.greenAccent[400],
                            //       fontWeight: FontWeight.w600,
                            //       fontSize: 35.0,
                            //       fontFamily: 'Merriweather'),
                            // ),
                            CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 70,
                                // child: Image.asset('assets/images/logo.png',
                                //     width: 100, height: 100, fit: BoxFit.fill),
                                child: Image.network(
                                  Config.imageurl +
                                      (this.widget.pdata.productCode ?? '') +
                                      '.png',
                                )),
                            SizedBox(height: 10),

                            Text(
                              this.widget.pdata.productName ?? '',
                              style: TextStyle(
                                color: Colors.green[900],
                                fontSize: 17.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                // "It should only take a couple of minutes",
                                "price : ${this.widget.pdata.price}",
                                style: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Form(
                                key: globalFormKey,
                                child: Column(children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //Padding(),
                                      Container(
                                        height: 40,
                                        width: 390,
                                        // width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextFormField(
                                          initialValue:
                                              this.widget.pdata.productName,
                                          onSaved: (input) => this
                                              .updatemodel
                                              .productname = input,
                                          validator: (input) => (input?.length ?? 0) < 1
                                              ? "Product name"
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
                                                //   color: Colors.green[900],
                                                // ),
                                                child: Text("Product name :",
                                                    style: TextStyle(
                                                        // height: 5,
                                                        fontSize: 19)),
                                              ),
                                              border: InputBorder.none,
                                              hintText:
                                                  this.widget.pdata.productName,
                                              hintStyle: TextStyle(
                                                color: Colors.green[900],
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
                                  Container(
                                    padding: EdgeInsets.only(top: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 380,
                                          // width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            initialValue:
                                                this.widget.pdata.productCode,
                                            onSaved: (input) => this
                                                .updatemodel
                                                .productcode = input,
                                            validator: (input) =>
                                                (input?.length ?? 0) < 1
                                                    ? "Product code"
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
                                                  //   color: Colors.green[900],
                                                  // ),
                                                  child: Text("Product Code :",
                                                      style: TextStyle(
                                                          // height: 5,
                                                          fontSize: 19)),
                                                ),
                                                border: InputBorder.none,
                                                hintText: this
                                                    .widget
                                                    .pdata
                                                    .productCode,
                                                hintStyle: TextStyle(
                                                  color: Colors.green[900],
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
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 380,
                                          // width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            initialValue: this
                                                .widget
                                                .pdata
                                                .productDescription,
                                            onSaved: (input) => this
                                                .updatemodel
                                                .productdescription = input,
                                            validator: (input) =>
                                                (input?.length ?? 0) < 1
                                                    ? "product_description"
                                                    : null,
                                            decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                                prefixIcon: Padding(
                                                    // padding: EdgeInsets.symmetric(
                                                    //     horizontal: 20),
                                                    // child: Icon(
                                                    //   Icons.verified_user,
                                                    //   size: 26,
                                                    //   color: Colors.green[900],
                                                    // ),
                                                    padding: EdgeInsets.only(
                                                        top: 6.8, left: 1),
                                                    child: Text("Prod Desc : ",
                                                        style: TextStyle(
                                                            // height: 5,
                                                            fontSize: 19))),
                                                border: InputBorder.none,
                                                hintText: this
                                                    .widget
                                                    .pdata
                                                    .productDescription,
                                                hintStyle: TextStyle(
                                                  color: Colors.green[900],
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
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 38,
                                          width: 380,
                                          // width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            initialValue:
                                                this.widget.pdata.price,
                                            onSaved: (input) =>
                                                this.updatemodel.pricevalue =
                                                    double.parse(input ?? '0'),
                                            validator: (input) =>
                                                (input?.length ?? 0) < 1
                                                    ? "Product price"
                                                    : null,
                                            decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                                prefixIcon: Padding(
                                                    // padding: EdgeInsets.symmetric(
                                                    //     horizontal: 20),
                                                    // child: Icon(
                                                    //   Icons.phone,
                                                    //   size: 26,
                                                    //   color: Colors.green[900],
                                                    // ),
                                                    padding: EdgeInsets.only(
                                                        top: 6.8, left: 1),
                                                    child: Text("Price : ",
                                                        style: TextStyle(
                                                            // height: 5,
                                                            fontSize: 19))),
                                                border: InputBorder.none,
                                                hintText:
                                                    this.widget.pdata.price,
                                                hintStyle: TextStyle(
                                                  color: Colors.green[900],
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
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 38,
                                          width: 380,
                                          // width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            initialValue:
                                                this.widget.pdata.marketPrice,
                                            onSaved: (input) =>
                                                this.updatemodel.marketprice =
                                                    double.parse(input ?? '0'),
                                            validator: (input) => (input?.length ?? 0) <
                                                    1
                                                ? "Please Enter Market price"
                                                : null,
                                            decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                                prefixIcon: Padding(
                                                    // padding: EdgeInsets.symmetric(
                                                    //     horizontal: 20),
                                                    // child: Icon(
                                                    //   Icons.email,
                                                    //   size: 26,
                                                    //   color: Colors.green[900],
                                                    // ),
                                                    padding: EdgeInsets.only(
                                                        top: 6.8, left: 1),
                                                    child:
                                                        Text("Market Price : ",
                                                            style: TextStyle(
                                                                // height: 5,
                                                                fontSize: 19))),
                                                border: InputBorder.none,
                                                hintText: this
                                                    .widget
                                                    .pdata
                                                    .marketPrice,
                                                hintStyle: TextStyle(
                                                  color: Colors.green[900],
                                                  fontSize: 19,
                                                )),
                                            style:
                                                TextStyle(color: Colors.black),
                                            // keyboardType:
                                            //     TextInputType.emailAddress,
                                            textInputAction:
                                                TextInputAction.next,
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
                                        Container(
                                          height: 38,
                                          width: 380,
                                          // width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            // initialValue: "Bengaluru",
                                            initialValue: globals.userRole !=
                                                        "ROLE_SUYOGA_CITY_ADMIN" &&
                                                    globals.userRole !=
                                                        "ROLE_MANAGING_PARTNER"
                                                ? globals.globalCity
                                                : "Bengaluru",
                                            onSaved: (input) => this
                                                .updatemodel
                                                .cityName = input,
                                            validator: (input) =>
                                                (input?.length ?? 0) < 1
                                                    ? "Please Enter Cityname"
                                                    : null,
                                            decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                                prefixIcon: Padding(
                                                    // padding: EdgeInsets.symmetric(
                                                    //     horizontal: 20),
                                                    // child: Icon(
                                                    //   Icons.email,
                                                    //   size: 26,
                                                    //   color: Colors.green[900],
                                                    // ),
                                                    padding: EdgeInsets.only(
                                                        top: 6.8, left: 1),
                                                    child: Text("City Name : ",
                                                        style: TextStyle(
                                                            // height: 5,
                                                            fontSize: 19))),
                                                border: InputBorder.none,
                                                hintText: "Cityname",
                                                hintStyle: TextStyle(
                                                  color: Colors.green[900],
                                                  fontSize: 19,
                                                )),
                                            style:
                                                TextStyle(color: Colors.black),
                                            // keyboardType:
                                            //     TextInputType.emailAddress,
                                            textInputAction:
                                                TextInputAction.next,
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
                                        Container(
                                          height: 40,
                                          // width: double.infinity,
                                          // height:
                                          //   MediaQuery.of(context).size.height / 2,
                                          width: 380,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            initialValue: "1",
                                            onSaved: (input) => this
                                                .updatemodel
                                                .productweight = input,
                                            validator: (input) =>
                                                (input?.length ?? 0) < 1
                                                    ? "Product Weight"
                                                    : null,
                                            //obscureText: hidePassword,
                                            decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                    color: Colors.red),
                                                prefixIcon: Padding(
                                                    // padding: EdgeInsets.symmetric(
                                                    //     horizontal: 20),
                                                    // child: Icon(
                                                    //   Icons.lock,
                                                    //   size: 26,
                                                    //   color: Colors.green[900],
                                                    // ),
                                                    padding: EdgeInsets.only(
                                                        top: 6.8, left: 1),
                                                    child: Text(
                                                        "Product  Weight : ",
                                                        style: TextStyle(
                                                            // height: 5,
                                                            fontSize: 19))),
                                                border: InputBorder.none,
                                                hintText: "",
                                                hintStyle: TextStyle(
                                                  color: Colors.green[900],
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
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 40,
                                          // width: double.infinity,
                                          // height:
                                          //   MediaQuery.of(context).size.height / 2,
                                          width: 380,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            initialValue: "Kg",
                                            onSaved: (input) => this
                                                .updatemodel
                                                .productweightunit = input,
                                            validator: (input) =>
                                                (input?.length ?? 0) < 1
                                                    ? "Product Weight unit"
                                                    : null,
                                            //obscureText: hidePassword,
                                            decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                    color: Colors.red),
                                                prefixIcon: Padding(
                                                    // padding: EdgeInsets.symmetric(
                                                    //     horizontal: 20),
                                                    // child: Icon(
                                                    //   Icons.lock,
                                                    //   size: 26,
                                                    //   color: Colors.green[900],
                                                    // ),
                                                    padding: EdgeInsets.only(
                                                        top: 6.8, left: 1),
                                                    child: Text(
                                                        "Product  Weight unit : ",
                                                        style: TextStyle(
                                                            // height: 5,
                                                            fontSize: 19))),
                                                border: InputBorder.none,
                                                hintText: " kg/pcs",
                                                hintStyle: TextStyle(
                                                  color: Colors.green[900],
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
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 18, horizontal: 110),
                                            backgroundColor: Colors.green[900],
                                          ),
                                          // padding: EdgeInsets.symmetric(
                                          //     vertical: 18, horizontal: 110),
                                          // padding: EdgeInsets.only(
                                          //     top: 40,
                                          //     right: 10,
                                          //     left: 10,
                                          //     bottom: 10),
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
                                              print("Form saved successfully");
                                              print("Update model data: ${updatemodel.toJson()}");
                                              setState(() {
                                                isApicallProcess = true;
                                              });
                                              apiService
                                                  .updateSamarpanaProduct(
                                                      this.updatemodel)
                                                  .then((ret) {
                                                setState(() {
                                                  isApicallProcess = false;
                                                });
                                                // Check if update was successful
                                                if (ret.statusCode == 200 || ret.statusCode == 201) {
                                                  FormHelper.showMessage(
                                                      context,
                                                      "SUYOGA",
                                                      "Samarpana product updated successfully",
                                                      "OK", () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              updateSamarpanaPricePage(
                                                                cid: this
                                                                    .widget
                                                                    .pdata
                                                                    .cId ?? 0,
                                                              )),
                                                    );
                                                  });
                                                } else {
                                                  // Show error message if update failed
                                                  FormHelper.showMessage(
                                                      context,
                                                      "Error",
                                                      ret.message ?? "Failed to update product. Please try again.",
                                                      "OK", () {
                                                    Navigator.pop(context);
                                                  });
                                                }
                                                                                            });
                                            }
                                          },
                                          child: Text(
                                            "update and save",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ])))
                      ])),
                    )));
          } else {
            return Padding(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 40.0, left: 50.0, right: 50.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height * 0.90,
                      // color: Colors.grey[300],
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, right: 100.0, left: 100.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: <Widget>[
                              //SizedBox(
                              //height: 10.0,
                              //),
                              Container(
                                width: double.infinity,
                                child: Form(
                                  key: globalFormKey,
                                  child: Column(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            // padding: EdgeInsets.symmetric(
                                            //     vertical: 10.0),
                                            padding: EdgeInsets.only(top: 05),

                                            child: TextFormField(
                                              initialValue:
                                                  this.widget.pdata.productName,
                                              onSaved: (input) => this
                                                  .updatemodel
                                                  .productname = input,
                                              validator: (input) =>
                                                  (input?.length ?? 0) < 1
                                                      ? "Product name"
                                                      : null,
                                              decoration: InputDecoration(
                                                  fillColor: Colors.grey,
                                                  focusColor: Colors.grey,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.blueAccent,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.pink,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
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
                                                    //   color: Colors.green[900],
                                                    // ),
                                                    child: Text(
                                                        "Product name :",
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            // height: 5,
                                                            fontSize: 19)),
                                                  ),
                                                  border: InputBorder.none,
                                                  hintText: this
                                                      .widget
                                                      .pdata
                                                      .productName,
                                                  hintStyle: TextStyle(
                                                    color: Colors.green[900],
                                                    fontSize: 05,
                                                  )),
                                              style: TextStyle(
                                                  color: Colors.black),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              textInputAction:
                                                  TextInputAction.next,
                                              cursorColor: Colors.black,
                                            ),
                                          ),

                                          Padding(
                                            // padding: EdgeInsets.symmetric(
                                            //     vertical: 10.0),
                                            padding: EdgeInsets.only(top: 10),

                                            child: TextFormField(
                                              initialValue:
                                                  this.widget.pdata.productCode,
                                              onSaved: (input) => this
                                                  .updatemodel
                                                  .productcode = input,
                                              validator: (input) =>
                                                  (input?.length ?? 0) < 1
                                                      ? "Product code"
                                                      : null,
                                              decoration: InputDecoration(
                                                  fillColor: Colors.grey,
                                                  focusColor: Colors.grey,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.blueAccent,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.pink,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
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
                                                    //   color: Colors.green[900],
                                                    // ),
                                                    child: Text(
                                                        "Product Code :",
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            // height: 5,
                                                            fontSize: 19)),
                                                  ),
                                                  border: InputBorder.none,
                                                  hintText: this
                                                      .widget
                                                      .pdata
                                                      .productCode,
                                                  hintStyle: TextStyle(
                                                    color: Colors.green[900],
                                                    fontSize: 19,
                                                  )),
                                              style: TextStyle(
                                                  color: Colors.black),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              textInputAction:
                                                  TextInputAction.next,
                                              cursorColor: Colors.black,
                                            ),
                                          ),

                                          ////
                                          Padding(
                                            // padding: EdgeInsets.symmetric(
                                            //     vertical: 10.0),
                                            padding: EdgeInsets.only(top: 10),

                                            child: TextFormField(
                                              initialValue: this
                                                  .widget
                                                  .pdata
                                                  .productDescription,
                                              onSaved: (input) => this
                                                  .updatemodel
                                                  .productdescription = input,
                                              validator: (input) =>
                                                  (input?.length ?? 0) < 1
                                                      ? "product_description"
                                                      : null,
                                              decoration: InputDecoration(
                                                  fillColor: Colors.grey,
                                                  focusColor: Colors.grey,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.blueAccent,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.pink,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                  prefixIcon: Padding(
                                                      // padding: EdgeInsets.symmetric(
                                                      //     horizontal: 20),
                                                      // child: Icon(
                                                      //   Icons.verified_user,
                                                      //   size: 26,
                                                      //   color: Colors.green[900],
                                                      // ),
                                                      padding: EdgeInsets.only(
                                                          top: 6.8, left: 1),
                                                      child: Text(
                                                          "Product Description : ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              // height: 5,
                                                              fontSize: 19))),
                                                  border: InputBorder.none,
                                                  hintText: this
                                                      .widget
                                                      .pdata
                                                      .productDescription,
                                                  hintStyle: TextStyle(
                                                    color: Colors.green[900],
                                                    fontSize: 19,
                                                  )),
                                              style: TextStyle(
                                                  color: Colors.black),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              textInputAction:
                                                  TextInputAction.next,
                                              cursorColor: Colors.black,
                                            ),
                                          ),

                                          Padding(
                                            // padding: EdgeInsets.symmetric(
                                            //     vertical: 10.0),
                                            padding: EdgeInsets.only(top: 10),

                                            child: TextFormField(
                                              initialValue:
                                                  this.widget.pdata.price,
                                              onSaved: (input) =>
                                                  this.updatemodel.pricevalue =
                                                      double.parse(input ?? '0'),
                                              validator: (input) =>
                                                  (input?.length ?? 0) < 1
                                                      ? "Product price"
                                                      : null,
                                              decoration: InputDecoration(
                                                  fillColor: Colors.grey,
                                                  focusColor: Colors.grey,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.blueAccent,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.pink,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                  prefixIcon: Padding(
                                                      // padding: EdgeInsets.symmetric(
                                                      //     horizontal: 20),
                                                      // child: Icon(
                                                      //   Icons.phone,
                                                      //   size: 26,
                                                      //   color: Colors.green[900],
                                                      // ),
                                                      padding: EdgeInsets.only(
                                                          top: 6.8, left: 1),
                                                      child: Text(
                                                          " product Price : ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              // height: 5,
                                                              fontSize: 19))),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      this.widget.pdata.price,
                                                  hintStyle: TextStyle(
                                                    color: Colors.green[900],
                                                    fontSize: 19,
                                                  )),
                                              style: TextStyle(
                                                  color: Colors.black),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              textInputAction:
                                                  TextInputAction.next,
                                              cursorColor: Colors.black,
                                            ),
                                          ),

                                          Padding(
                                            // padding: EdgeInsets.symmetric(
                                            //     vertical: 10.0),
                                            padding: EdgeInsets.only(top: 10),

                                            child: TextFormField(
                                              initialValue:
                                                  this.widget.pdata.marketPrice,
                                              onSaved: (input) =>
                                                  this.updatemodel.marketprice =
                                                      double.parse(input ?? '0'),
                                              validator: (input) => (input?.length ?? 0)
                                                      < 1
                                                  ? "Please Enter Market price"
                                                  : null,
                                              decoration: InputDecoration(
                                                  fillColor: Colors.grey,
                                                  focusColor: Colors.grey,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.blueAccent,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.pink,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                  prefixIcon: Padding(
                                                      // padding: EdgeInsets.symmetric(
                                                      //     horizontal: 20),
                                                      // child: Icon(
                                                      //   Icons.email,
                                                      //   size: 26,
                                                      //   color: Colors.green[900],
                                                      // ),
                                                      padding: EdgeInsets.only(
                                                          top: 6.8, left: 1),
                                                      child: Text(
                                                          "Market Price : ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              // height: 5,
                                                              fontSize: 19))),
                                                  border: InputBorder.none,
                                                  hintText: this
                                                      .widget
                                                      .pdata
                                                      .marketPrice,
                                                  hintStyle: TextStyle(
                                                    color: Colors.green[900],
                                                    fontSize: 19,
                                                  )),
                                              style: TextStyle(
                                                  color: Colors.black),
                                              // keyboardType:
                                              //     TextInputType.emailAddress,
                                              textInputAction:
                                                  TextInputAction.next,
                                              cursorColor: Colors.black,
                                            ),
                                          ),

                                          Padding(
                                            // padding: EdgeInsets.symmetric(
                                            //     vertical: 10.0),
                                            padding: EdgeInsets.only(top: 10),

                                            child: TextFormField(
                                              // initialValue: "Bengaluru",
                                              initialValue: globals.userRole !=
                                                          "ROLE_SUYOGA_CITY_ADMIN" &&
                                                      globals.userRole !=
                                                          "ROLE_MANAGING_PARTNER"
                                                  ? globals.globalCity
                                                  : "Bengaluru",
                                              onSaved: (input) => this
                                                  .updatemodel
                                                  .cityName = input,
                                              validator: (input) =>
                                                  (input?.length ?? 0) < 1
                                                      ? "Please Enter Cityname"
                                                      : null,
                                              decoration: InputDecoration(
                                                  fillColor: Colors.grey,
                                                  focusColor: Colors.grey,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.blueAccent,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.pink,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                  prefixIcon: Padding(
                                                      // padding: EdgeInsets.symmetric(
                                                      //     horizontal: 20),
                                                      // child: Icon(
                                                      //   Icons.email,
                                                      //   size: 26,
                                                      //   color: Colors.green[900],
                                                      // ),
                                                      padding: EdgeInsets.only(
                                                          top: 6.8, left: 1),
                                                      child: Text(
                                                          "City Name : ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              // height: 5,
                                                              fontSize: 19))),
                                                  border: InputBorder.none,
                                                  hintText: "Cityname",
                                                  hintStyle: TextStyle(
                                                    color: Colors.green[900],
                                                    fontSize: 19,
                                                  )),
                                              style: TextStyle(
                                                  color: Colors.black),
                                              // keyboardType:
                                              //     TextInputType.emailAddress,
                                              textInputAction:
                                                  TextInputAction.next,
                                              cursorColor: Colors.black,
                                            ),
                                          ),

                                          Padding(
                                            // padding: EdgeInsets.symmetric(
                                            //     vertical: 10.0),
                                            padding: EdgeInsets.only(top: 10),

                                            child: TextFormField(
                                              initialValue: "1",
                                              onSaved: (input) => this
                                                  .updatemodel
                                                  .productweight = input,
                                              validator: (input) =>
                                                  (input?.length ?? 0) < 1
                                                      ? "Product Weight"
                                                      : null,
                                              //obscureText: hidePassword,
                                              decoration: InputDecoration(
                                                  fillColor: Colors.grey,
                                                  focusColor: Colors.grey,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.blueAccent,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.pink,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorStyle: TextStyle(
                                                      color: Colors.red),
                                                  prefixIcon: Padding(
                                                      // padding: EdgeInsets.symmetric(
                                                      //     horizontal: 20),
                                                      // child: Icon(
                                                      //   Icons.lock,
                                                      //   size: 26,
                                                      //   color: Colors.green[900],
                                                      // ),
                                                      padding: EdgeInsets.only(
                                                          top: 6.8, left: 1),
                                                      child: Text(
                                                          "Product  Weight : ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              // height: 5,
                                                              fontSize: 19))),
                                                  border: InputBorder.none,
                                                  hintText: "",
                                                  hintStyle: TextStyle(
                                                    color: Colors.green[900],
                                                    fontSize: 19,
                                                  )),
                                              style: TextStyle(
                                                  color: Colors.black),
                                              keyboardType: TextInputType.name,
                                              textInputAction:
                                                  TextInputAction.done,
                                              cursorColor: Colors.black,
                                            ),
                                          ),

                                          SizedBox(height: 1),

                                          // Padding(
                                          // padding: EdgeInsets.symmetric(
                                          //     vertical: 10.0),
                                          // padding: EdgeInsets.only(
                                          // top: 10, bottom: 20),

                                          // child: TextFormField(
                                          //  initialValue: "Kg",
                                          // onSaved: (input) => this
                                          //  .updatemodel
                                          // .productweightunit =
                                          // input,
                                          // validator: (input) => input
                                          // .length <
                                          // 1
                                          //? "Product Weight unit"
                                          // : null,
                                          //obscureText: hidePassword,
                                          //decoration: InputDecoration(
                                          //fillColor: Colors.grey,
                                          //focusColor: Colors.grey,

                                          // enabledBorder: OutlineInputBorder(
                                          // borderSide: BorderSide(
                                          // color: Colors.blueAccent,
                                          // ),
                                          // borderRadius: BorderRadius.circular(10.0),
                                          // ),

                                          // focusedBorder: OutlineInputBorder(
                                          //  borderSide: BorderSide(
                                          // color: Colors.pink,
                                          // ),
                                          // borderRadius: BorderRadius.circular(10.0),
                                          //),

                                          // errorStyle: TextStyle(
                                          //   color: Colors.red),
                                          // prefixIcon: Padding(
                                          // padding: EdgeInsets.symmetric(
                                          //     horizontal: 20),
                                          // child: Icon(
                                          //   Icons.lock,
                                          //   size: 26,
                                          //   color: Colors.green[900],
                                          // ),
                                          // padding:
                                          //EdgeInsets.only(
                                          // top: 6.8,
                                          // left: 1),
                                          // child: Text(
                                          //     "Product  Weight unit : ",
                                          //  style: TextStyle(
                                          //   color: Colors.green,
                                          // height: 5,
                                          // fontSize:
                                          //     19))),
                                          //border: InputBorder.none,
                                          //hintText: " kg/pcs",
                                          // hintStyle: TextStyle(
                                          // color:
                                          // Colors.green[900],
                                          // fontWeight:
                                          // FontWeight.bold,
                                          // fontSize: 19,
                                          // )),
                                          // style: TextStyle(
                                          // color: Colors.black),
                                          // keyboardType:
                                          // TextInputType.name,
                                          //textInputAction:
                                          // TextInputAction.done,
                                          // cursorColor: Colors.black,
                                          // ),
                                          //  ),

                                          SizedBox(height: 1),
                                        ],
                                      ),
                                      SizedBox(height: 05),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 50),
                                            backgroundColor: Colors.pinkAccent[100]!),
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
                                            print("Form saved successfully");
                                            print("Update model data: ${updatemodel.toJson()}");
                                            setState(() {
                                              isApicallProcess = true;
                                            });
                                            apiService
                                                .updateSamarpanaProduct(
                                                    this.updatemodel)
                                                .then((ret) {
                                              setState(() {
                                                isApicallProcess = false;
                                              });
                                              FormHelper.showMessage(
                                                  context,
                                                  "SUYOGA",
                                                  "Samarpana product updated successfully",
                                                  "OK", () {
                                                // if (globals.userRole ==
                                                //     "ROLE_SUYOGA_CITY_ADMIN") {
                                                //   Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             updatePricePage(
                                                //                 //categoryId: 1,
                                                //                 )),
                                                //   );
                                                // } else {
                                                //   Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             Productpage(
                                                //               categoryId: 1,
                                                //             )),
                                                //   );
                                                // }
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          updateSamarpanaPricePage(
                                                            cid: this
                                                                .widget
                                                                .pdata
                                                                .cId ?? 0,
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
                                          "update and save",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //gggg
                    Container(
                      padding: EdgeInsets.only(
                          top: 15.0, right: 10.0, left: 150.0, bottom: 10.0),
                      child: Column(children: <Widget>[
                        // Text(
                        //   "Sign Up",
                        //   style: TextStyle(
                        //       color: Colors.greenAccent[400],
                        //       fontWeight: FontWeight.w600,
                        //       fontSize: 35.0,
                        //       fontFamily: 'Merriweather'),
                        // ),
                        CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 70,
                            // child: Image.asset('assets/images/logo.png',
                            //     width: 100, height: 100, fit: BoxFit.fill),
                            child: Image.network(
                              Config.imageurl +
                                  (this.widget.pdata.productCode ?? '') +
                                  '.png',
                            )),
                        SizedBox(height: 10),

                        Text(
                          this.widget.pdata.productName ?? '',
                          style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 17.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            // "It should only take a couple of minutes",
                            "price : ${this.widget.pdata.price}",
                            style: TextStyle(
                              color: Colors.green[900],
                              fontSize: 15.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        // Container(
                        //     padding: EdgeInsets.only(top: 25),
                        //     child: FlatButton(
                        //       //height: 38.0,
                        //       //width: 100,
                        //       color: Colors.white,
                        //       shape: StadiumBorder(),
                        //       onPressed: () {
                        //         Navigator.push(context,
                        //             MaterialPageRoute(builder: (context) {
                        //           return new Login();
                        //         }));
                        //         print(
                        //             ">>>>>>>>>>>>>>>>>>>>>registration page login clicked");
                        //       },
                        //       child: Text(
                        //         "Login",
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        //     )),
                      ]),
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;

    if (form?.validate() ?? false) {
      form?.save();
      return true;
    }
    return false;
  }
}


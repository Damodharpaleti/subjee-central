import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subjeecentral/Config.dart';
import 'package:subjeecentral/models/product.dart';
import 'package:subjeecentral/models/updateProductModel.dart';
import 'package:subjeecentral/pages/updatePricePage.dart';
import 'package:subjeecentral/utils/ProgressHUD.dart';

import '../api_service.dart';
import 'package:subjeecentral/components/globals.dart' as globals;


import 'package:shared_preferences/shared_preferences.dart';

import '../utils/form_helper.dart';

class updateproduct extends StatefulWidget {
  updateproduct({Key? key, required this.pdata}) : super(key: key);
  final Product pdata;
  @override
  _updateproductState createState() => _updateproductState();
}

class _updateproductState extends State<updateproduct> {
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
    //updatemodel.product_code = this.widget.pdata.productCode;
    print("product code>>>>>>>>>>>>>>>");
    print(this.widget.pdata.productCode);
    print(this.widget.pdata.productName);
    //  usersignup = new User();
    //  this.getSWData();
  }

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
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
          title: Text("Edit Product Details"),
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
            child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.50,
                height: double.infinity,
                child: Form(
                  key: globalFormKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 05),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            initialValue: this.widget.pdata.productName,
                            onSaved: (input) =>
                                this.updatemodel.productname = input,
                            validator: (input) =>
                                (input?.length ?? 0) < 1 ? "Product name" : null,
                            decoration: InputDecoration(
                                fillColor: Colors.grey,
                                focusColor: Colors.grey,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.pink,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(top: 6.8, left: 1),
                                  child: Text("Product name :",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          // height: 5,
                                          fontSize: 19)),
                                ),
                                border: InputBorder.none,
                                hintText: this.widget.pdata.productName,
                                hintStyle: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 19,
                                )),
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            initialValue: this.widget.pdata.productCode,
                            onSaved: (input) =>
                                this.updatemodel.productcode = input,
                            validator: (input) =>
                                (input?.length ?? 0) < 1 ? "Product code" : null,
                            decoration: InputDecoration(
                                fillColor: Colors.grey,
                                focusColor: Colors.grey,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.pink,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
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
                                  //   color: Colors.green[900],
                                  // ),
                                  child: Text("Product Code :",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          // height: 5,
                                          fontSize: 19)),
                                ),
                                border: InputBorder.none,
                                hintText: this.widget.pdata.productCode,
                                hintStyle: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 19,
                                )),
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            initialValue: this.widget.pdata.productDescription,
                            onSaved: (input) =>
                                this.updatemodel.productdescription = input,
                            validator: (input) =>
                                (input?.length ?? 0) < 1 ? "product_description" : null,
                            decoration: InputDecoration(
                                fillColor: Colors.grey,
                                focusColor: Colors.grey,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.pink,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
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
                                    padding: EdgeInsets.only(top: 6.8, left: 1),
                                    child: Text("Product Description : ",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            // height: 5,
                                            fontSize: 19))),
                                border: InputBorder.none,
                                hintText: this.widget.pdata.productDescription,
                                hintStyle: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 19,
                                )),
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            initialValue: this.widget.pdata.price,
                            onSaved: (input) => this.updatemodel.pricevalue =
                                double.parse(input ?? '0'),
                            validator: (input) =>
                                (input?.length ?? 0) < 1 ? "Product price" : null,
                            decoration: InputDecoration(
                                fillColor: Colors.grey,
                                focusColor: Colors.grey,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.pink,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
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
                                    padding: EdgeInsets.only(top: 6.8, left: 1),
                                    child: Text("product Price : ",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            // height: 5,
                                            fontSize: 19))),
                                border: InputBorder.none,
                                hintText: this.widget.pdata.price,
                                hintStyle: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 19,
                                )),
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            initialValue: this.widget.pdata.marketPrice,
                            onSaved: (input) => this.updatemodel.marketprice =
                                double.parse(input ?? '0'),
                            validator: (input) => (input?.length ?? 0) < 1
                                ? "Please Enter Market price"
                                : null,
                            decoration: InputDecoration(
                                fillColor: Colors.grey,
                                focusColor: Colors.grey,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.pink,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                prefixIcon: Padding(
                                    padding: EdgeInsets.only(top: 6.8, left: 1),
                                    child: Text("Market Price : ",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            // height: 5,
                                            fontSize: 19))),
                                border: InputBorder.none,
                                hintText: this.widget.pdata.marketPrice,
                                hintStyle: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 19,
                                )),
                            style: TextStyle(color: Colors.black),
                            // keyboardType:
                            //     TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            // initialValue: "Bengaluru",
                            initialValue: globals.globalCity,

                            onSaved: (input) =>
                                this.updatemodel.cityName = input,
                            validator: (input) => (input?.length ?? 0) < 1
                                ? "Please Enter Cityname"
                                : null,
                            decoration: InputDecoration(
                                fillColor: Colors.grey,
                                focusColor: Colors.grey,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.pink,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
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
                                    padding: EdgeInsets.only(top: 6.8, left: 1),
                                    child: Text("City Name : ",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            // height: 5,
                                            fontSize: 19))),
                                border: InputBorder.none,
                                hintText: "Cityname",
                                hintStyle: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 19,
                                )),
                            style: TextStyle(color: Colors.black),
                            // keyboardType:
                            //     TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            initialValue:
                                this.widget.pdata.priceMinQuantity.toString(),
                            onSaved: (input) =>
                                this.updatemodel.productweight = input,
                            validator: (input) =>
                                (input?.length ?? 0) < 1 ? "Product Weight" : null,
                            //obscureText: hidePassword,
                            decoration: InputDecoration(
                                fillColor: Colors.grey,
                                focusColor: Colors.grey,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.pink,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorStyle: TextStyle(color: Colors.red),
                                prefixIcon: Padding(
                                    padding: EdgeInsets.only(top: 6.8, left: 1),
                                    child: Text("Product  Weight : ",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            // height: 5,
                                            fontSize: 19))),
                                border: InputBorder.none,
                                hintText: "",
                                hintStyle: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 19,
                                )),
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            cursorColor: Colors.black,
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 70),
                          backgroundColor: Colors.pinkAccent[100],
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {
                          print("update and save clicked>>>>>>>>>>>>");
                          // print(updatemodel.productname);
                          // print(updatemodel.cityName);
                          // print(updatemodel.productdescription);
                          print(updatemodel.pricevalue);
                          print("update and save clicked>>>>>>>>>>>>");
                          if (validateAndSave()) {
                            print(updatemodel.toJson());
                            setState(() {
                              isApicallProcess = true;
                            });
                            apiService
                                .updateProductnew(this.updatemodel)
                                .then((ret) {
                              setState(() {
                                isApicallProcess = false;
                              });
                              // Check if update was successful
                              if (ret.statusCode == 200 || ret.statusCode == 201) {
                                FormHelper.showMessage(context, "SUYOGA",
                                    "product updated successfully", "OK", () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => updatePricePage(
                                            //categoryId: 1,
                                            )),
                                  );
                                });
                              } else {
                                // Show error message if update failed
                                FormHelper.showMessage(context, "Error",
                                    ret.message ?? "Failed to update product. Please try again.", "OK", () {
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
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 05.0, right: 10.0, left: 150.0, bottom: 020.0),
              child: Column(children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 70,
                    // child: Image.asset('assets/images/logo.png',
                    //     width: 100, height: 100, fit: BoxFit.fill),
                    child: Image.network(
                      Config.imageurl + (this.widget.pdata.productCode ?? '') + '.png',
                    )),
                SizedBox(height: 10),
                Text(
                  (this.widget.pdata.productName ?? ''),
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
          ],
        )));
    //     ),
    //   ),
    // );
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


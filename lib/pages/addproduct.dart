import 'package:flutter/material.dart';
import 'package:subjeecentral/models/updateProductModel.dart';
import 'package:subjeecentral/pages/updatePricePage.dart';
import 'package:subjeecentral/utils/ProgressHUD.dart';

import '../api_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/form_helper.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
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
  late String name;
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
    this.updatemodel.productId = 0;
    this.updatemodel.active = "1";

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
        title: Text("Add New Product"),
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
        actions: <Widget>[],
      ),
      backgroundColor: Colors.greenAccent.withOpacity(0.3),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, Constraints) {
          if (Constraints.maxWidth < 500) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 16, left: 12, right: 12),
                child: Form(
                    key: globalFormKey,
                    child: Column(children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                  this.updatemodel.productname = input,
                              validator: (input) => (input?.isEmpty ?? true)
                                  ? "Product name"
                                  : null,
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
                                    child: Text("Prod name :",
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
                                    this.updatemodel.productcode = input,
                                validator: (input) => (input?.isEmpty ?? true)
                                    ? "Product code"
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
                                      child: Text("Prod code :",
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
                                    this.updatemodel.productdescription = input,
                                validator: (input) => (input?.isEmpty ?? true)
                                    ? "Product desc"
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
                                      child: Text("Prod Desc :",
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
                                    .updatemodel
                                    .marketprice = double.parse(input ?? '0'),
                                validator: (input) => (input?.isEmpty ?? true)
                                    ? "Market price"
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
                                      child: Text("Market price :",
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
                                    .updatemodel
                                    .pricevalue = double.parse(input ?? '0'),
                                validator: (input) =>
                                    (input?.isEmpty ?? true) ? "Price" : null,
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
                                      child: Text("price :",
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
                                    this.updatemodel.productvendor = input,
                                validator: (input) => (input?.isEmpty ?? true)
                                    ? "Product Vendor"
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
                                      child: Text("Product Vendor :",
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
                                    .updatemodel
                                    .priceminquantity = int.parse(input ?? '0'),
                                validator: (input) => (input?.isEmpty ?? true)
                                    ? "Min Quantity"
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
                                      child: Text("Min Quantity :",
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
                                onSaved: (input) => this.updatemodel.cityId =
                                    int.parse(input ?? '0'),
                                validator: (input) =>
                                    (input?.isEmpty ?? true) ? "City id" : null,
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
                                      child: Text("City Id :",
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
                                    .updatemodel
                                    .categoryid = int.parse(input ?? '0'),
                                validator: (input) => (input?.isEmpty ?? true)
                                    ? "Category Id"
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
                                      child: Text("Category Id :",
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
                                    this.updatemodel.productweight = input,
                                validator: (input) => (input?.isEmpty ?? true)
                                    ? "Product Weight"
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
                                      child: Text("Prod Weight :",
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
                                    this.updatemodel.productweightunit = input,
                                validator: (input) => (input?.isEmpty ?? true)
                                    ? "Product weight unit"
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
                                      child: Text("Prod weight unit :",
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
                                    this.updatemodel.productTitle = input,
                                validator: (input) => (input?.isEmpty ?? true)
                                    ? "Product Title"
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
                                      child: Text("Product Title :",
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
                                    this.updatemodel.brandName = input,
                                validator: (input) => (input?.isEmpty ?? true)
                                    ? "Brand Name"
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
                                      child: Text("Brand Name :",
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
                                    this.updatemodel.cityName = input,
                                validator: (input) => (input?.isEmpty ?? true)
                                    ? "City Name"
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
                                    FormHelper.showMessage(context, "SUYOGA",
                                        "product Added successfully", "OK", () {
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
                                "save Product",
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
            return Card(
                color: Colors.greenAccent.withOpacity(0.3),
                //shape: RoundedRectangleBorder(
                //borderRadius: BorderRadius.circular(40.0)),
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
                                    left: 180, right: 30, top: 30),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) =>
                                        this.updatemodel.productname = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
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
                                          //
                                          // ),
                                          child: Text("Prod name :",
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
                              Padding(
                                //padding: EdgeInsets.symmetric(vertical: 10.0),
                                padding: EdgeInsets.only(
                                    left: 110, top: 30, right: 10),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) => this
                                        .updatemodel
                                        .cityId = int.parse(input ?? '0'),
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
                                            ? "City id"
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
                                          child: Text("City Id :",
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
                                    left: 180, right: 30, top: 10),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) =>
                                        this.updatemodel.productcode = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
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
                                          //
                                          // ),
                                          child: Text("Prod code :",
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
                              Padding(
                                //padding: EdgeInsets.symmetric(vertical: 10.0),
                                padding: EdgeInsets.only(
                                    left: 110, top: 10, right: 20),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) => this
                                        .updatemodel
                                        .categoryid = int.parse(input ?? '0'),
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
                                            ? "Category Id"
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
                                          child: Text("Category Id :",
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
                                    left: 180, right: 30, top: 10),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) => this
                                        .updatemodel
                                        .productdescription = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
                                            ? "Product desc"
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
                                          child: Text("Prod Desc :",
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
                              Padding(
                                //padding: EdgeInsets.symmetric(vertical: 10.0),
                                padding: EdgeInsets.only(
                                    left: 110, top: 10, right: 20),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) =>
                                        this.updatemodel.productweight = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
                                            ? "Product Weight"
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
                                          child: Text("Prod Weight :",
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
                                    left: 180, right: 30, top: 10),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) =>
                                        this.updatemodel.marketprice =
                                            double.parse(input ?? '0'),
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
                                            ? "Market price"
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
                                          child: Text("Market price :",
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
                              Padding(
                                //padding: EdgeInsets.symmetric(vertical: 10.0),
                                padding: EdgeInsets.only(
                                    left: 110, top: 10, right: 20),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) => this
                                        .updatemodel
                                        .productweightunit = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
                                            ? "Product weight unit"
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
                                          child: Text("Prod weight unit :",
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
                                    left: 180, right: 30, top: 10),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) =>
                                        this.updatemodel.pricevalue =
                                            double.parse(input ?? '0'),
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
                                            ? "Price"
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
                                          child: Text("price :",
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
                              Padding(
                                //padding: EdgeInsets.symmetric(vertical: 10.0),
                                padding: EdgeInsets.only(
                                    left: 110, top: 10, right: 20),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) =>
                                        this.updatemodel.productTitle = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
                                            ? "Product Title"
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
                                          child: Text("Product Title :",
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
                                    left: 180, right: 30, top: 10),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) =>
                                        this.updatemodel.productvendor = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
                                            ? "Product Vendor"
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
                                          child: Text("Product Vendor :",
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
                              Padding(
                                //padding: EdgeInsets.symmetric(vertical: 10.0),
                                padding: EdgeInsets.only(
                                    left: 110, top: 10, right: 20),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) =>
                                        this.updatemodel.brandName = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
                                            ? "Brand Name"
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
                                          child: Text("Brand Name :",
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
                                    left: 180, right: 30, top: 10),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) =>
                                        this.updatemodel.priceminquantity =
                                            int.parse(input ?? '0'),
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
                                            ? "Min Quantity"
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
                                          child: Text("Min Quantity :",
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
                              Padding(
                                //padding: EdgeInsets.symmetric(vertical: 10.0),
                                padding: EdgeInsets.only(
                                    left: 110, top: 10, right: 20),
                                child: Container(
                                  height: 40,
                                  width: 300,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onSaved: (input) =>
                                        this.updatemodel.cityName = input,
                                    validator: (input) =>
                                        (input?.isEmpty ?? true)
                                            ? "City Name"
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
                          Container(
                            padding: EdgeInsets.only(left: 450, top: 50),
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
                                        FormHelper.showMessage(
                                            context,
                                            "SUYOGA",
                                            "product Added successfully",
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
                                    "save Product",
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





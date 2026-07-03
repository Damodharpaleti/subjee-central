import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:subjeecentral/Config.dart';
import 'package:subjeecentral/api_service.dart';
// import 'package:subjeecentral/components/UserApiProvider.dart';
import 'package:subjeecentral/models/DeliverPartnerModel.dart';
import 'package:subjeecentral/models/PincodeModel.dart';

// import 'package:subjeecentral/models/PartnerModel.dart';
// import 'package:subjeecentral/pages/AddPartner.dart';
import 'package:subjeecentral/pages/addPincode.dart';
// import 'package:subjeecentral/pages/updatePricePage.dart';

import '../utils/VerifyPage_FormHelper.dart';

// ignore: must_be_immutable
class DeliverypartnerList extends StatefulWidget {
  DeliverypartnerList({Key? key, required this.subjeepartnerId}) : super(key: key);
  final int subjeepartnerId;
  @override
  DeliverypartnerListState createState() => DeliverypartnerListState();
}

class DeliverypartnerListState extends State<DeliverypartnerList> {
  //List<PartnerModel> emps;
  List<DeliverPartnerModel> data = [];
  // UserApiProvider _apiProvider = UserApiProvider();
  late APIService apiService;
  List<PincodeModel> deliveryPartner = [];
  bool colorenable = false;
 

  void _incrementEnter(PointerEvent details) {
    setState(() {
      colorenable = true;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      colorenable = false;
    });
  }

  var onDelete;

  Future generateProductList() async {
    print("delivery Partner Url>>>>>>>>>>>>>>>>>>>");
    print(this.widget.subjeepartnerId);
    int spId = this.widget.subjeepartnerId;
    //Config.url+Config.getPartnersList
    // var response = await http.get(Uri.parse(
    //     'http://44.192.46.200:8083/subjeeCentralService/product/v1/getDeliveryPartnerList?subjeepartnerId=$spId'));

    var response = await http.get(Uri.parse(Config.url +
        Config.getDeliveryPartnersList +
        '?subjeepartnerId=$spId'));
    var list = json.decode(response.body).cast<Map<String, dynamic>>();
    deliveryPartner = await list
        .map<PincodeModel>((json) => PincodeModel.fromJson(json))
        .toList();

    return deliveryPartner;
  }

  @override
  void initState() {
    apiService = new APIService();
    dataFetch();
    //emps = generateProductList() as List<PartnerModel>;
    super.initState();
  }

  void dataFetch() {
    generateProductList().then((result) {
      print(result);
      setState(() {
        deliveryPartner = result;
        print("emps>>>>>>>>>>>>>>>>>>>>>>>>>");
        print(deliveryPartner.length);
        print(deliveryPartner[0].vendorName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Delivery Partner List'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          // Padding(
          //     padding: EdgeInsets.only(right: 20.0),
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: Icon(
          //         Icons.search,
          //         size: 26.0,
          //       ),
          //     )),
          // Padding(
          //     padding: EdgeInsets.only(right: 20.0, top: 15),
          //     child: GestureDetector(
          //       onTap: () {
          //         Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => AddPartnerPage(
          //               // categoryId: 1,
          //               //patnerId: mySelection,
          //               ),
          //         ));
          //       },
          //       //child: Icon(Icons.add),
          //       child: Text(
          //         'Add Delivery Partner',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     )
          //     ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, Constraints) {
          if (Constraints.maxWidth < 768) {
            return new Center(
                child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 6),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // padding: EdgeInsets.only(top: 20, left: 160, right: 160),
                        // width: 1400,
                        // height: 460,
                        padding: EdgeInsets.only(top: 10, left: 16, right: 100),
                        width: 1000,
                        height: 520,
                        child: Card(
                          color: Colors.white,
                          child: tableBody(
                            context,
                          ),
                        ),
                      ),
                    ]),
              )
            ]));
          } else {
            return new Center(
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 65, left: 900, right: 160),
                  // child: Card(
                  //   child: Text("Add Delivery Partner"),
                  // ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 05, left: 0.5, right: 0.5),
                  width: 1000,
                  height: 400,
                  child: Card(
                    color: Colors.white,
                    child: tableBody(
                      context,
                    ),
                  ),
                ),
              ]),
            );
          }
        }),
      ),
    );
  }

  SingleChildScrollView tableBody(BuildContext ctx) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddPincodePage(
                                patnerId: this.widget.subjeepartnerId,
                              )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Add delivery partner',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                ),
                SafeArea(
                  child: LayoutBuilder(builder: (context, Constraints) {
                    if (Constraints.maxWidth < 768) {
                      print(deliveryPartner);
                      return DataTable(
                        dataRowHeight: 30,
                        dividerThickness: 1,
                        columns: [
                          DataColumn(
                            // label: Text(
                            //   "First Name",
                            //   style: TextStyle(
                            //     fontStyle: FontStyle.italic,
                            //     color: Colors.deepOrange,
                            //   ),
                            // ),
                            label: Container(
                              width: 15,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: false,
                            tooltip: "This is First Name",
                          ),
                          DataColumn(
                            label: Container(
                              alignment: Alignment.center,
                              width: 15,
                              child: Text(
                                'Postal Code',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: false,
                            tooltip: "This is Last Name",
                          ),
                          DataColumn(
                            label: Container(
                              width: 15,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Mobile Number',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: true,
                          ),
                          // DataColumn(
                          //   label: Container(
                          //     width: 15,
                          //     child: Text(
                          //       'email',
                          //       style: TextStyle(
                          //
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //   ),
                          //   numeric: false,
                          // ),
                          DataColumn(
                            label: Container(
                              width: 15,
                              child: Text(
                                'Address 1',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: false,
                          ),

                          DataColumn(
                            label: Container(
                              width: 15,
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: false,
                          ),
                        ],
                        rows: deliveryPartner
                            .map(
                              (deliveryPartner) => DataRow(cells: [
                                DataCell(
                                    //Text(deliveryPartner.vendorName),
                                    Text(deliveryPartner.vendorName ?? "N/A")),
                                DataCell(
                                  //Text(deliveryPartner.postalCode),
                                  Text(deliveryPartner.postalcode ?? "N/A"),
                                ),
                                DataCell(
                                  Container(
                                    width: 15,
                                    alignment: Alignment.centerLeft,
                                    //child: Text(deliveryPartner.mobileNumber),
                                    child: Text(
                                        deliveryPartner.mobileNumber ?? "N/A"),
                                  ),
                                ),
                                // DataCell(
                                //   Container(
                                //     width: 15,
                                //     alignment: Alignment.centerLeft,
                                //     child: Text(deliveryPartner.email == null
                                //         ? "N/A"
                                //         : deliveryPartner.email),
                                //   ),
                                // ),
                                DataCell(
                                  Container(
                                    width: 15,
                                    alignment: Alignment.centerLeft,
                                    child: Text(deliveryPartner.address1 ?? "N/A"),
                                  ),
                                ),
                              ]),
                            )
                            .toList(),
                      );
                    } else {
                      return DataTable(
                        dataRowHeight: 50,
                        dividerThickness: 5,
                        columns: [
                          DataColumn(
                            // label: Text(
                            //   "First Name",
                            //   style: TextStyle(
                            //     fontStyle: FontStyle.italic,
                            //     color: Colors.deepOrange,
                            //   ),
                            // ),
                            label: Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: false,
                            tooltip: "This is First Name",
                          ),
                          DataColumn(
                            label: Container(
                              alignment: Alignment.center,
                              width: 100,
                              child: Text(
                                'Postal Code',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: false,
                            tooltip: "This is Last Name",
                          ),
                          DataColumn(
                            label: Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Mobile Number',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: true,
                          ),
                          // DataColumn(
                          //   label: Container(
                          //     width: 100,
                          //     child: Text(
                          //       'email',
                          //       style: TextStyle(
                          //
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //   ),
                          //   numeric: false,
                          // ),
                          DataColumn(
                            label: Container(
                              width: 150,
                              child: Text(
                                'Address 1',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: false,
                          ),

                          DataColumn(
                            label: Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: true,
                          ),
                        ],
                        rows: deliveryPartner
                            .map(
                              (deliveryPartner) => DataRow(cells: [
                                DataCell(
                                    //Text(deliveryPartner.vendorName),
                                    Text(deliveryPartner.vendorName ?? "N/A")),
                                DataCell(
                                  //Text(deliveryPartner.postalCode),
                                  Text(deliveryPartner.postalcode ?? "N/A"),
                                ),
                                DataCell(
                                  Container(
                                    width: 100,
                                    alignment: Alignment.centerLeft,
                                    //child: Text(deliveryPartner.mobileNumber),
                                    child: Text(
                                        deliveryPartner.mobileNumber ?? "N/A"),
                                  ),
                                ),
                                // DataCell(
                                //   Container(
                                //     width: 100,
                                //     alignment: Alignment.centerLeft,
                                //     child: Text(deliveryPartner.email == null
                                //         ? "N/A"
                                //         : deliveryPartner.email),
                                //   ),
                                // ),
                                DataCell(
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    alignment: Alignment.centerLeft,
                                    child: Text(deliveryPartner.address1 ?? "N/A"),
                                  ),
                                ),
                                DataCell(Container(
                                  child: MouseRegion(
                                    onEnter: _incrementEnter,
                                    onExit: _incrementExit,
                                    child: Container(
                                      
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            color: setColor(deliveryPartner.id ?? 0),
                                            onPressed: () {
                                              _showDialog(deliveryPartner.id ?? 0);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),

                                // DataCell(TextButton(
                                //   child: Text(
                                //     "Add Delivery Partner",
                                //     style: TextStyle(fontSize: 10),
                                //   ),
                                //   style: TextButton.styleFrom(
                                //     primary: Colors.white,
                                //     background
                                //   ),
                                //   onPressed: () {
                                //     // print("printing id>>>>>>>>>>>>>>>");
                                //     // print(deliveryPartner.id);
                                //     // Navigator.of(context).push(MaterialPageRoute(
                                //     //   builder: (context) => AddPincodePage(
                                //     //     // categoryId: 1,
                                //     //     patnerId: deliveryPartner.id,
                                //     //   ),
                                //     // ));
                                //   },
                                // )
                                // ),
                              ]),
                            )
                            .toList(),
                      );
                    }
                  }),
                ),
              ]),
        ));
  }

  void _showDialog(int pincodeid) async {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Suyoga"),
          content: new Text("Are you sure you want to delete"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new ElevatedButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new ElevatedButton(
              child: new Text("YES"),
              onPressed: () {
                print(pincodeid);
                apiService.deletepincode(pincodeid).then((value) {
                  if (value) {
                    FormHelper.showMessage(
                        context, "suyoga", "pincode delete sucessfully", "ok",
                        () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeliverypartnerList(
                                    subjeepartnerId:
                                        this.widget.subjeepartnerId,
                                  )));
                    });
                  }
                });
                // // prefs.clear();
                // prefs.remove("localresponse");
                // prefs.remove("Eachproduct");
                // prefs.remove("loginmobileNumber");
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => Login(),
                // ));
              },
            ),
          ],
        );
      },
    );
  }

  setColor(int id) {}
}






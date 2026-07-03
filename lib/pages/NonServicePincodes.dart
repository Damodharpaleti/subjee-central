// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:subjeecentral/api_service.dart';
import 'package:subjeecentral/models/NonserviceModel.dart';

import '../Config.dart';

// ignore: must_be_immutable
class NonServicePincodeslist extends StatefulWidget {
  

  NonServicePincodeslist({Key? key, required this.subjeepincodeId}) : super(key: key);
  final int subjeepincodeId;
  @override
  State<NonServicePincodeslist> createState() => _NonServicePincodelistState();
}

bool colorenable = false;

class _NonServicePincodelistState extends State<NonServicePincodeslist> {
  List<GetNonserviceModel> data = <GetNonserviceModel>[];
  late APIService apiService;

  List<GetNonserviceModel> pincodes = [];
  Future<List<GetNonserviceModel>> getNonservicepincodes() async {
    List<GetNonserviceModel> data = <GetNonserviceModel>[];
    print("calling Step 1>>>>>>");

    try {
      String url = Config.url + Config.getnonservicelist;
      // String url =
      //     "http://44.192.46.200:8083/subjeeCentralService/orders/v1/getOrdersList?status=C";
     // print("Location hardcode>>>>>>>>>");
      // print(Location.replaceAll('"', ""));
      print("Location hardcode>>>>>>>>>");
      var response = await Dio().get(url,
          options: new Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
      if (response.statusCode == 200) {
        print("new one Api>>");
        data = (response.data as List)
            .map((i) => GetNonserviceModel.fromJson(i))
            .toList(); 
        setState(() {
          pincodes = data;
        });
        print("data>>>>>>>>>");
        print(pincodes.length);
        if (pincodes.isNotEmpty) {
          print(pincodes[0].id);
        }
      }
    } on DioException catch (e) {
      print("no new one");
      print(e.response);
    }
    return data;
  }

  // Future generatePincodelist() async {
  //   String url = Config.url + Config.getnonservicellist;
  //   // var response = await http.get(Uri.parse(
  //   //     'http://44.192.46.200:8083/subjeeCentralService/product/v1/getPartnerList'));
  //   var response = await Dio().get(url,
  //       options: new Options(
  //           headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
  //   //   Uri.parse(Config.url + Config.Pincodelist, headers: {
  //   //     "Accept": "application/json",
  //   //     "Access-Control_Allow_Origin": "*"
  //   //   }),
  //   // );
  //   print(response.data);
  //   //print(Config.url + Config.Pincodelist);
  //   var list = json.decode(response.data).cast<Map<String, dynamic>>();
  //   print(response.data);
  //   emps = await list
  //       .map<GetNonserviceModel>((json) => GetNonserviceModel.fromJson(json))
  //       .toList();
  //   print(emps);
  //   //jsonDataGridSource = _JsonDataGridSource(productlist);
  //   return emps;
  // }

  @override
  void initState() {
    apiService = new APIService();
    getNonservicepincodes();
    // generatePincodelist();
    super.initState();

    // var orderProvider = Provider.of<CartProvider>(context, listen: false);
    // orderProvider.fetchOrders();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[900],
        title: Text('Non Service Pincodes'),
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
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 19),
                  width: 300,
                  height: 200,
                  child: Card(
                    color: Colors.white,
                    child: tableBody(
                      context,
                    ),
                  ),
                )
              ]),
            );
          } else {
            return new Center(
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 65, left: 600, right: 150),
                  // child: Card(
                  //   child: Text("Add Delivery Partner"),
                  // ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 0, right: 0),
                  //width: MediaQuery.of(context).size.width*0.70,
                  height:350,
                  width:1100,
                  child: Card(
                    color: Colors.white,
                    child: tableBody(
                      context,
                    ),
                  ),
                )
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
              SafeArea(
                // child: LayoutBuilder(builder: (context, Constraints) {
                //   if (Constraints.maxWidth < 768) {
                //     return DataTable(
                //       dataRowHeight: 90,
                //       dividerThickness: 5,
                //       columns: [
                //         DataColumn(
                //           label: Container(
                //             width: 40,
                //             alignment: Alignment.centerLeft,
                //             child: Text(
                //               'customer name',
                //               style: TextStyle(
                //                   color: Colors.green[900],
                //                   fontWeight: FontWeight.bold),
                //             ),
                //           ),
                //           numeric: false,
                //           tooltip: "This is First Name",
                //         ),
                //         DataColumn(
                //           label: Container(
                //             alignment: Alignment.centerLeft,
                //             width: 40,
                //             child: Text(
                //               'mobile number',
                //               style: TextStyle(
                //                   color: Colors.green[900],
                //                   fontWeight: FontWeight.bold),
                //             ),
                //           ),
                //           numeric: false,
                //           tooltip: "This is Last Name",
                //         ),
                //         DataColumn(
                //           // label: Text(
                //           //   "Id",
                //           //   style: TextStyle(
                //           //     fontStyle: FontStyle.italic,
                //           //     color: Colors.deepOrange,
                //           //   ),
                //           // ),
                //           label: Container(
                //             width: 40,
                //             alignment: Alignment.centerLeft,
                //             child: Text(
                //               'Address',
                //               style: TextStyle(
                //                   color: Colors.green[900],
                //                   fontWeight: FontWeight.bold),
                //             ),
                //           ),
                //           numeric: true,
                //         ),
                //         DataColumn(
                //           // label: Text(
                //           //   "Id",
                //           //   style: TextStyle(
                //           //     fontStyle: FontStyle.italic,
                //           //     color: Colors.deepOrange,
                //           //   ),
                //           // ),
                //           label: Container(
                //             width: 40,
                //             alignment: Alignment.centerLeft,
                //             child: Text(
                //               'pincode',
                //               style: TextStyle(
                //                   color: Colors.green[900],
                //                   fontWeight: FontWeight.bold),
                //             ),
                //           ),
                //           numeric: true,
                //         ),
                //       ],
                //       rows: pincodes
                //           .map(
                //             (pincodes) => DataRow(cells: [
                //               DataCell(
                //                 Text(pincodes.customerName.toString()),
                //               ),
                //               DataCell(
                //                 Text(pincodes.mobileNumber.toString()),
                //               ),
                //               DataCell(
                //                 Text(pincodes.address.toString()),
                //               ),
                //               DataCell(
                //                 // Text('${emp.city}'),
                //                 //Text(emp.city),
                //                 Container(
                //                   width: 100,
                //                   alignment: Alignment.centerLeft,
                //                   child: Text(pincodes.pincode.toString()),
                //                 ),
                //               ),
                //             ]),
                //           )
                //           .toList(),
                //     );
                //   } else {
                //     //var emps;
                    child: DataTable(
                      dataRowHeight: 50,
                      dividerThickness: 5,
                      columns: [
                        DataColumn(
                          label: Text(
                            'Customer name',
                            style: TextStyle(
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold),
                          ),
                          numeric: false,
                          tooltip: "This is First Name",
                        ),
                        DataColumn(
                          label: Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: Text(
                              'Mobile number',
                              style: TextStyle(
                                  color: Colors.green[900],
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
                              'Address',
                              style: TextStyle(
                                  color: Colors.green[900],
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
                              'Pincodes',
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          numeric: false,
                        ),
                      ],
                      rows: pincodes
                          .map(
                            (emp) => DataRow(cells: [
                              DataCell(
                                Text(emp.customerName.toString()),
                              ),
                              DataCell(
                                Text(emp.mobileNumber.toString()),
                              ),
                              DataCell(
                                Text(emp.address.toString()),
                              ),
                              DataCell(
                                Container(
                                  width: 100,
                                  alignment: Alignment.centerLeft,
                                  child: Text(emp.pincode.toString()),
                                ),
                              ),
                       
                            ]),
                          )
                          .toList(),
      ))])));
                  }
              //  }),
           //   ),
         //   ]),
    //  ),
  //  );
  }

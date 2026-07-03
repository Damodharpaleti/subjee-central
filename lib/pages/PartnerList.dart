// import 'dart:convert';
// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:localstorage/localstorage.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:http/http.dart' as http;
// import 'package:subjeecentral/components/UserApiProvider.dart';
// import 'package:subjeecentral/models/PartnerModel.dart';
// import 'package:subjeecentral/pages/AddPartner.dart';
// import 'package:subjeecentral/pages/addPincode.dart';
// import 'package:subjeecentral/pages/productpage.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'package:subjeecentral/components/globals.dart' as globals;

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:subjeecentral/Config.dart';

import 'package:subjeecentral/models/PartnerModel.dart';
import 'package:subjeecentral/pages/AddPartner.dart';
import 'package:subjeecentral/pages/DeliveryPartnersList.dart';

// class testDatatable extends StatefulWidget {

// import 'dart:convert';
// import 'dart:js';

// class testDatatable extends StatefulWidget {
//   @override
//   // State<testDatatable> createState() => _testDatatableListState();
//   _testDatatableListState createState() => _testDatatableListState();
// }

// class _testDatatableListState extends State<testDatatable> {

class partnerList extends StatefulWidget {
  @override
  partnerListState createState() => partnerListState();
}

class partnerListState extends State<partnerList> {
  String? mySelection;
  //List<PartnerModel> emps;
  List<PartnerModel> data = [];

  List<PartnerModel> emps = [];

  Future generateProductList() async {
    // var response = await http.get(Uri.parse(
    //     'http://44.192.46.200:8083/subjeeCentralService/product/v1/getPartnerList'));
    var response =
        await http.get(Uri.parse(Config.url + Config.getPartnersList));
    var list = json.decode(response.body).cast<Map<String, dynamic>>();
    emps = await list
        .map<PartnerModel>((json) => PartnerModel.fromJson(json))
        .toList();
    //jsonDataGridSource = _JsonDataGridSource(productlist);
    return emps;
  }

  @override
  void initState() {
    dataFetch();
    //emps = generateProductList() as List<PartnerModel>;
    super.initState();
  }

  void dataFetch() {
    generateProductList().then((result) {
      print(result);
      setState(() {
        emps = result;
        print("emps>>>>>>>>>>>>>>>>>>>>>>>>>");
        print(emps);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[900],
        title: Text('Managing Partner List'),
        actions: <Widget>[],
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, Constraints) {
          if (Constraints.maxWidth < 850) {
            return new Center(
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                          backgroundColor: Colors.green[900],
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddPartnerPage(
                                // categoryId: 1,
                                //patnerId: mySelection,
                                ),
                          ));
                        },
                        child: Text(
                          "Add Managing Partner",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.white,
                  // padding: EdgeInsets.only(top: 65),
                  // padding: EdgeInsets.only(top: 20, left: 160, right: 160),
                  padding: EdgeInsets.only(top: 10, left: 19, right: 19),
                  width: 600,
                  height: 420,
                  child: Card(
                    color: Colors.white,
                    child: tableBody(
                      context,
                    ),
                    // child: FutureBuilder(
                    //     future: generateProductList(),
                    //     builder: (BuildContext context,
                    //         AsyncSnapshot<dynamic> snapshot) {
                    //       return snapshot.hasData
                    //           ? SfDataGrid(
                    //               source: jsonDataGridSource, columns: getColumns())
                    //           : Center(
                    //               child: CircularProgressIndicator(
                    //                 strokeWidth: 3,
                    //               ),
                    //             );
                    //     })
                  ),
                )
              ]),
            );
          } else {
            return new Center(
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 65, left: 700, right: 150),
                  // child: Card(
                  //   child: Text("Add Delivery Partner"),
                  // ),
                ),
                Container(
                  // color: Colors.white,
                  // padding: EdgeInsets.only(top: 65),
                  padding: EdgeInsets.only(top: 20, left: 16, right: 50),
                  width: 1000,
                  height: 400,
                  child: Card(
                    color: Colors.white,
                    child: tableBody(
                      context,
                    ),
                    // child: FutureBuilder(
                    //     future: generateProductList(),
                    //     builder: (BuildContext context,
                    //         AsyncSnapshot<dynamic> snapshot) {
                    //       return snapshot.hasData
                    //           ? SfDataGrid(
                    //               source: jsonDataGridSource, columns: getColumns())
                    //           : Center(
                    //               child: CircularProgressIndicator(
                    //                 strokeWidth: 3,
                    //               ),
                    //             );
                    //     })
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
              TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.green)),
                    backgroundColor: Colors.green[900],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Add Managing Partner',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddPartnerPage(
                          // categoryId: 1,
                          //patnerId: mySelection,
                          ),
                    ));
                  }),
              SafeArea(
                child: LayoutBuilder(builder: (context, Constraints) {
                  if (Constraints.maxWidth < 768) {
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
                            width: 15,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Partner Name',
                              style: TextStyle(
                                  color: Colors.green[900],
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
                              'Partner Mobile Number',
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          numeric: false,
                          tooltip: "This is Last Name",
                        ),
                        DataColumn(
                          // label: Text(
                          //   "Id",
                          //   style: TextStyle(
                          //     fontStyle: FontStyle.italic,
                          //     color: Colors.deepOrange,
                          //   ),
                          // ),
                          label: Container(
                            width: 15,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Partner City',
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          // label: Text(
                          //   "Email Id",
                          //   style: TextStyle(
                          //     fontStyle: FontStyle.italic,
                          //     color: Colors.deepOrange,
                          //   ),
                          // ),
                          label: Container(
                            width: 15,
                            child: Text(
                              'Add Delivery Partner',
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          numeric: false,
                        ),
                      ],
                      rows: emps
                          .map(
                            (emp) => DataRow(cells: [
                              DataCell(
                                Text(emp.partnerName ?? ''),
                              ),
                              DataCell(
                                Text(emp.mobileNumber ?? ''),
                              ),
                              DataCell(
                                // Text('${emp.city}'),
                                //Text(emp.city),
                                Container(
                                  width: 100,
                                  alignment: Alignment.centerLeft,
                                  child: Text(emp.city ?? ''),
                                ),
                              ),
                              DataCell(TextButton(
                                child: Text(
                                  "Delivery Partners",
                                  style: TextStyle(fontSize: 10),
                                ),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: Colors.green[900],
                                ),
                                onPressed: () {
                                  print("printing id>>>>>>>>>>>>>>>");
                                  print(emp.id);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DeliverypartnerList(
                                      // categoryId: 1,
                                      subjeepartnerId: emp.id ?? 0,
                                    ),
                                  ));
                                },
                              )
                                  // TextButton(

                                  //   onPressed: () {
                                  //     print("printing id>>>>>>>>>>>>>>>");
                                  //     print(emp.id);
                                  //     Navigator.of(context).push(MaterialPageRoute(
                                  //       builder: (context) => AddPincodePage(
                                  //         // categoryId: 1,
                                  //         patnerId: emp.id,
                                  //       ),
                                  //     ));
                                  //   },
                                  //   child: Text('Simple Button'),
                                  // ),
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
                            width: 210,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Partner Name',
                              style: TextStyle(
                                  color: Colors.green[900],
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
                              'Partner Mobile Number',
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          numeric: false,
                          tooltip: "This is Last Name",
                        ),
                        DataColumn(
                          // label: Text(
                          //   "Id",
                          //   style: TextStyle(
                          //     fontStyle: FontStyle.italic,
                          //     color: Colors.deepOrange,
                          //   ),
                          // ),
                          label: Container(
                            width: 100,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Partner City',
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          // label: Text(
                          //   "Email Id",
                          //   style: TextStyle(
                          //     fontStyle: FontStyle.italic,
                          //     color: Colors.deepOrange,
                          //   ),
                          // ),
                          label: Container(
                            width: 200,
                            child: Text(
                              'Add Delivery Partner',
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          numeric: false,
                        ),
                      ],
                      rows: emps
                          .map(
                            (emp) => DataRow(cells: [
                              DataCell(
                                Text(emp.partnerName ?? ''),
                              ),
                              DataCell(
                                Text(emp.mobileNumber ?? ''),
                              ),
                              DataCell(
                                // Text('${emp.city}'),
                                //Text(emp.city),
                                Container(
                                  width: 100,
                                  alignment: Alignment.centerLeft,
                                  child: Text(emp.city ?? ''),
                                ),
                              ),
                              DataCell(TextButton(
                                child: Text(
                                  "Delivery Partners",
                                  style: TextStyle(fontSize: 10),
                                ),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: Colors.green[900],
                                ),
                                onPressed: () {
                                  print("printing id>>>>>>>>>>>>>>>");
                                  print(emp.id);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DeliverypartnerList(
                                      // categoryId: 1,
                                      subjeepartnerId: emp.id ?? 0,
                                    ),
                                  ));
                                },
                              )
                                  // TextButton(

                                  //   onPressed: () {
                                  //     print("printing id>>>>>>>>>>>>>>>");
                                  //     print(emp.id);
                                  //     Navigator.of(context).push(MaterialPageRoute(
                                  //       builder: (context) => AddPincodePage(
                                  //         // categoryId: 1,
                                  //         patnerId: emp.id,
                                  //       ),
                                  //     ));
                                  //   },
                                  //   child: Text('Simple Button'),
                                  // ),
                                  ),
                            ]),
                          )
                          .toList(),
                    );
                  }
                }),
              ),
            ],
          )),
    );
  }
}

// class partnerList extends StatefulWidget {
//   @override
//   _partnerListState createState() => _partnerListState();
// }

// class _partnerListState extends State<partnerList> {
//   _JsonDataGridSource jsonDataGridSource;
//   List<PartnerModel> productlist = [];

//   Future generateProductList() async {
//     var response = await http.get(Uri.parse(
//         'http://44.192.46.200:8083/subjeeCentralService/product/v1/getPartnerList'));
//     var list = json.decode(response.body).cast<Map<String, dynamic>>();
//     productlist = await list
//         .map<PartnerModel>((json) => PartnerModel.fromJson(json))
//         .toList();
//     jsonDataGridSource = _JsonDataGridSource(productlist);
//     return productlist;
//   }

//   List<GridColumn> getColumns() {
//     List<GridColumn> columns;
//     columns = ([
//       GridColumn(
//         columnName: 'PartnerName',
//         width: 210,
//         label: Container(
//           padding: EdgeInsets.all(8),
//           alignment: Alignment.center,
//           child: Text(
//             'Partner Name',
//             overflow: TextOverflow.clip,
//             softWrap: true,
//           ),
//         ),
//       ),
//       GridColumn(
//         columnName: 'PartnerMobileNum',
//         width: 210,
//         label: Container(
//           padding: EdgeInsets.all(8),
//           alignment: Alignment.center,
//           child: Text(
//             'Partner Mobile Num',
//             overflow: TextOverflow.clip,
//             softWrap: true,
//           ),
//         ),
//       ),
//       GridColumn(
//         columnName: 'PartnerCity',
//         width: 210,
//         label: Container(
//           padding: EdgeInsets.all(8),
//           alignment: Alignment.center,
//           child: Text(
//             'Partner City',
//             overflow: TextOverflow.clip,
//             softWrap: true,
//           ),
//         ),
//       ),
//       GridColumn(
//         columnName: 'orderDate',
//         width: 210,
//         label: Container(
//           padding: EdgeInsets.all(8),
//           alignment: Alignment.center,
//           child: Text(
//             'Add',
//             overflow: TextOverflow.clip,
//             softWrap: true,
//           ),
//         ),
//       ),

//     ]);
//     return columns;
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Partners List'),
//       ),

//       body: new Center(
//         child: Column(children: <Widget>[
//           Container(
//             // padding: EdgeInsets.only(top: 65),
//             padding: EdgeInsets.only(top: 65, left: 160, right: 160),
//             width: 1200,
//             height: 460,
//             child: Card(
//                 color: Colors.green[900],
//                 child: FutureBuilder(
//                     future: generateProductList(),
//                     builder: (BuildContext context,
//                         AsyncSnapshot<dynamic> snapshot) {
//                       return snapshot.hasData
//                           ? SfDataGrid(
//                               source: jsonDataGridSource, columns: getColumns())
//                           : Center(
//                               child: CircularProgressIndicator(
//                                 strokeWidth: 3,
//                               ),
//                             );
//                     })),
//           )
//         ]),
//       ),
//     );
//   }
// }

// class _JsonDataGridSource extends DataGridSource {
//   _JsonDataGridSource(this.productlist) {
//     buildDataGridRow();
//   }

//   List<DataGridRow> dataGridRows = [];
//   List<PartnerModel> productlist = [];

//   void buildDataGridRow() {
//     dataGridRows = productlist.map<DataGridRow>((dataGridRow) {
//       return DataGridRow(cells: [
//         DataGridCell<String>(
//             columnName: 'PartnerName', value: dataGridRow.partnerName),
//         DataGridCell<String>(
//             columnName: 'PartnerMobileNum', value: dataGridRow.mobileNumber),
//         DataGridCell<String>(
//             columnName: 'PartnerCity', value: dataGridRow.city),
//         DataGridCell<int>(columnName: 'orderDate', value: dataGridRow.id),
//         // DataGridCell<String>(
//         //     columnName: 'freight', value: dataGridRow.partnerName),
//       ]);
//     }).toList(growable: false);
//   }

//   @override
//   List<DataGridRow> get rows => dataGridRows;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(cells: [
//       Container(
//         alignment: Alignment.centerLeft,
//         // padding: EdgeInsets.all(8.0),
//         padding: EdgeInsets.only(left: 17),
//         child: Text(
//           row.getCells()[0].value.toString(),
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(8.0),
//         child: Text(
//           row.getCells()[1].value,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       Container(
//         alignment: Alignment.centerLeft,
//         //padding: EdgeInsets.all(8.0),
//         padding: EdgeInsets.only(left: 40),
//         child: Text(
//           row.getCells()[2].value.toString(),
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.only(left: 10),
//         margin: EdgeInsets.all(5),
//         child: FlatButton(
//           color: Colors.green[900],
//           shape: StadiumBorder(),
//           child: Text(
//             'Add Delivery Partner',
//             style: TextStyle(fontSize: 8.0, color: Colors.white),
//           ),
//           onPressed: () {
//             // Navigator.of(context).push(MaterialPageRoute(
//             //   builder: (context) => AddPincodePage(
//             //     // categoryId: 1,
//             //     patnerId: pmodel[index].id,
//             //   ),
//             // ));
//             print(row.getCells()[3].value.toString());
//             globals.GlobalpartnerId = row.getCells()[3].value;
//           },
//         ),
//       ),
//     ]);
//   }
// }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:localstorage/localstorage.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:http/http.dart' as http;
// import 'package:subjeecentral/components/UserApiProvider.dart';
// import 'package:subjeecentral/models/PartnerModel.dart';
// import 'package:subjeecentral/pages/AddPartner.dart';
// import 'package:subjeecentral/pages/productpage.dart';

// import '../Config.dart';
// import 'HomePage.dart';
// import 'addPincode.dart';

// class partnerList extends StatefulWidget {
//   @override
//   partnerListState createState() => partnerListState();
// }

// class partnerListState extends State<partnerList> {
//   int mySelection;
//   UserApiProvider _apiProvider = UserApiProvider();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getUser();
//   }

//   void getUser() {
//     _apiProvider.getPartnersList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //  return Container(child: _offerProductList());
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Add Delivery Partner"),
//           centerTitle: true,
//           brightness: Brightness.dark,
//           elevation: 0,
//           backgroundColor: Colors.green[900],
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//             onPressed: () {
//               // Navigator.pop(context);
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => MyHomePage(),
//               ));
//             },
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         body: new Center(
//             child: Column(children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(top: 65),
//             width: 1200,
//             height: 460,
//             child: Card(
//               child: Column(
//                 children: [

//                   Container(
//                     padding: EdgeInsets.only(top: 10, bottom: 10),
//                     child: Icon(
//                       Icons.person,
//                       size: 46,
//                       color: Colors.green[900],
//                     ),
//                   ),
//                   Container(
//                       padding: EdgeInsets.only(left: 15, right: 15),
//                       child: Text(
//                         "please select your Managing PartnerName",
//                         style: TextStyle(
//                             color: Colors.green[900],
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600),
//                       )),
//                   Container(
//                       //  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
//                       //   child: _offerProductList()
//                       child: Flexible(
//                     fit: FlexFit.tight,
//                     child: _offerProductList(),
//                   )

//                       ),

//                   Row(
//                     children: [

//                       Container(
//                         margin: EdgeInsets.all(25),
//                         child: FlatButton(
//                           color: Colors.green[900],
//                           shape: StadiumBorder(),
//                           child: Text(
//                             'Add New Managing Partner',
//                             style:
//                                 TextStyle(fontSize: 18.0, color: Colors.white),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => AddPartnerPage(
//                                   // categoryId: 1,
//                                   //patnerId: mySelection,
//                                   ),
//                             ));
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ])));
//   }

//   Widget _offerProductList() {
//     return new FutureBuilder(
//         future: _apiProvider.getPartnersList(),
//         builder:
//             (BuildContext context, AsyncSnapshot<List<PartnerModel>> model) {
//           if (model.hasData) {
//             return _buildList(model.data);
//             //AppBar(title: Text("data there"));
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         });
//   }

//   Widget _buildList(List<PartnerModel> pmodel) {
//     return ListView(
//       children: [
//         ListView.builder(
//             itemCount: pmodel.length,
//             physics: ScrollPhysics(),
//             padding: EdgeInsets.all(8),
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return Container(
//                 color: Colors.greenAccent.withOpacity(0.3),
//                 padding: EdgeInsets.only(left: 80, right: 80),
//                 child: Card(
//                   color: Colors.white,
//                   // color: Colors.greenAccent.withOpacity(0.3),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: new BorderRadius.circular(15.0)),
//                   child: Column(
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           iconData(
//                               Icon(
//                                 Icons.person,
//                                 color: Colors.green[900],
//                                 size: 14,
//                               ),
//                               Text(
//                                 "Partner Name : ${pmodel[index].partnerName}",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.green[900],
//                                     fontWeight: FontWeight.bold),
//                               )),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           iconData(
//                               Icon(
//                                 Icons.phone,
//                                 color: Colors.green[900],
//                                 size: 14,
//                               ),
//                               Text(
//                                 "Partner Mobile Num : ${pmodel[index].mobileNumber}",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.green[900],
//                                     fontWeight: FontWeight.bold),
//                               )),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           iconData(
//                               Icon(
//                                 Icons.place,
//                                 color: Colors.green[900],
//                                 size: 14,
//                               ),
//                               Text(
//                                 "Partner City : ${pmodel[index].city}",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.green[900],
//                                     fontWeight: FontWeight.bold),
//                               )),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.only(left: 80),
//                             margin: EdgeInsets.all(25),
//                             child: FlatButton(
//                               color: Colors.green[900],
//                               shape: StadiumBorder(),
//                               child: Text(
//                                 'Add Delivery Partner',
//                                 style: TextStyle(
//                                     fontSize: 14.0, color: Colors.white),
//                               ),
//                               onPressed: () {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) => AddPincodePage(
//                                     // categoryId: 1,
//                                     patnerId: pmodel[index].id,
//                                   ),
//                                 ));
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }),
//       ],
//     );
//   }

//   Widget iconData(Icon iconData, Text textdata) {
//     return Row(
//       children: <Widget>[
//         iconData,
//         SizedBox(
//           width: 10,
//         ),
//         textdata,
//       ],
//     );
//   }
// }

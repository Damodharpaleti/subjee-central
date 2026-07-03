import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:subjeecentral/Config.dart';
import 'package:subjeecentral/models/Getpromolistmodel.dart';

import 'package:subjeecentral/pages/addpromocode.dart';
import 'package:subjeecentral/pages/getpincode.dart';

import 'getcity.dart';

class PromoCodeList extends StatefulWidget {
  @override
  PromoCodeListState createState() => PromoCodeListState();
}

class PromoCodeListState extends State<PromoCodeList> {
  String? mySelection;
  //List<PartnerModel> emps;
  List<Getpromolistmodel> data = [];
  // UserApiProvider _apiProvider = UserApiProvider();

  List<Getpromolistmodel> emps = [];

  Future generateProductList() async {
    // var response = await http.get(Uri.parse(
    //     'http://44.192.46.200:8083/subjeeCentralService/product/v1/getPartnerList'));
    var response = await http.get(Uri.parse(Config.url + Config.promolist));
    var list = json.decode(response.body).cast<Map<String, dynamic>>();
    print(response.body);
    emps = await list
        .map<Getpromolistmodel>((json) => Getpromolistmodel.fromJson(json))
        .toList();
    print(emps);
    //jsonDataGridSource = _JsonDataGridSource(productlist);
    return emps;
  }

  @override
  void initState() {
    dataFetch();
    //emps = generateProductList() as List<Getpromolistmodel>;
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
        title: Text('Promo code list'),
        actions: <Widget>[],
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
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 200),
                          backgroundColor: Colors.green[900] ?? Colors.green,
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddPromoCode(
                                // categoryId: 1,
                                //patnerId: mySelection,
                                ),
                          ));
                        },
                        child: Text(
                          "Add promo code",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 19, right: 19),
                  width: 1000,
                  height: 420,
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
                  padding: EdgeInsets.only(top: 65, left: 700, right: 150),
                  // child: Card(
                  //   child: Text("Add Delivery Partner"),
                  // ),
                ),
                // FlatButton(
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10.0),
                //         side: BorderSide(color: Colors.green)),
                //     color: Colors.green[900],
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //         Text(
                //           ' Add promo code',
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ],
                //     ),
                //     onPressed: () {
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => AddPartnerPage(
                //             // categoryId: 1,
                //             //patnerId: mySelection,
                //             ),
                //       ));
                //     }),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 0, right: 5),
                  width: 3000,
                  height: 400,
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
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green[900] ?? Colors.green,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Add promo code',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddPromoCode(
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
                            label: Container(
                              width: 40,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Promo name',
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
                              width: 40,
                              child: Text(
                                'Start date',
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
                              width: 40,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'End date',
                                style: TextStyle(
                                    color: Colors.green[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: true,
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
                              width: 40,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'min Amount',
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
                              width: 40,
                              child: Text(
                                'Per user limit',
                                style: TextStyle(
                                    color: Colors.green[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Container(
                              width: 40,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Max discount',
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
                              width: 40,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Percentage',
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
                              width: 40,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Add pincode',
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
                              width: 40,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Add city',
                                style: TextStyle(
                                    color: Colors.green[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: false,
                            tooltip: "This is First Name",
                          ),
                        ],
                        rows: emps
                            .map(
                              (emp) => DataRow(cells: [
                                DataCell(
                                  Text(emp.promocode),
                                ),
                                DataCell(
                                  Text(emp.startdate ?? ''),
                                ),
                                DataCell(
                                  Text(emp.enddate ?? ''),
                                ),
                                DataCell(
                                  // Text('${emp.city}'),
                                  //Text(emp.city),
                                  Container(
                                    width: 100,
                                    alignment: Alignment.centerLeft,
                                    child: Text(emp.percentage.toString()),
                                  ),
                                ),
                                DataCell(TextButton(
                                  child: Text(
                                    "get pincode",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white, backgroundColor: Colors.green[900],
                                  ),
                                  onPressed: () {
                                    print("printing id>>>>>>>>>>>>>>>");
                                    // print(emp.id);
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Getpincode(
                                          cityList: [],
                                          // categoryId: 1,
                                          //subjeepartnerId: emp.id,
                                          ),
                                    ));
                                  },
                                )),
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
                            label: Text(
                              'Promo name',
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
                                'Start date',
                                style: TextStyle(
                                    color: Colors.green[900],
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
                                'End date',
                                style: TextStyle(
                                    color: Colors.green[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Min amount',
                                style: TextStyle(
                                    color: Colors.green[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Max discount',
                                style: TextStyle(
                                    color: Colors.green[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Container(
                              width: 100,
                              child: Text(
                                'Per user limit',
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
                              child: Text(
                                'Percentage',
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
                              child: Text(
                                'Add pincode',
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
                              child: Text(
                                'Add city',
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
                                  Text(emp.promocode),
                                ),
                                DataCell(
                                  Text(emp.startdate ?? ''),
                                ),
                                DataCell(
                                  Text(emp.enddate ?? ''),
                                ),
                                DataCell(
                                  Text(emp.minAmount.toString()),
                                ),
                                DataCell(
                                  Text(emp.maxdiscount.toString()),
                                ),
                                DataCell(
                                  Text(emp.peruserLimit.toString()),
                                ),
                                DataCell(
                                  Text(emp.percentage.toString()),
                                ),
                                DataCell(TextButton(
                                  child: Text(
                                    "get pincode",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white, backgroundColor: Colors.green[900],
                                  ),
                                  onPressed: () {
                                    // print("printing id>>>>>>>>>" +
                                    //     emp.cityList[1].cityName);
                                    // print(emp.promocode);
                                    // Navigator.of(context)
                                    //     .push(MaterialPageRoute(
                                    //         builder: (context) => Getpincode(
                                    //               cityList: emp.cityList,
                                    //             )));
                                  },
                                )),
                                DataCell(
                                  TextButton(
                                    child: Text(
                                      "get city",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white, backgroundColor: Colors.green[900],
                                    ),
                                    onPressed: () {
                                      print("printing id>>>>>>>>>>>>>>>");
                                      print(emp.promocode);
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => Getcity(
                                            // categoryId: 1,
                                            //subjeepartnerId: emp.id,
                                            ),
                                      ));
                                    },
                                  ),

                                  // DataCell(
                                  //   // Text('${emp.city}'),
                                  //   //Text(emp.city),
                                  //   Container(
                                  //     width: 100,
                                  //     alignment: Alignment.centerLeft,
                                  //     child: Text(emp.cityList[0].cityName),
                                  //   ),
                                  // ),
                                  // DataCell(TextButton(
                                  //   child: Text(
                                  //     "Delivery Partners",
                                  //     style: TextStyle(fontSize: 10),
                                  //   ),
                                  //   style: TextButton.styleFrom(
                                  //     primary: Colors.white,
                                  //     backgroundColor: Colors.green[900],
                                  //   ),
                                  //   onPressed: () {
                                  //     print("printing id>>>>>>>>>>>>>>>");
                                  //     // print(emp.id);
                                  //     Navigator.of(context)
                                  //         .push(MaterialPageRoute(
                                  //       builder: (context) => DeliverypartnerList(
                                  //           // categoryId: 1,
                                  //           // subjeepartnerId: emp.id,
                                  //           ),
                                  //     ));
                                  //   },
                                  // )),
                                  // DataCell(
                                  //   // Text('${emp.city}'),
                                  //   //Text(emp.city),
                                  //   Container(
                                  //     width: 100,
                                  //     alignment: Alignment.centerLeft,
                                  //     child: Text(emp.promocode),
                                  //   ),
                                  // ),
                                  // DataCell(
                                  //   // Text('${emp.city}'),
                                  //   //Text(emp.city),
                                  //   Container(
                                  //     width: 100,
                                  //     alignment: Alignment.centerLeft,
                                  //     child: Text(emp.promocode),
                                  //   ),
                                  // ),
                                  // DataCell(
                                  //   // Text('${emp.city}'),
                                  //   //Text(emp.city),
                                  //   Container(
                                  //     width: 100,
                                  //     alignment: Alignment.centerLeft,
                                  //     child: Text(emp.promocode),
                                  //   ),
                                  // ),
                                  // DataCell(
                                  //   // Text('${emp.city}'),
                                  //   //Text(emp.city),
                                  //   Container(
                                  //     width: 100,
                                  //     alignment: Alignment.centerLeft,
                                  //     child: Text(emp.promocode),
                                  //   ),
                                  // ),
                                  // DataCell(
                                  //   // Text('${emp.city}'),
                                  //   //Text(emp.city),
                                  //   Container(
                                  //     width: 100,
                                  //     alignment: Alignment.centerLeft,
                                  //     child: Text(emp.promocode),
                                  //   ),
                                  // ),
                                )
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
}

import 'package:flutter/material.dart';
import 'package:subjeecentral/components/globals.dart' as globals;

import 'dart:convert';


import 'package:subjeecentral/Config.dart';
import 'package:subjeecentral/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:subjeecentral/pages/updateSamarapanaproduct.dart';

class samarpanapriceupdateSearch extends StatefulWidget {
  samarpanapriceupdateSearch({
    Key? key,
    this.pname,
    this.place,
  }) : super(key: key);

  late final String? pname;
  late final String? place;
  @override
  _samarpanapriceupdateSearchState createState() =>
      _samarpanapriceupdateSearchState();
}

class _samarpanapriceupdateSearchState
    extends State<samarpanapriceupdateSearch> {
  late String mySelection;
  late String searchProduct;
  // String newLocation;
  //List<PartnerModel> emps);
  List<Product> data = [];
  //UserApiProvider _apiProvider = UserApiProvider();

  List<Product> emps = [];

  Future getProdBySearch(String? pname) async {
    print("printing place>>>>>>>>>>>>>>>>>>>>");
    print(this.widget.place);
    if (this.widget.place == null) {
      // SharedPreferences instance retrieved but not used in this flow
      print(">>>>>>>>>>>>>>");
      //newLocation = "Bengaluru";
      String? newLocation = globals.globalCity;
      print(newLocation);
      //  print("@@@@@@@@@@@@@@@@@@@@@@ " + Location);
      if (newLocation.contains('Mountain View') ||
          newLocation.contains('Bangalore')) {
        newLocation = 'Bengaluru';
      }
      var response = await http.get(Uri.parse(Config.url +
          Config.searchsamProductName +
          "?productName=$pname&cityName=$newLocation"));
      var list = json.decode(response.body).cast<Map<String, dynamic>>();
      emps = await list.map<Product>((json) => Product.fromJson(json)).toList();
      //jsonDataGridSource = _JsonDataGridSource(productlist);
      return emps;
    } else {
      print("comming in else>>>>>>>>>>>>>>>");
      String? pcity;
      pcity = this.widget.place;
      var response = await http.get(Uri.parse(Config.url +
          Config.searchBySamarpanaProductName +
          "?cityName=$pcity&productName=$pname"));
      var list = json.decode(response.body).cast<Map<String, dynamic>>();
      emps = await list.map<Product>((json) => Product.fromJson(json)).toList();
      //jsonDataGridSource = _JsonDataGridSource(productlist);
      return emps;
    }
  }

  // String url = Config.url + Config.cityList;
  // List cdata = List(); //edited line
  // Future<String> getSWData() async {
  //   var res = await http
  //       .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
  //   var resBody = json.decode(res.body);
  //   setState(() {
  //     cdata = resBody;
  //   });
  //   print(resBody);
  //   return "Sucess";
  // }

  @override
  void initState() {
    mySelection = this.widget.place ?? globals.globalCity;
    searchProduct = '';
    //  this.getSWData();
    dataFetch();
    //emps = generateProductList() as List<PartnerModel>;
    super.initState();
  }

  void dataFetch() {
    getProdBySearch(this.widget.pname ?? '').then((result) {
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
        title: Text('Update Price List'),
        // actions: <Widget>[
        //   Padding(
        //       padding: EdgeInsets.only(right: 20.0, top: 15),
        //       child: GestureDetector(
        //         onTap: () {
        //           Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) => AddPartnerPage(
        //                 // categoryId: 1,
        //                 //patnerId: mySelection,
        //                 ),
        //           ));
        //         },
        //         //child: Icon(Icons.add),
        //         child: Text(
        //           'Add Managing Partner',
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       )),
        // ],
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, Constraints) {
          if (Constraints.maxWidth < 768) {
            return new Center(
              child: Column(children: <Widget>[
                Padding(
                  // padding: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.only(left: 19, right: 19, top: 10),
                  child: Card(
                    color: Colors.green[900],
                    child: Container(
                      height: 50.0,
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 6, bottom: 6),
                      // color: Colors.green,
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) {
                          String searchInput = value.toString().toLowerCase();
                          searchProduct = searchInput;

                          print("search>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                          print(value);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      samarpanapriceupdateSearch(
                                        pname: searchProduct,
                                        place: mySelection,
                                      )));
                          print("search>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                                left: 3.0, bottom: 8.0, top: 8.0),
                            hintText: 'Search Products',
                            focusColor: Colors.black,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                ),
                Container(
                  // color: Colors.white,
                  // padding: EdgeInsets.only(top: 65),
                  padding: EdgeInsets.only(left: 19, right: 19, top: 10),
                  width: 600,
                  height: 460,
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
                  padding: EdgeInsets.only(top: 65, left: 190, right: 190),
                  child: Card(
                    color: Colors.greenAccent.withOpacity(0.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 30, right: 30, bottom: 10),
                          // width: 172,
                          width: 530,
                          height: 65,
                          child: TextField(
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) {
                              String searchInput =
                                  value.toString().toLowerCase();
                              searchProduct = searchInput;

                              print("search>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                              print(value);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          samarpanapriceupdateSearch(
                                            pname: searchProduct,
                                          )));
                              print("search>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(
                                    left: 4.0, bottom: 8.0, top: 8.0),
                                hintText: 'Search',
                                focusColor: Colors.black,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // color: Colors.white,
                  // padding: EdgeInsets.only(top: 65),
                  padding: EdgeInsets.only(top: 20, left: 190, right: 190),
                  width: 1600,
                  height: 460,
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
        child: SafeArea(
          child: LayoutBuilder(builder: (context, Constraints) {
            if (Constraints.maxWidth < 768) {
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
                        'Product Name',
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
                      alignment: Alignment.centerLeft,
                      width: 15,
                      child: Text(
                        'Market Price',
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
                        'Price',
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
                      width: 15,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Min Quantity',
                        style: TextStyle(
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    numeric: true,
                  ),
                  // DataColumn(
                  //   label: Container(
                  //     width: 60,
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       'Current Price',
                  //       style: TextStyle(
                  //           color: Colors.green[900], fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  //   numeric: true,
                  // ),
                  DataColumn(
                    label: Container(
                      width: 15,
                      child: Text(
                        'update',
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
                          Text(emp.productName ?? ''),
                        ),
                        DataCell(
                          Text(emp.marketPrice ?? ''),
                        ),
                        DataCell(
                          // Text('${emp.city}'),
                          //Text(emp.city),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(emp.price ?? ''),
                          ),
                        ),
                        DataCell(
                          // Text('${emp.city}'),
                          //Text(emp.city),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(emp.priceMinQuantity.toString()),
                          ),
                        ),
                        // DataCell(
                        //   // Text('${emp.city}'),
                        //   //Text(emp.city),
                        //   Container(
                        //     width: 30,
                        //     alignment: Alignment.centerLeft,
                        //     child: Text(emp.price),
                        //   ),
                        // ),
                        // DataCell(
                        //   // Text('${emp.city}'),
                        //   //Text(emp.city),
                        //   Container(
                        //     width: 100,
                        //     alignment: Alignment.centerLeft,
                        //     child: Text(emp.price),
                        //   ),
                        // ),

                        DataCell(TextButton(
                          child: Text(
                            "Edit",
                            style: TextStyle(fontSize: 10),
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green[900],
                          ),
                          onPressed: () {
                            print("printing id>>>>>>>>>>>>>>>");
                            //print(emp.id);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => updatesamarpanaproduct(
                                // categoryId: 1,
                                pdata: emp,
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
                    // label: Text(
                    //   "First Name",
                    //   style: TextStyle(
                    //     fontStyle: FontStyle.italic,
                    //     color: Colors.deepOrange,
                    //   ),
                    // ),
                    label: Container(
                      width: 120,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Product Name',
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
                      alignment: Alignment.centerLeft,
                      width: 120,
                      child: Text(
                        'Market Price',
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
                        'Price',
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
                      width: 100,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Min Quantity',
                        style: TextStyle(
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    numeric: true,
                  ),
                  // DataColumn(
                  //   label: Container(
                  //     width: 60,
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       'Current Price',
                  //       style: TextStyle(
                  //           color: Colors.green[900], fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  //   numeric: true,
                  // ),
                  DataColumn(
                    label: Container(
                      width: 100,
                      child: Text(
                        'update',
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
                          Text(emp.productName ?? ''),
                        ),
                        DataCell(
                          Text(emp.marketPrice ?? ''),
                        ),
                        DataCell(
                          // Text('${emp.city}'),
                          //Text(emp.city),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(emp.price ?? ''),
                          ),
                        ),
                        DataCell(
                          // Text('${emp.city}'),
                          //Text(emp.city),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(emp.priceMinQuantity.toString()),
                          ),
                        ),
                        // DataCell(
                        //   // Text('${emp.city}'),
                        //   //Text(emp.city),
                        //   Container(
                        //     width: 30,
                        //     alignment: Alignment.centerLeft,
                        //     child: Text(emp.price),
                        //   ),
                        // ),
                        // DataCell(
                        //   // Text('${emp.city}'),
                        //   //Text(emp.city),
                        //   Container(
                        //     width: 100,
                        //     alignment: Alignment.centerLeft,
                        //     child: Text(emp.price),
                        //   ),
                        // ),

                        DataCell(TextButton(
                          child: Text(
                            "Edit",
                            style: TextStyle(fontSize: 10),
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green[900],
                          ),
                          onPressed: () {
                            print("printing id>>>>>>>>>>>>>>>");
                            //print(emp.id);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => updatesamarpanaproduct(
                                // categoryId: 1,
                                pdata: emp,
                              ),
                            ));
                          },
                        )),
                      ]),
                    )
                    .toList(),
              );
            }
          }),
        ),
      ),
    );
  }
}

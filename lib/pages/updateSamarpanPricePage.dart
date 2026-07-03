import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subjeecentral/Config.dart';
import 'package:subjeecentral/Drawer.dart';
import 'package:subjeecentral/models/product.dart';
import 'package:subjeecentral/pages/AddSamarpanaProductPage.dart';
import 'package:http/http.dart' as http;
import 'package:subjeecentral/pages/updateSamarapanaproduct.dart';
import 'package:subjeecentral/components/globals.dart' as globals;
import 'package:subjeecentral/widget/widget_samarpanapriceupdate_search.dart';
// class updatePricePage extends StatefulWidget {
//   // const updatePricePage({ Key? key }) : super(key: key);

//   @override
//   _updatePricePageState createState() => _updatePricePageState();
// }

// class _updatePricePageState extends State<updatePricePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class updateSamarpanaPricePage extends StatefulWidget {
  updateSamarpanaPricePage({Key? key, required this.cid}) : super(key: key);
  final int cid;
  @override
  _updateSamarpanaPricePageState createState() =>
      _updateSamarpanaPricePageState();
}

class _updateSamarpanaPricePageState extends State<updateSamarpanaPricePage> {
  late String mySelection;
  late String searchProduct;

  late int catId;
  String cityName = "Bengaluru";
  // String cityName = globals.globalCity;
  //List<PartnerModel> emps;
  List<Product> data = [];
  //UserApiProvider _apiProvider = UserApiProvider();

  List<Product> emps = [];

  Future generateProductList() async {
    // var response = await http.get(Uri.parse(
    //     'http://44.192.46.200:8083/subjeeCentralService/product/v1/getProductByDetails?cId=$cityId&search=&cityName=$cityName'));
    var response = await http.get(Uri.parse(Config.url +
        Config.samarpanaproduct +
        '?cId=$catId&search=&cityName=$cityName'));
    var list = json.decode(response.body).cast<Map<String, dynamic>>();
    emps = await list.map<Product>((json) => Product.fromJson(json)).toList();
    //jsonDataGridSource = _JsonDataGridSource(productlist);
    return emps;
  }

  String url = Config.url + Config.cityList;
  List cdata = []; //edited line
  Future<String> getSWData() async {
    var res = await http
        .get(Uri.parse(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    setState(() {
      cdata = resBody;
    });
    print(resBody);
    return "Sucess";
  }

  @override
  void initState() {
    catId = this.widget.cid;
    mySelection = globals.globalCity;
    searchProduct = '';
    this.getSWData();
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
      drawer: SideMenuDrawer(),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, Constraints) {
          if (Constraints.maxWidth < 768) {
            return new Center(
                child: Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 5, left: 19, right: 19),
                  child: Card(
                    color: Colors.greenAccent,
                    child: Row(
                      children: [
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                                globals.userRole != "ROLE_MANAGING_PARTNER"
                            ? Container(
                                padding: EdgeInsets.only(
                                    top: 5, left: 19, right: 19),
                                child: new DropdownButton(
                                  dropdownColor: Colors.green[900],
                                  items: cdata.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(
                                        item['cityName'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      value: item['cityName'].toString(),
                                    );
                                  }).toList(),
                                  hint: Text(
                                    "Select City",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.pink[300],
                                  ),

                                  onChanged: (newVal) {
                                    setState(() {
                                      mySelection = newVal ?? '';
                                      globals.globalCity = newVal ?? '';
                                      print(">>>>>>>>>>>>this>>>>>>");
                                      print(globals.globalCity);
                                      print(">>>>>>>>>>>>this>>>>>>");
                                      print(mySelection);
                                      print(">>>>>>>>>>>>>>>>>>");
                                    });
                                  },

                                  // hint: Text('Select City'),
                                  value: mySelection,
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.only(
                                    top: 20, right: 40, left: 40, bottom: 10)),
                      ],
                    ),
                  )),
              Padding(
                // padding: const EdgeInsets.all(8.0),
                padding: EdgeInsets.only(left: 19, right: 19, top: 10),
                child: Card(
                  color: Colors.greenAccent.withOpacity(0.3),
                  child: Container(
                    height: 50.0,
                    padding:
                        EdgeInsets.only(left: 25, right: 25, top: 6, bottom: 6),
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
                padding:
                    EdgeInsets.only(top: 5, left: 19, right: 19, bottom: 3),
                child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.white)),
                        backgroundColor: Colors.green[900]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Add Samarpana Product',
                            style: TextStyle(color: Colors.pink[300]),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      print(">>>>>update button clicked");
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddSamarpanaProductPage()));
                    }),
              ),
              Container(
                // color: Colors.white,
                // padding: EdgeInsets.only(top: 65),
                padding: EdgeInsets.only(top: 10, left: 19, right: 19),
                width: 600,
                height: 380,
                child: Card(
                  color: Colors.white,
                  child: tableBody(
                    context,
                  ),
                ),
              )
            ]));
          } else {
            return new Center(
              child: Column(children: <Widget>[
                Card(
                    color: Colors.greenAccent.withOpacity(0.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        globals.userRole != "ROLE_SUYOGA_CITY_ADMIN" &&
                                globals.userRole != "ROLE_MANAGING_PARTNER"
                            ? Container(
                                padding: EdgeInsets.only(
                                    top: 20, right: 40, left: 40, bottom: 10),
                                child: new DropdownButton(
                                  dropdownColor: Colors.white,
                                  items: cdata.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(
                                        item['cityName'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      value: item['cityName'].toString(),
                                    );
                                  }).toList(),

                                  underline: Container(
                                    height: 2,
                                    color: Colors.pink[300],
                                  ),

                                  onChanged: (newVal) {
                                    setState(() {
                                      mySelection = newVal ?? '';
                                      globals.globalCity = newVal ?? '';
                                      print(">>>>>>>>>>>>this>>>>>>");
                                      print(globals.globalCity);
                                      print(">>>>>>>>>>>>this>>>>>>");
                                      print(mySelection);
                                      print(">>>>>>>>>>>>>>>>>>");
                                    });
                                  },

                                  // hint: Text('Select City'),
                                  value: mySelection,
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.only(
                                    top: 20, right: 40, left: 40, bottom: 10)),
                        Container(
                          padding: EdgeInsets.only(top: 17, bottom: 10),
                          width: 400,
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
                        Container(
                          padding: EdgeInsets.only(
                              top: 20, right: 20, left: 70, bottom: 10),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                      side: BorderSide(color: Colors.white)),
                                  backgroundColor: Colors.pink[300]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Add Samarpana Product',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                print(">>>>>update button clicked");
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        AddSamarpanaProductPage()));
                              }),
                        ),
                      ],
                    ),
                  ),
                
                Container(
                  // color: Colors.white,
                  // padding: EdgeInsets.only(top: 65),
                  padding: EdgeInsets.only(top: 20, left: 190, right: 190),
                  width: 1600,
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
                            foregroundColor: Colors.white, backgroundColor: Colors.green[900],
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
                      width: 60,
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
                      width: 60,
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
                            foregroundColor: Colors.white, backgroundColor: Colors.green[900],
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

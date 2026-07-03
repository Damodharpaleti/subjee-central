import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subjeecentral/Config.dart';
import 'package:subjeecentral/Drawer.dart';
import 'package:subjeecentral/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:subjeecentral/pages/addproduct.dart';
import 'package:subjeecentral/pages/updateProduct.dart';
import 'package:subjeecentral/widget/widget_priceupdate_search.dart';
import 'package:subjeecentral/components/globals.dart' as globals;

class updatePricePage extends StatefulWidget {
  @override
  _updatePricePageState createState() => _updatePricePageState();
}

class _updatePricePageState extends State<updatePricePage> {
  String mySelection = globals.globalCity;
  late String searchProduct;
  int cityId = 1;
  // String cityName = "Bengaluru";
  String cityName = globals.globalCity;

  //List<PartnerModel> emps;
  List<Product> data = [];
  //late APIService _apiService;
  //UserApiProvider _apiProvider = UserApiProvider();

  List<Product> emps = [];

  Future generateProductList() async {
    print("updatePricePage>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(Config.url + Config.product + '?cityName=$mySelection');
    print("updatePricePage>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    // var response = await http.get(Uri.parse(
    //     'http://44.192.46.200:8083/subjeeCentralService/product/v1/getProductByDetails?cId=$cityId&search=&cityName=$cityName'));
    var response = await http
        .get(Uri.parse(Config.url + Config.product + '?cityName=$mySelection'));
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
    this.getSWData();
    dataFetch(); //emps = generateProductList() as List<PartnerModel>;

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
      // backgroundColor: Colors.greenAccent.withOpacity(0.3),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[900],
        title: Text('update price list'),
      ),
      drawer: SideMenuDrawer(),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, Constraints) {
          if (Constraints.maxWidth < 768) {
            return new Center();
          } else {
            return new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                                      print(">>>>>>>>>>>>>>>>>>>");
                                      print(mySelection);
                                      print(">>>>>>>>>>>>>>>>>>>");
                                    });
                                    dataFetch();
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
                                      builder: (context) => priceupdateSearch(
                                            pname: searchProduct,
                                            place: mySelection,
                                          )));
                              print("search>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(
                                    left: 1.0, bottom: 8.0, top: 8.0),
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
                              top: 20, right: 20, left: 80, bottom: 10),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color: Colors.white)),
                                backgroundColor: Colors.pink[300],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Add Product',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                print(">>>>>update button clicked");
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AddProductPage()));
                              }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 180),
                    child: Container(
                      // color: Colors.white,
                      // padding: EdgeInsets.only(top: 65),
                      // padding: EdgeInsets.only(top: 20, left: 190, right: 190),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: Card(
                        color: Colors.white,
                        child: tableBody(
                          context,
                        ),
                      ),
                    ),
                  ),
                ]);
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
                    label: Container(
                      width: 15,
                      alignment: Alignment.center,
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
                    numeric: false,
                  ),
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
                            child: Text(emp.quantity.toString()),
                          ),
                        ),
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
                              builder: (context) => updateproduct(
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
                    numeric: false,
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
                            child: Text(emp.quantity.toString()),
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
                              builder: (context) => updateproduct(
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

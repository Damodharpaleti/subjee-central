// class testDatatable extends StatefulWidget {

// import 'dart:convert';
// import 'dart:js';

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:subjeecentral/models/PartnerModel.dart';
import 'package:subjeecentral/pages/AddPartner.dart';
import 'package:subjeecentral/pages/addPincode.dart';

// class testDatatable extends StatefulWidget {
//   @override
//   // State<testDatatable> createState() => _testDatatableListState();
//   _testDatatableListState createState() => _testDatatableListState();
// }

// class _testDatatableListState extends State<testDatatable> {

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  //List<PartnerModel> emps;
  List<PartnerModel> data = [];

  List<PartnerModel> emps = [];

  Future generateProductList() async {
    var response = await http.get(Uri.parse(
        'http://44.192.46.200:8083/subjeeCentralService/product/v1/getPartnerList'));
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
          Padding(
              padding: EdgeInsets.only(right: 20.0, top: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddPartnerPage(
                        // categoryId: 1,
                        //patnerId: mySelection,
                        ),
                  ));
                },
                //child: Icon(Icons.add),
                child: Text(
                  'Add Managing Partner',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
      // body: Column(
      //   children: <Widget>[
      //     Expanded(
      //       child: tableBody(
      //         context,
      //       ),
      //     ),
      //   ],
      // ),

      body: new Center(
        child: Column(children: <Widget>[
          Container(
            // color: Colors.white,
            // padding: EdgeInsets.only(top: 65),
            padding: EdgeInsets.only(top: 65, left: 160, right: 160),
            width: 1200,
            height: 460,
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
      ),
    );
  }

  SingleChildScrollView tableBody(BuildContext ctx) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
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
                      color: Colors.green[900], fontWeight: FontWeight.bold),
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
                      color: Colors.green[900], fontWeight: FontWeight.bold),
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
                      color: Colors.green[900], fontWeight: FontWeight.bold),
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
                      color: Colors.green[900], fontWeight: FontWeight.bold),
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
                      "Add Delivery Partner",
                      style: TextStyle(fontSize: 10),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.green[900],
                    ),
                    onPressed: () {
                      print("printing id>>>>>>>>>>>>>>>");
                      print(emp.id);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddPincodePage(
                          // categoryId: 1,
                          patnerId: emp.id,
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
        ),
      ),
    );
  }
}

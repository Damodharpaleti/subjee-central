import 'package:flutter/material.dart';
import 'package:subjeecentral/models/Getpromolistmodel.dart';
// import 'package:subjeecentral/pages/CityListPage.dart';

// ignore: must_be_immutable
class Getpincode extends StatefulWidget {
  Getpincode({Key? key, required this.cityList}) : super(key: key);
  final List<CityList>? cityList;
  @override
  State<Getpincode> createState() => _GetpincodeState();
}

class _GetpincodeState extends State<Getpincode> {
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green[900],
          title: Text('Get pincode List'),
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 100),
                            backgroundColor: Colors.green[900],
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => AddPincodelist(
                            //     categoryId: 1,
                            //     patnerId: mySelection,
                            //   ),
                            // ));
                          },
                          child: Text(
                            "Add pincode list",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          // padding: EdgeInsets.only(top: 20, left: 160, right: 160),
                          // width: 1400,
                          // height: 460,
                          padding:
                              EdgeInsets.only(top: 10, left: 16, right: 100),
                          width: 1000,
                          height: 520,
                          child: Card(
                            color: Colors.white,
                            child: tableBody(context, this.widget.cityList),
                          ),
                        ),
                      ]),
                )
              ]));
            } else {
              // return ListView(children: [
              //   ListView.builder(
              //       itemCount: this.widget.cityList.length,
              //       physics: ScrollPhysics(),
              //       padding: EdgeInsets.all(8),
              //       shrinkWrap: true,
              //       itemBuilder: (context, index) {
              //         // return SingleChildScrollView(
              //         //     padding: EdgeInsets.all(8.0),
              //         //     child: new Center(
              //         //       child: Column(children: <Widget>[
              //         //         Container(
              //         //           padding: EdgeInsets.only(
              //         //               top: 65, left: 900, right: 160),
              //         //           // child: Card(
              //         //           //   child: Text("Add Delivery Partner"),
              //         //           // ),
              //         //         ),
              return Container(
                padding: EdgeInsets.only(top: 05, left: 0.5, right: 0.5),
                width: 300,
                height: 400,
                child: Card(
                  color: Colors.white,
                  child: tableBody(context, this.widget.cityList),
                ),
              );
              //]),
              //  ));
              //  })
              //  ]);
            }
          }),
        ));
  }
}

SingleChildScrollView tableBody(BuildContext ctx, List<CityList>? clist) {
  print(clist);
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView(children: [
        ListView.builder(
            itemCount: clist?.length ?? 0,
            physics: ScrollPhysics(),
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 400,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.green)),
                                backgroundColor: Colors.green[900],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'AddPincodelist',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                _displayDialog(ctx);
                              }),
                          SafeArea(
                            child:
                                LayoutBuilder(builder: (context, Constraints) {
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
                                            'pincode',
                                            style: TextStyle(
                                                color: Colors.green[900],
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        numeric: false,
                                        tooltip: "This is Last Name",
                                      )
                                    ],
                                    rows: (clist?.map((emp) => DataRow(cells: [
                                          DataCell(
                                            Text(emp.cityName ?? ''),
                                          ),
                                          DataCell(TextButton(
                                            child: Text(
                                              "pincode list",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            style: TextButton.styleFrom(
                                              foregroundColor: Colors.white, backgroundColor:
                                                  Colors.green[900],
                                            ),
                                            onPressed: () {},
                                          )),
                                        ])).toList()) ?? [],
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
                                          'pincode',
                                          style: TextStyle(
                                              color: Colors.green[900],
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      numeric: false,
                                      tooltip: "This is Last Name",
                                    ),
                                  ],
                                  rows: (clist
                                      ?.map(
                                        (emp) => DataRow(cells: [
                                          DataCell(
                                            Text(emp.cityName ?? ''),
                                          ),
                                          DataCell(
                                            Text("566982"),
                                          ),
                                        ]),
                                      )
                                      .toList()) ?? [],
                                );
                              }
                            }),
                          ),
                        ])),
              );
            })
      ]));
}

_displayDialog(BuildContext context) async {
  TextEditingController _textFieldController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: 300,
            child: AlertDialog(
              title: Text('What is your Lucky Number'),
              content: Column(
                children: [
                  TextField(
                    controller: _textFieldController,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(hintText: "Enter your number"),
                  ),
                  TextField(
                    controller: _textFieldController,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(hintText: "Enter your number"),
                  ),
                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Submit'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        );
      });
}

import 'package:flutter/material.dart';

class Getcity extends StatefulWidget {
  const Getcity({Key? key}) : super(key: key);

  @override
  State<Getcity> createState() => _GetcityState();
}

class _GetcityState extends State<Getcity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Get city List'),
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
                                vertical: 18, horizontal: 10),
                          ),
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => Addcity(
                            //       // categoryId: 1,
                            //       //patnerId: mySelection,
                            //       ),
                            // ));
                          },
                          child: Text(
                            "Add city",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )),
                        Container(
                          // padding: EdgeInsets.only(top: 20, left: 160, right: 160),
                          // width: 1400,
                          // height: 460,
                          padding:
                              EdgeInsets.only(top: 10, left: 16, right: 100),
                          width: 700,
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
                    padding: EdgeInsets.only(top: 65, left: 400, right: 160),
                    // child: Card(
                    //   child: Text("Add Delivery Partner"),
                    // ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 05, left: 0.5, right: 0.5),
                    width: 300,
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
        ));
  }
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
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.green)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Add city',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      _displayDialog(ctx);
                      // BuildContext context;
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => Addcity(
                      //       // categoryId: 1,
                      //       //patnerId: mySelection,
                      //       ),
                      // ));
                    }),
                SafeArea(
                  child: LayoutBuilder(builder: (context, Constraints) {
                    if (Constraints.maxWidth < 768) {
                      var emps = [];
                      return DataTable(
                          dataRowHeight: 50,
                          dividerThickness: 5,
                          columns: [
                            DataColumn(
                              label: Container(
                                width: 40,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'city name',
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
                                width: 40,
                                child: Text(
                                  'city pincode',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              numeric: false,
                              tooltip: "This is Last Name",
                            )
                          ],
                          rows: emps.map((emp) => DataRow(cells: [
                                DataCell(
                                  Text(emp.toString()),
                                ),
                                DataCell(
                                  Text(emp.toString()),
                                ),
                              ])).toList());
                    } else {
                      var emps = ["hfhgfh", "jjhgh"];
                      return DataTable(
                        dataRowHeight: 50,
                        dividerThickness: 5,
                        columns: [
                          DataColumn(
                            label: Text(
                              'promo name',
                              style: TextStyle(
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
                                'city name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            numeric: false,
                            tooltip: "This is Last Name",
                          ),
                        ],
                        rows: emps
                            .map(
                              (emp) => DataRow(cells: [
                                DataCell(
                                  Text("ganesh"),
                                ),
                                DataCell(
                                  Text("bgl"),
                                ),
                              ]),
                            )
                            .toList(),
                      );
                    }
                  }),
                ),
              ])));
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
              title: Text('Add City'),
              content: Column(
                children: [
                  TextField(
                    controller: _textFieldController,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: "Enter city name"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _textFieldController,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(hintText: "Enter pincode"),
                  ),
                ],
              ),
              actions: <Widget>[
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: new Text('Submit'),
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





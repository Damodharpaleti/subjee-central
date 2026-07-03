import 'package:flutter/material.dart';

class Addcity extends StatefulWidget {
  const Addcity({Key? key}) : super(key: key);

  @override
  State<Addcity> createState() => _AddcityState();
}

class _AddcityState extends State<Addcity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.green[900],
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
    ));
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subjeecentral/Config.dart';
import 'package:subjeecentral/components/UserApiProvider.dart';
import 'package:subjeecentral/models/OrderListModel.dart';
import 'package:subjeecentral/pages/HomePage.dart';
import 'package:subjeecentral/pages/orderDetails.dart';
import 'package:subjeecentral/utils/VerifyPage_FormHelper.dart';
import 'package:subjeecentral/components/globals.dart' as globals;

class orders extends StatefulWidget {
  @override
  _ordersState createState() => _ordersState();
}

class _ordersState extends State<orders> {
  Choice _selectedChoice = choices[0];
  UserApiProvider _apiProvider = UserApiProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUser();
  }

  void getUser() {
    _apiProvider.getOrder("P");
  }

  @override
  Widget build(BuildContext context) {
    //  return Container(child: _offerProductList());
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green[900],
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              // return choices.skip(1).map((Choice choice) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(
                      choice.title,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.green[900]),
                    ));
              }).toList();
            },
          ),
        ], systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(child: _offerProductList()),
    );
  }

  Widget _offerProductList() {
    return new FutureBuilder(
        future: _apiProvider.getOrder(globals.status),
        builder:
            (BuildContext context, AsyncSnapshot<List<OrderListModel>> model) {
          if (model.hasData) {
            return _buildList(model.data ?? []);
            //AppBar(title: Text("data there"));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _buildList(List<OrderListModel> orders) {
    return ListView(
      children: [
        ListView.builder(
            itemCount: orders.length,
            physics: ScrollPhysics(),
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SafeArea(
                child: LayoutBuilder(builder: (context, Constraints) {
                  if (Constraints.maxWidth < 768) {
                    return Container(
                      color: Colors.greenAccent.withOpacity(0.3),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Card(
                        color: Colors.white,
                        // color: Colors.greenAccent.withOpacity(0.3),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0)),
                        child: Column(
                          children: <Widget>[
                            orderStatus("${orders[index].orderStatus}"),
                            // Divider(color: Colors.green[900]),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.point_of_sale,
                                      color: Colors.green[900],
                                      size: 14,
                                    ),
                                    Text(
                                      "Order Number : ${orders[index].orderNumber}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     iconData(
                            //         Icon(
                            //           Icons.edit,
                            //           color: Colors.green[900],
                            //           size: 12,
                            //         ),
                            //         Text(
                            //           "Order id : ${orders[index].orderId}",
                            //           style: TextStyle(
                            //               fontSize: 14,
                            //               color: Colors.green[900],
                            //               fontWeight: FontWeight.bold),
                            //         )),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.arrow_right,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Customer Phone number : ${orders[index].orderUserId}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     iconData(
                            //         Icon(
                            //           Icons.arrow_right,
                            //           color: Colors.green[900],
                            //           size: 12,
                            //         ),
                            //         Text(
                            //           "InvoiceNumber : ${orders[index].orderInvoiceNumber}",
                            //           style: TextStyle(
                            //               fontSize: 14,
                            //               color: Colors.green[900],
                            //               fontWeight: FontWeight.bold),
                            //         )),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.date_range,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Order Date : ${orders[index].orderDate}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.timeline,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Delivery Time : ${orders[index].timeslot}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.arrow_right,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Order Type : ${orders[index].orderType}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.arrow_right,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Bill Amount : ${orders[index].orderFullPrice}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     iconData(
                            //         Icon(
                            //           Icons.delivery_dining_sharp,
                            //           color: Colors.green[900],
                            //           size: 12,
                            //         ),
                            //         Text(
                            //           "Delivery Charge : ${orders[index].deliveryCharges}",
                            //           style: TextStyle(
                            //               fontSize: 14,
                            //               color: Colors.green[900],
                            //               fontWeight: FontWeight.bold),
                            //         )),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.add_location_sharp,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Address : ${orders[index].address}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: flatButton(
                                    Row(
                                      children: [
                                        Text(
                                          "Order Details",
                                          style: TextStyle(
                                            color: Colors.white,
                                            //letterSpacing: 1,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        //Icon(Icons.chevron_right),
                                      ],
                                    ),
                                    Colors.green[900]!,
                                    () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => orderDetails(
                                              orderId: orders[index].orderId ?? 0),
                                          // settings: RouteSettings(
                                          //   arguments: orders[index],
                                          // )
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                //
                                if (orders[index].orderStatus == "P" ||
                                    orders[index].orderStatus == "P")
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: flatButton(
                                      Row(
                                        children: [
                                          Text(
                                            "Cancel Order",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Icon(
                                            Icons.cancel,
                                            color: Colors.white,
                                            size: 10,
                                          ),
                                        ],
                                      ),
                                      Colors.redAccent,
                                      () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            // return object of type Dialog
                                            return AlertDialog(
                                              title: new Text("Suyoga"),
                                              content: new Text(
                                                  "Are you sure you want to Cancel"),
                                              actions: <Widget>[
                                                // usually buttons at the bottom of the dialog
                                                new TextButton(
                                                  child: new Text("No"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                new TextButton(
                                                  child: new Text("YES"),
                                                  onPressed: () {
                                                    // print(
                                                    //     ">>>>>>>>inside cancel Order");
                                                    orderCancel(
                                                      orders[index]
                                                          .orderInvoiceNumber ?? '',
                                                      // token,
                                                    ).then((ret) {
                                                      if (ret) {
                                                        FormHelper.showMessage(
                                                            context,
                                                            "SUYOGA",
                                                            "Your Order Cancelled Succesfully",
                                                            "OK", () {
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) =>
                                                          //         orders(),
                                                          //   ),
                                                          // );
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      super
                                                                          .widget));
                                                        });
                                                      } else {
                                                        FormHelper.showMessage(
                                                            context,
                                                            "SUYOGA",
                                                            "Failed to cancel the Order",
                                                            "OK", () {
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      super
                                                                          .widget));
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) =>
                                                          //         orders(),
                                                          //   ),
                                                          // );
                                                        });
                                                      }
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                if (orders[index].orderStatus == "P" ||
                                    orders[index].orderStatus == "P")
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: flatButton(
                                      Row(
                                        children: [
                                          Text(
                                            "Deliver Order",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Icon(
                                            Icons.cancel,
                                            color: Colors.white,
                                            size: 10,
                                          ),
                                        ],
                                      ),
                                      Colors.green,
                                      () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            // return object of type Dialog
                                            return AlertDialog(
                                              title: new Text("Suyoga"),
                                              content: new Text(
                                                  "Are you sure you want to change status to Delivered"),
                                              actions: <Widget>[
                                                // usually buttons at the bottom of the dialog
                                                new TextButton(
                                                  child: new Text("No"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                new TextButton(
                                                  child: new Text("YES"),
                                                  onPressed: () {
                                                    print(
                                                        ">>>>>>>>inside cancel Order");
                                                    deliverOrder(
                                                      orders[index]
                                                          .orderInvoiceNumber ?? '',
                                                      orders[index].orderStatus ?? '',
                                                    ).then((ret) {
                                                      if (ret) {
                                                        FormHelper.showMessage(
                                                            context,
                                                            "SUYOGA",
                                                            "Your Order Status Update Succesfully to Deliver",
                                                            "OK", () {
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) =>
                                                          //         OrderDetails(),
                                                          //   ),
                                                          // );
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      super
                                                                          .widget));
                                                        });
                                                      } else {
                                                        FormHelper.showMessage(
                                                            context,
                                                            "SUYOGA",
                                                            "Failed to update the Order Satus",
                                                            "OK", () {
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) =>
                                                          //         OrderDetails(),
                                                          //   ),
                                                          // );
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      super
                                                                          .widget));
                                                        });
                                                      }
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                //
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      color: Colors.greenAccent.withOpacity(0.3),
                      padding: EdgeInsets.only(left: 80, right: 80),
                      child: Card(
                        color: Colors.white,
                        // color: Colors.greenAccent.withOpacity(0.3),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0)),
                        child: Column(
                          children: <Widget>[
                            orderStatus("${orders[index].orderStatus}"),
                            // Divider(color: Colors.green[900]),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.point_of_sale,
                                      color: Colors.green[900],
                                      size: 14,
                                    ),
                                    Text(
                                      "Order Number : ${orders[index].orderNumber}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     iconData(
                            //         Icon(
                            //           Icons.edit,
                            //           color: Colors.green[900],
                            //           size: 12,
                            //         ),
                            //         Text(
                            //           "Order id : ${orders[index].orderId}",
                            //           style: TextStyle(
                            //               fontSize: 14,
                            //               color: Colors.green[900],
                            //               fontWeight: FontWeight.bold),
                            //         )),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.arrow_right,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Customer Phone number : ${orders[index].orderUserId}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     iconData(
                            //         Icon(
                            //           Icons.arrow_right,
                            //           color: Colors.green[900],
                            //           size: 12,
                            //         ),
                            //         Text(
                            //           "InvoiceNumber : ${orders[index].orderInvoiceNumber}",
                            //           style: TextStyle(
                            //               fontSize: 14,
                            //               color: Colors.green[900],
                            //               fontWeight: FontWeight.bold),
                            //         )),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.date_range,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Order Date : ${orders[index].orderDate}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.timeline,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Delivery Time : ${orders[index].timeslot}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.arrow_right,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Order Type : ${orders[index].orderType}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.arrow_right,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Bill Amount : ${orders[index].orderFullPrice}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     iconData(
                            //         Icon(
                            //           Icons.delivery_dining_sharp,
                            //           color: Colors.green[900],
                            //           size: 12,
                            //         ),
                            //         Text(
                            //           "Delivery Charge : ${orders[index].deliveryCharges}",
                            //           style: TextStyle(
                            //               fontSize: 14,
                            //               color: Colors.green[900],
                            //               fontWeight: FontWeight.bold),
                            //         )),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.add_location_sharp,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Address : ${orders[index].address}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconData(
                                    Icon(
                                      Icons.edit,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "Pincode : ${orders[index].pincode}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[900],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: flatButton(
                                    Row(
                                      children: [
                                        Text(
                                          "Order Details",
                                          style: TextStyle(
                                            color: Colors.white,
                                            //letterSpacing: 1,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        //Icon(Icons.chevron_right),
                                      ],
                                    ),
                                    Colors.green[900]!,
                                    () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => orderDetails(
                                              orderId: orders[index].orderId ?? 0),
                                          // settings: RouteSettings(
                                          //   arguments: orders[index],
                                          // )
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                //
                                if (orders[index].orderStatus == "P" ||
                                    orders[index].orderStatus == "P")
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: flatButton(
                                      Row(
                                        children: [
                                          Text(
                                            "Cancel Order",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Icon(
                                            Icons.cancel,
                                            color: Colors.white,
                                            size: 10,
                                          ),
                                        ],
                                      ),
                                      Colors.redAccent,
                                      () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            // return object of type Dialog
                                            return AlertDialog(
                                              title: new Text("Suyoga"),
                                              content: new Text(
                                                  "Are you sure you want to Cancel"),
                                              actions: <Widget>[
                                                // usually buttons at the bottom of the dialog
                                                new TextButton(
                                                  child: new Text("No"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                new TextButton(
                                                  child: new Text("YES"),
                                                  onPressed: () {
                                                    // print(
                                                    //     ">>>>>>>>inside cancel Order");
                                                    orderCancel(
                                                      orders[index]
                                                          .orderInvoiceNumber ?? '',
                                                      // token,
                                                    ).then((ret) {
                                                      if (ret) {
                                                        FormHelper.showMessage(
                                                            context,
                                                            "SUYOGA",
                                                            "Your Order Cancelled Succesfully",
                                                            "OK", () {
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) =>
                                                          //         orders(),
                                                          //   ),
                                                          // );
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      super
                                                                          .widget));
                                                        });
                                                      } else {
                                                        FormHelper.showMessage(
                                                            context,
                                                            "SUYOGA",
                                                            "Failed to cancel the Order",
                                                            "OK", () {
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      super
                                                                          .widget));
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) =>
                                                          //         orders(),
                                                          //   ),
                                                          // );
                                                        });
                                                      }
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                if (orders[index].orderStatus == "P" ||
                                    orders[index].orderStatus == "P")
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: flatButton(
                                      Row(
                                        children: [
                                          Text(
                                            "Deliver Order",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Icon(
                                            Icons.cancel,
                                            color: Colors.white,
                                            size: 10,
                                          ),
                                        ],
                                      ),
                                      Colors.green,
                                      () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            // return object of type Dialog
                                            return AlertDialog(
                                              title: new Text("Suyoga"),
                                              content: new Text(
                                                  "Are you sure you want to change status to Delivered"),
                                              actions: <Widget>[
                                                // usually buttons at the bottom of the dialog
                                                new TextButton(
                                                  child: new Text("No"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                new TextButton(
                                                  child: new Text("YES"),
                                                  onPressed: () {
                                                    print(
                                                        ">>>>>>>>inside cancel Order");
                                                    deliverOrder(
                                                      orders[index]
                                                          .orderInvoiceNumber ?? '',
                                                      orders[index].orderStatus ?? '',
                                                    ).then((ret) {
                                                      if (ret) {
                                                        FormHelper.showMessage(
                                                            context,
                                                            "SUYOGA",
                                                            "Your Order Status Update Succesfully to Deliver",
                                                            "OK", () {
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) =>
                                                          //         OrderDetails(),
                                                          //   ),
                                                          // );
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      super
                                                                          .widget));
                                                        });
                                                      } else {
                                                        FormHelper.showMessage(
                                                            context,
                                                            "SUYOGA",
                                                            "Failed to update the Order Satus",
                                                            "OK", () {
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) =>
                                                          //         OrderDetails(),
                                                          //   ),
                                                          // );
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      super
                                                                          .widget));
                                                        });
                                                      }
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                //
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }),
              );
            })
      ],
    );
  }

  Widget orderStatus(String status) {
    Icon icon;
    Color color;

    if (status == "P" || status == "Pending" || status == "On-Hold") {
      icon = Icon(
        Icons.timer,
        color: Colors.orange,
      );
      color = Colors.orange;
    } else if (status == "D" || status == "Delivered") {
      icon = Icon(
        Icons.check,
        color: Colors.green,
      );
      color = Colors.green;
    } else if (status == "C" || status == "Cancelled") {
      icon = Icon(
        Icons.clear,
        color: Colors.redAccent,
      );
      color = Colors.redAccent;
    } else {
      icon = Icon(
        Icons.clear,
        color: Colors.redAccent,
      );
      color = Colors.redAccent;
    }
    return iconData(
        icon,
        Text(
          "Order Status :$status",
          style: TextStyle(
            color: color,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget iconData(Icon iconData, Text textdata) {
    return Row(
      children: <Widget>[
        iconData,
        SizedBox(
          width: 10,
        ),
        textdata,
      ],
    );
  }

  Widget flatButton(
    Widget iconText,
    Color color,
    Function onPressed,
  ) {
    return TextButton(
      child: iconText,
      onPressed: onPressed as void Function()?,
      style: TextButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.all(5),
        shape: StadiumBorder(),
      ),
    );
  }

  Future<bool> orderCancel(
    String ordernumber,
    // String token,
  ) async {
    bool ret = false;
    String url = Config.url + Config.cancelOrder;
    print(url);
    try {
      final response = await Dio().put(
        url,
        data: {
          "orderNumber": ordernumber,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            // HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 201) {
        ret = true;
        print("response data>>>>>>>>>>Cancel Order");
        print(url);
        print(response.data);
        print("response data>>>>>>>>>>Cancel rOrder");

        //  print(model.token);
      }
    } on DioException catch (e) {
      print(e.message);
      ret = false;
    }
    return ret;
  }

  Future<bool> deliverOrder(
    String ordernumber,
    String orderStatus,
    // String token,
  ) async {
    bool ret = false;
    String url = Config.url + Config.deliverOrder;
    print(url);
    try {
      final response = await Dio().put(
        url,
        data: {
          "orderNumber": ordernumber,
          "orderStatus": orderStatus,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            // HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 201) {
        ret = true;
        print("response data>>>>>>>>>>deliverOrder");
        print(url);
        print(response.data);
        print("response data>>>>>>>>>>deliverOrder");

        //  print(model.token);
      }
    } on DioException catch (e) {
      print(e.message);
      ret = false;
    }
    return ret;
  }

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
      if (choice.title == "Canceled Orders") {
        globals.status = "c";
      } else if (choice.title == "Delivered Orders") {
        globals.status = "D";
      } else {
        globals.status = "P";
      }

      // globals.status = _selectedChoice.title;

      //getUser();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => super.widget));
      print("printing selected choice>>>");
      print(_selectedChoice.title);
      print("printing selected choice>>>");
    });
  }
}

class Choice {
  const Choice({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Canceled Orders', icon: Icons.directions_boat),
  const Choice(title: 'Pending Orders', icon: Icons.directions_bus),
  const Choice(title: 'Delivered Orders', icon: Icons.directions_railway),
];


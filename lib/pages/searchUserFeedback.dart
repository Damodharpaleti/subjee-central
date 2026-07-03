import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subjeecentral/Config.dart';
import 'package:subjeecentral/components/UserApiProvider.dart';
import 'package:subjeecentral/models/FeedbackModel.dart';
import 'package:subjeecentral/pages/UserFeedbackpage.dart';

class SearchUserFeedBackPage extends StatefulWidget {
  SearchUserFeedBackPage({Key? key, required this.orderId}) : super(key: key);

  final String orderId;
  @override
  SearchUserFeedBackPageState createState() => SearchUserFeedBackPageState();
}

class SearchUserFeedBackPageState extends State<SearchUserFeedBackPage> {
  //Choice _selectedChoice = choices[0];
  //String orderId;
  late String SearchOID;
  UserApiProvider _apiProvider = UserApiProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUser();
  }

  void getUser() {
    _apiProvider.getUserFeedBackBySearch(this.widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    //  return Container(child: _offerProductList());
    return Scaffold(
      appBar: AppBar(
        // title: Text("User FeedBack"),
        title: Container(
          height: 35.0,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: TextField(
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              String searchInput = value.toString().toLowerCase();
              SearchOID = searchInput;

              print(
                  "search by order id Feed back>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
              print(value);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchUserFeedBackPage(
                            orderId: SearchOID,
                            // categoryId: this.widget.categoryId,
                            // pname: pSname,
                            // username: globals.isLoggedIn == true
                            //     ? globals.username
                            //     : 'user',
                            // namevisible:
                            //     globals.isLoggedIn == true ? true : false,
                            // loginvisible:
                            //     globals.isLoggedIn == true ? false : true,
                            //categoryId: data.categoryId,
                            // username: this.widget.username != null
                            //     ? this.widget.username
                            //     : '',
                            // namevisible: this.widget.namevisible,
                            // loginvisible: this.widget.loginvisible,
                          )));
              print(
                  "search by order id Feed back>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.only(left: 4.0, bottom: 8.0, top: 8.0),
                hintText: 'Search By Order Id',
                focusColor: Colors.black,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                )),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green[900],
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserFeedBackPage(),
            ));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[], systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(child: _offerProductList()),
    );
  }

  Widget _offerProductList() {
    return new FutureBuilder(
        future: _apiProvider.getUserFeedBackBySearch(this.widget.orderId),
        builder:
            (BuildContext context, AsyncSnapshot<List<FeedbackModel>> model) {
          if (model.hasData) {
            return _buildList(model.data ?? []);
            //AppBar(title: Text("data there"));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _buildList(List<FeedbackModel> feedback) {
    return ListView(
      children: [
        ListView.builder(
            itemCount: feedback.length,
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
                            orderStatus("${feedback[index].status}"),
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
                                      "Issue Type : ${feedback[index].issueType}",
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
                                      "Order Id : ${feedback[index].orderId}",
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
                                      Icons.date_range,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "User Mobile number : ${feedback[index].userMobNumber}",
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

                            Container(
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, bottom: 10),
                              child: Text(
                                "User Comment : ${feedback[index].userComments}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
                            orderStatus("${feedback[index].status}"),
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
                                      "Issue Type : ${feedback[index].issueType}",
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
                                      "Order Id : ${feedback[index].orderId}",
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
                                      Icons.date_range,
                                      color: Colors.green[900],
                                      size: 12,
                                    ),
                                    Text(
                                      "User Mobile number : ${feedback[index].userMobNumber}",
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

                            Container(
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, bottom: 10),
                              child: Text(
                                "User Comment : ${feedback[index].userComments}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
    VoidCallback? onPressed,
  ) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: StadiumBorder(),
        padding: EdgeInsets.all(5),
      ),
      child: iconText,
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
}

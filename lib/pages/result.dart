import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subjeecentral/Drawer.dart';
import 'package:subjeecentral/components/globals.dart' as globals;
import 'package:subjeecentral/models/product.dart';
import 'package:subjeecentral/pages/login.dart';
import 'package:subjeecentral/providers/product_provider.dart';
import 'package:subjeecentral/widget/widget_product_card.dart';

class result extends StatefulWidget {
  result(
      {Key? key,
      required this.loginvisible,
      required this.namevisible,
      required this.pname,
      required this.username,
      required this.categoryId})
      : super(key: key);
  final String pname;
  final int categoryId;
  final bool namevisible;
  final bool loginvisible;
  final String username;

  @override
  resultState createState() => resultState();
}

class resultState extends State<result> with SingleTickerProviderStateMixin {
  int counter = 0;
  late String pSname;

  late TabController controller;
  @override
  void initState() {
    var productList = Provider.of<ProductProvider>(context, listen: false);
    productList.resetStreams();
    productList.setLoadingStatus(LoadMoreStatus.INITIAL);
    productList.fetchSearchProduct(this.widget.pname);

    super.initState();

    shopCartlogo();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void incCount() {
    print("inc count Calling............");
    counter++;

    print(counter);
    print("inc count Calling............");
  }

  void shopCartlogo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? data2 = prefs.getString("Eachproduct");
    // print(data);
    List l = json.decode(data2 ?? '');

    counter = l.length;
    }

  @override
  Widget build(BuildContext context) {
    return _productList();
  }

  Widget basicappbar() {
    return AppBar(
      backgroundColor: Colors.green[900],
      //leading: Image.asset('assets/images/logo.png'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: this.widget.namevisible,
                  child: GestureDetector(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            this.widget.username,
                            style: TextStyle(fontSize: 13),
                          ),
                          CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.person),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Visibility(
                  visible: this.widget.loginvisible,
                  child: GestureDetector(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.red)),
                                  backgroundColor: Colors.orange),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Login & Sign up',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Login()));
                              }),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 10),
          child: new Stack(
            children: <Widget>[
              new IconButton(
                  // icon: Icon(Icons.notifications),
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => CartPage(
                    //           username: this.widget.username != null
                    //               ? this.widget.username
                    //               : '',
                    //           namevisible: this.widget.namevisible,
                    //           loginvisible: this.widget.loginvisible,
                    //         )));
                  }),
              // counter != 0 ?
              new Positioned(
                right: 4,
                top: 6,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
              // : new Container()
            ],
          ),
        ),

        ///
        // Icon(
        //   Icons.notifications_none,
        //   color: Colors.white,
        // ),
        SizedBox(
          width: 20,
        ),
      ],
      title: Container(
        height: 35.0,
        padding: EdgeInsets.only(left: 129, right: 5),
        child: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            String searchInput = value.toString().toLowerCase();
            pSname = searchInput;

            print("search>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
            print(value);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => result(
                          categoryId: this.widget.categoryId,
                          pname: pSname,
                          username: globals.isLoggedIn == true
                              ? globals.username
                              : 'user',
                          namevisible:
                              globals.isLoggedIn == true ? true : false,
                          loginvisible:
                              globals.isLoggedIn == true ? false : true,
                          //categoryId: data.categoryId,
                          // username: this.widget.username != null
                          //     ? this.widget.username
                          //     : '',
                          // namevisible: this.widget.namevisible,
                          // loginvisible: this.widget.loginvisible,
                        )));
            print("search>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.only(left: 4.0, bottom: 8.0, top: 8.0),
              hintText: 'Search',
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
      // title: TextField(
      //   decoration: InputDecoration(
      //       filled: true,
      //       fillColor: Colors.white,
      //       contentPadding:
      //           const EdgeInsets.only(left: 4.0, bottom: 8.0, top: 8.0),
      //       hintText: 'Search',
      //       focusColor: Colors.black,
      //       border: OutlineInputBorder(),
      //       prefixIcon: Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       )),
      // ),
    );
  }

  Widget _productList() {
    return Scaffold(
        appBar: basicappbar() as PreferredSizeWidget,
        drawer: SideMenuDrawer(),
        body: new Consumer<ProductProvider>(builder: (
          BuildContext context,
          productsModel,
          child,
        ) {
          if (productsModel.searchProducts.length > 0 &&
              productsModel.getLoadMoreStatus() != LoadMoreStatus.INITIAL) {
            return _buildProductList(productsModel.searchProducts,
                productsModel.getLoadMoreStatus() == LoadMoreStatus.LOADING);
          }
          return Center(
            // child: CircularProgressIndicator(),
            child: Text(
              "Search result not found",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.green[900]),
            ),
          );
        }));
  }

  Widget _buildProductList(List<Product> items, bool isLoadMore) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 4,
        children: items.map((Product item) {
          return ProductCard(data: item);
        }).toList(),
      ),
    );
  }

  Widget incValue() {
    setState(() {
      counter++;
      print("printinf=g Counter Value");
      print(counter);
      print("printinf=g Counter Value");
    });
    return SizedBox.shrink();
  }
}

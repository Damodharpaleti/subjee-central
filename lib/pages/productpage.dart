import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subjeecentral/Drawer.dart';
import 'package:subjeecentral/models/product.dart';
import 'package:subjeecentral/pages/login.dart';
import 'package:subjeecentral/pages/result.dart';
import 'package:subjeecentral/providers/product_provider.dart';
import 'package:subjeecentral/components/globals.dart' as globals;
import 'package:subjeecentral/widget/widget_product_card.dart';

//class Productpage extends StatefulWidget {

class Productpage extends StatefulWidget {
  const Productpage({Key? key, required this.categoryId, required this.cityName}) : super(key: key);

  final int categoryId;
  final String cityName;
  final bool? namevisible = null;
  final bool? loginvisible = null;
  final String? username = null;

  @override
  ProductpageState createState() => ProductpageState();
}

class ProductpageState extends State<Productpage>
    with SingleTickerProviderStateMixin {
  int _pageNumber = 1;
  int counter = 0;
  List<Tab> myTabs = <Tab>[
    Tab(text: 'Fruits'),
    Tab(text: 'Vegetables'),
    Tab(text: 'Groceries'),
  ];
  late TabController controller;
  ScrollController _scrollController = new ScrollController();
  late String pSname;
  final _searchQuery = new TextEditingController();
  late Timer _debounds;


  @override
  void initState() {
    var productList = Provider.of<ProductProvider>(context, listen: false);
    productList.resetStreams();
    productList.setLoadingStatus(LoadMoreStatus.INITIAL);
    productList.fetchProduct(_pageNumber,
        categoryId: this.widget.categoryId, city: this.widget.cityName);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        productList.setLoadingStatus(LoadMoreStatus.LOADING);
        productList.fetchProduct(++_pageNumber,
            categoryId: this.widget.categoryId, city: this.widget.cityName);
      }
    });
    _searchQuery.addListener(_onSearchChange);
    super.initState();
    if (this.widget.categoryId == 1) {
      int index = 0;
      controller = new TabController(
          length: myTabs.length, initialIndex: index, vsync: this);
    } else if (this.widget.categoryId == 2) {
      int index = 1;
      controller = new TabController(
          length: myTabs.length, initialIndex: index, vsync: this);
    } else {
      int index = 2;
      controller = new TabController(
          length: myTabs.length, initialIndex: index, vsync: this);
    }
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

  _onSearchChange() {
    var productList = Provider.of<ProductProvider>(context, listen: false);
    if (_debounds.isActive) _debounds.cancel();
    _debounds = Timer(const Duration(milliseconds: 500), () {
      productList.resetStreams();
      productList.setLoadingStatus(LoadMoreStatus.INITIAL);
      productList.fetchProduct(_pageNumber,
          categoryId: this.widget.categoryId,
          strSearch: _searchQuery.text,
          city: this.widget.cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _productList();
  }

  Widget _productList() {
    List<Tab> myTabs = <Tab>[
      Tab(
          child: GestureDetector(
        child: Text(
          'FRUITS',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Productpage(
                        categoryId: 1,
                        cityName: this.widget.cityName,
                      )));
        },
      )),
      Tab(
          child: GestureDetector(
        child: Text(
          'VEGETABLES',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Productpage(
                        categoryId: 2,
                        cityName: this.widget.cityName,
                        // username: this.widget.username,
                      )));
        },
      )),
      Tab(
          child: GestureDetector(
        child: Text(
          'GROCERIES',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Productpage(
                        categoryId: 11,
                        cityName: this.widget.cityName,
                        //  username: this.widget.username,
                      )));
        },
      )),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          //leading: Image.asset('assets/images/logo.png'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: globals.isLoggedIn == false
                    ? Container(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              side: BorderSide(color: Colors.red),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
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
                      )
                    : Container(
                        child: Text("Hi ${globals.username}"),
                      ),
              ),
            ),
            // Icon(
            //   Icons.notifications_none,
            //   color: Colors.white,
            // ),
            // SizedBox(
            //   width: 20,
            // ),
            Container(
              // padding: EdgeInsets.only(right: 10),
              padding: EdgeInsets.only(top: 10),
              child: new Stack(
                children: <Widget>[
                  // new IconButton(
                  //     // icon: Icon(Icons.notifications),
                  //     icon: Icon(Icons.shopping_cart),
                  //     onPressed: () {
                  //       print("icon clicked");
                  //       // Navigator.of(context).push(MaterialPageRoute(
                  //       //     builder: (context) => CartPage(
                  //       //           username: globals.isLoggedIn == true
                  //       //               ? globals.username
                  //       //               : 'user',
                  //       //           namevisible:
                  //       //               globals.isLoggedIn == true ? true : false,
                  //       //           loginvisible:
                  //       //               globals.isLoggedIn == true ? false : true,
                  //       //         )));
                  //     }),
                  counter != 0
                      ? new Positioned(
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
                      : new Container()
                ],
              ),
            ),
            // new IconButton(
            //     icon: new Icon(
            //       Icons.notifications,
            //       color: Colors.white,
            //     ),
            //     onPressed: () {})
          ],
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
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ),
          ),
          bottom: new TabBar(
            controller: controller,
            indicatorColor: Colors.red[600],
            indicatorWeight: 3.0,
            unselectedLabelColor: Colors.purple,
            labelColor: Colors.blue,
            tabs: myTabs,
          ),
        ),
        drawer: SideMenuDrawer(),
        body: new Consumer<ProductProvider>(builder: (
          BuildContext context,
          productsModel,
          child,
        ) {
          if (productsModel.allProducts.length > 0 &&
              productsModel.getLoadMoreStatus() != LoadMoreStatus.INITIAL) {
            return _buildProductList(productsModel.allProducts,
                productsModel.getLoadMoreStatus() == LoadMoreStatus.LOADING);
          }
          return Center(
            child: CircularProgressIndicator(),
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
    return SizedBox();
  }
}


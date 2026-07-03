import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subjeecentral/components/loader_provider.dart';
import 'package:subjeecentral/components/orderprovider.dart';
import 'package:subjeecentral/pages/HomePage.dart';

import 'package:subjeecentral/pages/login.dart';
import 'package:subjeecentral/pages/orders.dart';
import 'package:subjeecentral/pages/productpage.dart';

import 'providers/product_provider.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  Future<String?> logindata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var loginMobNumber = prefs.getString("loginmobileNumber");
    print(loginMobNumber);
    return loginMobNumber;
  }

  @override
  Widget build(BuildContext context)  {
    return FutureBuilder(
        future: logindata(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return home();
          }
          return multi();
        });
  }

  Widget home() {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LoaderProvider(),
            child: MyHomePage(),
          ),
          ChangeNotifierProvider(
            create: (context) => OrderProvider(),
            child: orders(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProductProvider(),
            child: Productpage(categoryId: 1, cityName: ''),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: Login(),
          debugShowCheckedModeBanner: false,
        ));
  }

  Widget multi() {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LoaderProvider(),
            child: MyHomePage(),
          ),
          ChangeNotifierProvider(
            create: (context) => OrderProvider(),
            child: orders(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProductProvider(),
            child: Productpage(categoryId: 1, cityName: ''),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: MyHomePage(),
          debugShowCheckedModeBanner: false,
        ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   // return MaterialApp(
  //   //   theme: ThemeData(
  //   //     primarySwatch: Colors.green,
  //   //   ),
  //   //   home: Login(),
  //   //   debugShowCheckedModeBanner: false,
  //   // );
  //   return MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider(
  //           create: (context) => LoaderProvider(),
  //           child: MyHomePage(),
  //         ),
  //         ChangeNotifierProvider(
  //           create: (context) => OrderProvider(),
  //           child: orders(),
  //         ),
  //         ChangeNotifierProvider(
  //           create: (context) => ProductProvider(),
  //           child: Productpage(),
  //         ),
  //       ],
  //       child: MaterialApp(
  //         theme: ThemeData(
  //           primarySwatch: Colors.green,
  //         ),
  //         home: Login(),
  //         debugShowCheckedModeBanner: false,
  //       ));
  // }
}

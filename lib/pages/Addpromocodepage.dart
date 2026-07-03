import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:subjeecentral/pages/addpromocode.dart';

class Addpromocodepage extends StatefulWidget {
  const Addpromocodepage({Key? key}) : super(key: key);

  @override
  State<Addpromocodepage> createState() => _AddpromocodepageState();
}

class _AddpromocodepageState extends State<Addpromocodepage> {
  @override
  Widget build(BuildContext context) {
    return AddPromoCode();
  }
}





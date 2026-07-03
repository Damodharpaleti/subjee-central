import 'package:flutter/material.dart';
import 'package:subjeecentral/ui/base_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Basewidget(
      builder: (context, sizinginformation) {
        return Scaffold(
          body: Center(
            child: Text(sizinginformation.toString()),
          ),
        );
      },
    );
  }
}

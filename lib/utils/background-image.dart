import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    this.image,
  });

  final String? image;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned.fill(
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.black,
            image: new DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.grey.withValues(alpha: 0.3), BlendMode.dstATop),
              image: AssetImage(image ?? ''),
            ),
          ),
        ),
      ),
    ]);
  }
}

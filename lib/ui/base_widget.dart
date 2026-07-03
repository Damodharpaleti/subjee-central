import 'package:flutter/material.dart';
import 'package:subjeecentral/ui/sizing_information.dart';
import 'package:subjeecentral/enums/device_screen_type.dart';

class Basewidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;
  const Basewidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            var sizinginformation = SizingInformation(
              orientation: orientation,
              deviceScreenType: getDeviceType(constraints.maxWidth),
              screenSize: MediaQuery.of(context).size,
              localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight),
            );
            return builder(context, sizinginformation);
          },
        );
      },
    );
  }

  DeviceScreenType getDeviceType(double width) {
    if (width > 1100) return DeviceScreenType.Desktop;
    if (width > 600) return DeviceScreenType.Tablet;
    return DeviceScreenType.Mobile;
  }
}

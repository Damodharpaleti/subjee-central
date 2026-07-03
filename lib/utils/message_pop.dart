import 'package:flutter/material.dart';

class PopMessage {
  static void showMessage(
    BuildContext context,
    String? title,
    String? message,
    String? ButtonText,
    Function? onPressed, {
    bool isconformationDialog = false,
    String buttonText2 = "",
    Function? onPressed2,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title ?? ''),
            content: Text(message ?? ''),
            actions: [
              TextButton(
                  onPressed: () {
                    return onPressed?.call();
                  },
                  child: Text(ButtonText ?? '')),
              Visibility(
                visible: isconformationDialog,
                child: TextButton(
                  onPressed: () {
                    return onPressed2?.call();
                  },
                  child: Text(buttonText2),
                ),
              ),
            ],
          );
        });
  }
}

// import 'package:flutter/material.dart';

// class TextFieldAlertDialog extends StatelessWidget {
//   TextEditingController _textFieldController = TextEditingController();

//   _displayDialog(BuildContext context) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('What is your Lucky Number'),
//             content: TextField(
//               controller: _textFieldController,
//               textInputAction: TextInputAction.go,
//               keyboardType: TextInputType.numberWithOptions(),
//               decoration: InputDecoration(hintText: "Enter your number"),
//             ),
//             actions: <Widget>[
//               new ElevatedButton(
//                 child: new Text('Submit'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               )
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _displayDialog(context);
//   }
// }





import 'package:flutter/material.dart';

class AddPromoCode extends StatefulWidget {
  const AddPromoCode({Key? key}) : super(key: key);

  @override
  State<AddPromoCode> createState() => _AddPromoCodeState();
}

class _AddPromoCodeState extends State<AddPromoCode> {
  var updatemodel;
  int selectedRadio = 0;
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var globalFormKey;
    return Scaffold(
        appBar: AppBar(
          title: Text("Addpromocode"),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[],
        ),
        backgroundColor: Colors.greenAccent.withOpacity(0.3),
        body: SafeArea(
          child: Form(
            key: globalFormKey,
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          //padding: EdgeInsets.symmetric(vertical: 10.0),
                          padding:
                              EdgeInsets.only(left: 180, right: 30, top: 30),
                          child: Container(
                            height: 40,
                            width: 300,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onSaved: (input) =>
                                  this.updatemodel.productname = input,
                              validator: (input) => (input?.isEmpty ?? true)
                                  ? "Promo code"
                                  : null,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(top: 6.8, left: 1),
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 20),
                                    // child: Icon(
                                    //   Icons.verified,
                                    //   size: 26,
                                    //
                                    // ),
                                    child: Text("Promo code :",
                                        style: TextStyle(
                                            // height: 5,
                                            fontSize: 19)),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    fontSize: 19,
                                  )),
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          //padding: EdgeInsets.symmetric(vertical: 10.0),
                          padding:
                              EdgeInsets.only(left: 110, top: 30, right: 10),
                          child: Container(
                            height: 40,
                            width: 300,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onSaved: (input) => this.updatemodel.cityId =
                                  int.parse(input ?? '0'),
                              validator: (input) => (input?.isEmpty ?? true)
                                  ? "Start date"
                                  : null,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(top: 6.8, left: 1),
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 20),
                                    // child: Icon(
                                    //   Icons.verified,
                                    //   size: 26,
                                    //
                                    // ),
                                    child: Text("Start date:",
                                        style: TextStyle(
                                            // height: 5,
                                            fontSize: 19)),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    fontSize: 19,
                                  )),
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          //padding: EdgeInsets.symmetric(vertical: 10.0),
                          padding:
                              EdgeInsets.only(left: 180, right: 30, top: 30),
                          child: Container(
                            height: 40,
                            width: 300,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onSaved: (input) =>
                                  this.updatemodel.productname = input,
                              validator: (input) =>
                                  (input?.isEmpty ?? true) ? "End date" : null,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(top: 6.8, left: 1),
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 20),
                                    // child: Icon(
                                    //   Icons.verified,
                                    //   size: 26,
                                    //
                                    // ),
                                    child: Text("End date :",
                                        style: TextStyle(
                                            // height: 5,
                                            fontSize: 19)),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    fontSize: 19,
                                  )),
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          //padding: EdgeInsets.symmetric(vertical: 10.0),
                          padding:
                              EdgeInsets.only(left: 110, top: 30, right: 10),
                          child: Container(
                            height: 40,
                            width: 300,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onSaved: (input) => this.updatemodel.cityId =
                                  int.parse(input ?? '0'),
                              validator: (input) => (input?.isEmpty ?? true)
                                  ? "Minimum Amount"
                                  : null,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(top: 6.8, left: 1),
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 20),
                                    // child: Icon(
                                    //   Icons.verified,
                                    //   size: 26,
                                    //
                                    // ),
                                    child: Text("minimum Amount:",
                                        style: TextStyle(
                                            // height: 5,
                                            fontSize: 19)),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    fontSize: 19,
                                  )),
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          //padding: EdgeInsets.symmetric(vertical: 10.0),
                          padding:
                              EdgeInsets.only(left: 180, right: 30, top: 30),
                          child: Container(
                            height: 40,
                            width: 300,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onSaved: (input) =>
                                  this.updatemodel.productname = input,
                              validator: (input) => (input?.isEmpty ?? true)
                                  ? "Percentage"
                                  : null,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(top: 6.8, left: 1),
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 20),
                                    // child: Icon(
                                    //   Icons.verified,
                                    //   size: 26,
                                    //
                                    // ),
                                    child: Text("Percentage :",
                                        style: TextStyle(
                                            // height: 5,
                                            fontSize: 19)),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    fontSize: 19,
                                  )),
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          //padding: EdgeInsets.symmetric(vertical: 10.0),
                          padding:
                              EdgeInsets.only(left: 110, top: 30, right: 10),
                          child: Container(
                            height: 40,
                            width: 300,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onSaved: (input) => this.updatemodel.cityId =
                                  int.parse(input ?? '0'),
                              validator: (input) => (input?.isEmpty ?? true)
                                  ? "Maximum discount"
                                  : null,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(top: 6.8, left: 1),
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 20),
                                    // child: Icon(
                                    //   Icons.verified,
                                    //   size: 26,
                                    //
                                    // ),
                                    child: Text("Maximum discount :",
                                        style: TextStyle(
                                            // height: 5,
                                            fontSize: 19)),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    fontSize: 19,
                                  )),
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      Padding(
                        //padding: EdgeInsets.symmetric(vertical: 10.0),
                        padding: EdgeInsets.only(left: 180, right: 30, top: 30),
                        child: Container(
                          height: 40,
                          width: 300,
                          // width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            onSaved: (input) =>
                                this.updatemodel.cityId = int.parse(input ?? '0'),
                            validator: (input) => (input?.isEmpty ?? true)
                                ? "Per user limit"
                                : null,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(top: 6.8, left: 1),
                                  // padding: EdgeInsets.symmetric(
                                  //     horizontal: 20),
                                  // child: Icon(
                                  //   Icons.verified,
                                  //   size: 26,
                                  //
                                  // ),
                                  child: Text("Per user limit :",
                                      style: TextStyle(
                                          // height: 5,
                                          fontSize: 19)),
                                ),
                                border: InputBorder.none,
                                hintText: "",
                                hintStyle: TextStyle(
                                  fontSize: 19,
                                )),
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                          ),
                        ),
                      ),
                    ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 100),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                  ),
                                )),
                          )
                        ]),
                  ],
                ),

                //                 Row(
                //                   children: [

                //                      Padding(
                //                       //padding: EdgeInsets.symmetric(vertical: 10.0),
                //                       padding: EdgeInsets.only(
                //                           left: 50, right: 30, top: 30),
                //                     ),
                //                    Radio(
                //                                       value: 0,
                //                                       groupValue: selectedRadio,
                //                                       active
                //                                       onChanged: (val) {
                //                                         setSelectedRadio(val);
                //                                       },
                //                                     ),
                //                     Padding(
                //                       //padding: EdgeInsets.symmetric(vertical: 10.0),
                //                       padding: EdgeInsets.only(
                //                           left: 70, right: 30, top: 10),
                //                       child: Container(
                //                         height: 40,
                //                         width: 300,
                //                         // width: double.infinity,
                //                          decoration: BoxDecoration(
                //                            color: Colors.white,
                //                            borderRadius: BorderRadius.circular(10),
                //                          ),
                //                         child: TextFormField(
                //                           onSaved: (input) =>
                //                               this.updatemodel.productname = input,
                //                           validator: (input) => input.length < 1
                //                               ? "is New User"
                //                               : null,
                //                           decoration: InputDecoration(
                //                               errorStyle: TextStyle(
                //                                 color: Colors.red,
                //                                 fontWeight: FontWeight.bold,
                //                                 fontSize: 12,
                //                               ),
                //                               prefixIcon: Padding(
                //                                 padding: EdgeInsets.only(
                //                                     top: 6.8, left: 1),
                //                                 // padding: EdgeInsets.symmetric(
                //                                 //     horizontal: 20),
                //                                 // child: Icon(
                //                                 //   Icons.verified,
                //                                 //   size: 26,
                //                                 //
                //                                 // ),
                //                                 child: Text("is New User :",
                //                                     style: TextStyle(
                //                                         // height: 5,
                //                                         fontSize: 19)),
                //                               ),
                //                               border: InputBorder.none,
                //                               hintText: "",
                //                               hintStyle: TextStyle(
                //
                //                                 fontSize: 19,
                //                               )),
                //                           style: TextStyle(color: Colors.black),
                //                           keyboardType: TextInputType.emailAddress,
                //                           textInputAction: TextInputAction.next,
                //                           cursorColor: Colors.black,
                //                         ),
                //                       ),
                //                     ),
                //                     Padding(
                //                       //padding: EdgeInsets.symmetric(vertical: 10.0),
                //                       padding: EdgeInsets.only(
                //                           left: 30, right: 30, top: 30),
                //                     ),
                //                     Radio(

                //                                       value: 0,
                //                                       groupValue: selectedRadio,
                //                                       active
                //                                       onChanged: (val) {
                //                                         setSelectedRadio(val);
                //                                       },
                //                                     ),
                //                     Padding(
                //                       //padding: EdgeInsets.symmetric(vertical: 10.0),
                //                       padding: EdgeInsets.only(
                //                           left: 10, top: 30, right: 10),
                //                       child: Container(
                //                         height: 40,
                //                         width: 300,
                //                         // width: double.infinity,
                //                         decoration: BoxDecoration(
                //                           color: Colors.white,
                //                           borderRadius: BorderRadius.circular(10),
                //                         ),
                //                         child: TextFormField(
                //                           onSaved: (input) => this
                //                               .updatemodel
                //                               .cityId = int.parse(input),
                //                           validator: (input) =>
                //                               input.length < 1 ? "is Active" : null,
                //                           decoration: InputDecoration(
                //                               errorStyle: TextStyle(
                //                                 color: Colors.red,
                //                                 fontWeight: FontWeight.bold,
                //                                 fontSize: 12,
                //                               ),
                //                               prefixIcon: Padding(
                //                                 padding: EdgeInsets.only(
                //                                     top: 6.8, left: 1),
                //                                 // padding: EdgeInsets.symmetric(
                //                                 //     horizontal: 20),
                //                                 // child: Icon(
                //                                 //   Icons.verified,
                //                                 //   size: 26,
                //                                 //
                //                                 // ),
                //                                 child: Text("is Active :",
                //                                     style: TextStyle(
                //                                         // height: 5,
                //                                         fontSize: 19)),
                //                               ),
                //                               border: InputBorder.none,
                //                               hintText: "",
                //                               hintStyle: TextStyle(
                //
                //                                 fontSize: 19,
                //                               )),
                //                           style: TextStyle(color: Colors.black),
                //                           keyboardType: TextInputType.emailAddress,
                //                           textInputAction: TextInputAction.next,
                //                           cursorColor: Colors.black,
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),

                // Row(
                //                   children: [
                //                     Padding(
                //                       //padding: EdgeInsets.symmetric(vertical: 10.0),
                //                       padding: EdgeInsets.only(
                //                           left: 50, right: 30, top: 30),
                //                     ),
                //                     Radio(
                //                                       value: 0,
                //                                       groupValue: selectedRadio,
                //                                       active
                //                                       onChanged: (val) {
                //                                         setSelectedRadio(val);
                //                                       },
                //                                     ),
                //                     Padding(
                //                       //padding: EdgeInsets.symmetric(vertical: 10.0),
                //                       padding: EdgeInsets.only(
                //                           left: 70, right: 30, top: 30),
                //                       child: Container(
                //                         height: 40,
                //                         width: 300,
                //                         // width: double.infinity,
                //                         decoration: BoxDecoration(
                //                           color: Colors.white,
                //                           borderRadius: BorderRadius.circular(10),
                //                         ),
                //                         child: TextFormField(
                //                           onSaved: (input) =>
                //                               this.updatemodel.productname = input,
                //                           validator: (input) => input.length < 1
                //                               ? "is Pincode"
                //                               : null,
                //                           decoration: InputDecoration(
                //                               errorStyle: TextStyle(
                //                                 color: Colors.red,
                //                                 fontWeight: FontWeight.bold,
                //                                 fontSize: 12,
                //                               ),
                //                               prefixIcon: Padding(
                //                                 padding: EdgeInsets.only(
                //                                     top: 6.8, left: 1),
                //                                 // padding: EdgeInsets.symmetric(
                //                                 //     horizontal: 20),
                //                                 // child: Icon(
                //                                 //   Icons.verified,
                //                                 //   size: 26,
                //                                 //
                //                                 // ),
                //                                 child: Text("is Pincode  :",
                //                                     style: TextStyle(
                //                                         // height: 5,
                //                                         fontSize: 19)),
                //                               ),
                //                               border: InputBorder.none,
                //                               hintText: "",
                //                               hintStyle: TextStyle(
                //
                //                                 fontSize: 19,
                //                               )),
                //                           style: TextStyle(color: Colors.black),
                //                           keyboardType: TextInputType.emailAddress,
                //                           textInputAction: TextInputAction.next,
                //                           cursorColor: Colors.black,
                //                         ),
                //                       ),
                //                     ),
                //                     Padding(
                //                       //padding: EdgeInsets.symmetric(vertical: 10.0),
                //                       padding: EdgeInsets.only(
                //                           left: 30, right: 30, top: 30),
                //                     ),
                //                     Radio(
                //                                       value: 0,
                //                                       groupValue: selectedRadio,
                //                                       active
                //                                       onChanged: (val) {
                //                                         setSelectedRadio(val);
                //                                       },
                //                                     ),
                //                     Padding(
                //                       //padding: EdgeInsets.symmetric(vertical: 10.0),
                //                       padding: EdgeInsets.only(
                //                           left: 10, top: 30, right: 10),
                //                       child: Container(
                //                         height: 40,
                //                         width: 300,
                //                         // width: double.infinity,
                //                         decoration: BoxDecoration(
                //                           color: Colors.white,
                //                           borderRadius: BorderRadius.circular(10),
                //                         ),
                //                         child: TextFormField(
                //                           onSaved: (input) => this
                //                               .updatemodel
                //                               .cityId = int.parse(input),
                //                           validator: (input) =>
                //                               input.length < 1 ? "is  City" : null,
                //                           decoration: InputDecoration(
                //                               errorStyle: TextStyle(
                //                                 color: Colors.red,
                //                                 fontWeight: FontWeight.bold,
                //                                 fontSize: 12,
                //                               ),
                //                               prefixIcon: Padding(
                //                                 padding: EdgeInsets.only(
                //                                     top: 6.8, left: 1),
                //                                 // padding: EdgeInsets.symmetric(
                //                                 //     horizontal: 20),
                //                                 // child: Icon(
                //                                 //   Icons.verified,
                //                                 //   size: 26,
                //                                 //
                //                                 // ),
                //                                 child: Text("is City :",
                //                                     style: TextStyle(
                //                                         // height: 5,
                //                                         fontSize: 19)),
                //                               ),
                //                               border: InputBorder.none,
                //                               hintText: "",
                //                               hintStyle: TextStyle(
                //
                //                                 fontSize: 19,
                //                               )),
                //                           style: TextStyle(color: Colors.black),
                //                           keyboardType: TextInputType.emailAddress,
                //                           textInputAction: TextInputAction.next,
                //                           cursorColor: Colors.black,
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 Row(
                //                   children: [
                //                     Padding(
                //                       //padding: EdgeInsets.symmetric(vertical: 10.0),
                //                       padding: EdgeInsets.only(
                //                           left: 50, right: 30, top: 30),
                //                     ),
                //                     Radio(
                //                                       value: 0,
                //                                       groupValue: selectedRadio,
                //                                       active
                //                                       onChanged: (val) {
                //                                         setSelectedRadio(val);
                //                                       },
                //                                     ),
                //                     Padding(
                //                       //padding: EdgeInsets.symmetric(vertical: 10.0),
                //                       padding: EdgeInsets.only(
                //                           left: 70, right: 30, top: 30),
                //                       child: Container(
                //                         height: 40,
                //                         width: 300,
                //                         // width: double.infinity,
                //                         decoration: BoxDecoration(
                //                           color: Colors.white,
                //                           borderRadius: BorderRadius.circular(10),
                //                         ),
                //                         child: TextFormField(
                //                           onSaved: (input) =>
                //                               this.updatemodel.productname = input,
                //                           validator: (input) => input.length < 1
                //                               ? "Per user"
                //                               : null,
                //                           decoration: InputDecoration(
                //                               errorStyle: TextStyle(
                //                                 color: Colors.red,
                //                                 fontWeight: FontWeight.bold,
                //                                 fontSize: 12,
                //                               ),
                //                               prefixIcon: Padding(
                //                                 padding: EdgeInsets.only(
                //                                     top: 6.8, left: 1),
                //                                 // padding: EdgeInsets.symmetric(
                //                                 //     horizontal: 20),
                //                                 // child: Icon(
                //                                 //   Icons.verified,
                //                                 //   size: 26,
                //                                 //
                //                                 // ),
                //                                 child: Text("Per user :",
                //                                     style: TextStyle(
                //                                         // height: 5,
                //                                         fontSize: 19)),
                //                               ),
                //                               border: InputBorder.none,
                //                               hintText: "",
                //                               hintStyle: TextStyle(
                //
                //                                 fontSize: 19,
                //                               )),
                //                           style: TextStyle(color: Colors.black),
                //                           keyboardType: TextInputType.emailAddress,
                //                           textInputAction: TextInputAction.next,
                //                           cursorColor: Colors.black,
                //                         ),
                //                       ),
                //                     ),
              ],
            ),
          ),
        ));
  }
}





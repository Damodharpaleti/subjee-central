import 'package:flutter/material.dart';
import 'package:subjeecentral/models/product.dart';
import 'package:subjeecentral/pages/updateProduct.dart';
import 'package:subjeecentral/utils/CustomTextStyle.dart';

import '../Config.dart';

// keep this code

class ProductCard extends StatelessWidget {
  ProductCard({Key? key, this.data}) : super(key: key);
  final Product? data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object check>>>>");
        print(data?.productName);
        print(data?.marketPrice);
        print(data?.price);
        print(data?.productDescription);
        print(data?.productDescription);
        print("object check>>>>");
        // Navigator.push(
        //   context,
        // MaterialPageRoute(
        //   builder: (context) => cartpage(),
        // ),
        /////

        // MaterialPageRoute(
        //   builder: (context) => cartpage(),
        // ),

        //
        // MaterialPageRoute(
        //   builder: (context) => ProductDetails(
        //     product: data,
        //   ),
        // ),
        //);
      },
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(),
                // boxShadow: ,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            right: 0, left: 0, top: 20, bottom: 8),
                        width: 100,
                        height: 110,
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.transparent,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  Config.imageurl + (data?.productCode ?? '') + '.png',
                                ))))
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 8, top: 4),
                          child: Text(
                            '${data?.productName ?? ''}',
                            maxLines: 2,
                            softWrap: true,
                            style: CustomTextStyle.textFormFieldSemiBold
                                .copyWith(fontSize: 18),
                          ),
                        ),
                        Expanded(
                            child: Text(
                                'Market Price :' +
                                    ' \u20B9 ' +
                                    '${data?.marketPrice ?? ''}',
                                style: TextStyle(
                                  height: 1.5,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 18,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ))),
                        Expanded(
                            child: Text('Min Quantity' + ' ${data?.quantity ?? ''}',
                                style: TextStyle(
                                  height: 0.9,
                                  // decoration: TextDecoration.lineThrough,
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ))),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '\u20B9' + ' ' + '${data?.price ?? ''}',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                // child: CartCounter(
                                //   data: data,
                                //   numOfItems: 0,
                                // )
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            side: BorderSide(color: Colors.white)),
                                        backgroundColor: Colors.green[900]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Update',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      print(">>>>>update button clicked");
                                      if (data != null) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    updateproduct(
                                                      pdata: data!,
                                                    )));
                                      }
                                    }),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

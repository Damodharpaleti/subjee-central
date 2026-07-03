
import 'package:flutter/material.dart';

class suyogaRefundAndCancellationPolacy extends StatelessWidget {
  const suyogaRefundAndCancellationPolacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('SuyogaRefundAndCancelltionPolacy',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Refund and Cancellation Policy ",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        "Suyoga reserves the right to refuse/cancel any order. Suyoga at its sole discretion may cancel any order(s): ")),
                  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:

                  
                  Text('1 If it suspects a fraudulent transaction, or ')),
                  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:

                  Text('2 If it suspects a customer has undertaken a transaction which is not in accordance with the Terms of Use or ')),
                Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
          
                  Text('3 For any reason outside the control of the Suyoga including causes for delivery related logistical difficulties. ')),
                 Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:

                  Text('Refund/cancellation policies applicable in the following conditions: ')),
                 
                 Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
                 Text('a.In case, the buyer cancels the order online before the product has been shipped, the entire order amount will be refunded. ')),
                 Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:

                  Text('b.In case the item ordered has been shipped but has not yet been delivered to the buyer, the order can still be cancelled online. Total order amount after deduction of shipment and handling charges will be refunded. The refund will be processed, once Suyoga receives the originally ordered item back intact. ')),
                 Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:

                  Text('c.However, the order once delivered cannot be cancelled in any case. ')),
                 Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:

                  Text('d.In case there is an option for online download of data than cancellation will not be possible ')),
                 Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:

                  Text('e. In case of failed transactions or double realization of account for the same order, the total deducted amount will be refunded. ')),
                  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:

                  Text('f.In case of cancelled order/failed transactions, the bank/card transaction charges of the buyer, if any, is likely to be forfeited ')),
                 Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:

                  Text('g. Suyoga offers no guarantees whatsoever for the accuracy or timeliness of the refunds in the buyers card/account ')),
                Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:

                  Text('h.In case of part cancellations, the amount refunded will be corresponding to the part cancellation ')),

              SizedBox(
                  height: 10,
                ),
                        
            ])])));
        
  }
}





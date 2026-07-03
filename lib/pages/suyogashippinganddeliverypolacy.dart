import 'package:flutter/material.dart';

class suyogaShippingAndDeliveryPolacy extends StatelessWidget {
  const suyogaShippingAndDeliveryPolacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('SuyogaShippingAndDeliveryPolacy',
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
                    "ORDERING POLICY",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        "Ordering at our website is very convenient. Our online store boasts of a wide variety of food and non-food products. Customers can purchase these products without the involvement of any middlemen. You can do bulk buying by simply adding products to your cart or make individual product transactions by clicking on â€˜Buy Nowâ€™ against each product.")),
              SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "SHIPPING POLICY",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        "Shipping for all orders made through online within our website and all prices are in Indian Rupees inclusive of Taxes. After your order and payment confirmation, we will ship your products as per your delivery time selected.")),
               
                 SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "DELIVERY TIME",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Normally you will get the products in delivery you selected at the time of placing order. In some cases, it may take longer to receive the shipment depending on your location and accessibility.")),
                      SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "CANCELLATION BY SITE / CUSTOMER",
                    style: TextStyle(color: Colors.grey[900], fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("You as a customer can cancel your order anytime up to the cut-off time of the slot for which you have placed an order by calling our customer service. In such a case we will refund any payments already made by you for the order. If we suspect any fraudulent transaction by any customer or any transaction which defies the terms and conditions of using the website, we at our sole discretion could cancel such orders. We will maintain a negative list of all fraudulent transactions and customers and would deny access to them or cancel any orders placed by them.")),  
               
            ])])));
        
  }
}





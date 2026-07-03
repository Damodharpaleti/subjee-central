import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subjeecentral/Config.dart';
import 'package:subjeecentral/components/UserApiProvider.dart';
import 'package:subjeecentral/models/OrderModel.dart';

class orderDetails extends StatefulWidget {
  const orderDetails({Key? key, required this.orderId}) : super(key: key);

  final int orderId;
  @override
  _orderDetailsState createState() => _orderDetailsState();
}

class _orderDetailsState extends State<orderDetails> {
  UserApiProvider _apiProvider = UserApiProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getUser();
  }

  void getUser() {
    _apiProvider.getOrderDetais(this.widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    //  return Container(child: _offerProductList());
    return Scaffold(
      appBar: AppBar(
        title: Text("OrderDetails"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green[900],
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
        actions: <Widget>[], systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
          color: Colors.greenAccent.withOpacity(0.3),
          child: _offerProductList()),
    );
  }

  Widget _offerProductList() {
    return new FutureBuilder(
        future: _apiProvider.getOrderDetais(this.widget.orderId),
        builder: (BuildContext context, AsyncSnapshot<List<OrderModel>> model) {
          if (model.hasData && model.data != null) {
            return _buildList(model.data!);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _buildList(List<OrderModel> orders) {
    return ListView(
      children: [
        ListView.builder(
            itemCount: orders.length,
            physics: ScrollPhysics(),
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Order Number :"
                          "${orders[index].invoiceNumber}",
                          style: Theme.of(context).textTheme.labelText,
                        ),
                        Text(
                          "Date :"
                          "${orders[index].orderdate}",
                          style: Theme.of(context).textTheme.labelText,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Delivery To",
                          style: Theme.of(context).textTheme.labelHeading,
                        ),
                        Text(
                          "${orders[index].address}",
                          style: Theme.of(context).textTheme.labelText,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Payment Method",
                          style: Theme.of(context).textTheme.labelHeading,
                        ),
                        Text(
                          "${orders[index].paymentMethod}",
                          style: Theme.of(context).textTheme.labelText,
                        ),
                        Divider(
                          color: Colors.green[900],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // CheckPoints(
                        //   checkedTill: 0,
                        //   checkPointFilledColor: Colors.greenAccent,
                        //   checkPoints: ["Processing", "Shipping", "Delivered"],
                        // ),
                        // Divider(
                        //   color: Colors.grey,
                        // ),
                        listOrderItems(orders[index].productList ?? []),
                        Divider(color: Colors.green[900]),
                        itemsTotal(
                          "Delivery Charges",
                          "${orders[index].deliveryCharges}",
                        ),
                        itemsTotal(
                          "Items Total",
                          "${orders[index].totalprice}",
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }

  Widget listOrderItems(List<ProductLists> orderModel) {
    //final OrderModel orderModel = ModalRoute.of(context).settings.arguments;

    return ListView.builder(
      itemCount: orderModel.length,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return productslitsItems(orderModel[index]);
      },
    );
  }

  Widget productslitsItems(ProductLists productLists) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.all(2),
      onTap: () {},
      title: new Text(
        productLists.productName ?? '',
        style: Theme.of(context).textTheme.productnameText,
      ),
      subtitle: Padding(
        padding: EdgeInsets.all(1),
        child: new Text(
          "Qty :" + "${productLists.numOfItems}",
        ),
      ),
      leading: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 44,
          maxHeight: 44,
        ),
        child: Image.network(
          Config.imageurl + (productLists.productCode ?? '') + '.png',
          fit: BoxFit.fill,
        ),
      ),
      trailing: new Text(
        "${productLists.price}",
        style: Theme.of(context).textTheme.labelText,
      ),
    );
  }

  Widget itemsTotal(String label, String value, {TextStyle? textStyle}) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity(
        horizontal: 0,
        vertical: -4,
      ),
      contentPadding: EdgeInsets.fromLTRB(2, -10, 2, -10),
      title: new Text(
        label,
        style: Theme.of(context).textTheme.labelHeading,
      ),
      trailing: new Text(
        "$value",
        style: Theme.of(context).textTheme.labelText,
      ),
    );
  }
}

extension CustomStyles on TextTheme {
  TextStyle get labelHeading {
    return TextStyle(
        fontSize: 16, color: Colors.redAccent, fontWeight: FontWeight.bold);
  }

  TextStyle get labelText {
    return TextStyle(
        fontSize: 16, color: Colors.green[900], fontWeight: FontWeight.bold);
  }

  TextStyle get productnameText {
    return TextStyle(
        fontSize: 14, color: Colors.green[900], fontWeight: FontWeight.bold);
  }
  // Widget build(BuildContext context) {
  //   print("data comming>>>>>>>>>>>>");
  //   print(this.widget.orderId);
  //   print("data comming>>>>>>>>>>>>");
  //   return Scaffold(
  //       appBar: AppBar(
  //     title: Text("Order Details"),
  //     centerTitle: true,
  //     brightness: Brightness.dark,
  //     elevation: 0,
  //     backgroundColor: Colors.green[900],
  //     automaticallyImplyLeading: false,
  //     leading: IconButton(
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //       icon: Icon(
  //         Icons.arrow_back_ios,
  //         color: Colors.white,
  //       ),
  //     ),
  //   ));
  // }
}

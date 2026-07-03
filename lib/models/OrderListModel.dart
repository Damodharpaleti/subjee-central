class OrderListModel {
  int? orderId;
  String? orderUserId;
  String? orderNumber;
  String? orderInvoiceNumber;
  String? orderStatus;
  int? orderFullPrice;
  String? orderDate;
  String? orderType;
  String? address;
  String? timeslot;
  dynamic agentName;
  String? deliveryPartner;
  String? pincode;
  int? deliveryCharges;

  OrderListModel(
      {required this.orderId,
      required this.orderUserId,
      required this.orderNumber,
      required this.orderInvoiceNumber,
      required this.orderStatus,
      required this.orderFullPrice,
      required this.orderDate,
      required this.orderType,
      required this.address,
      required this.timeslot,
      this.agentName,
      required this.deliveryPartner,
      required this.pincode,
      required this.deliveryCharges});

  OrderListModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderUserId = json['orderUserId'];
    orderNumber = json['orderNumber'];
    orderInvoiceNumber = json['orderInvoiceNumber'];
    orderStatus = json['orderStatus'];
    orderFullPrice = json['orderFullPrice'];
    orderDate = json['orderDate'];
    orderType = json['orderType'];
    address = json['address'];
    timeslot = json['timeslot'];
    agentName = json['agentName'];
    deliveryPartner = json['deliveryPartner'];
    pincode = json['pincode'];
    deliveryCharges = json['deliveryCharges'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['orderUserId'] = this.orderUserId;
    data['orderNumber'] = this.orderNumber;
    data['orderInvoiceNumber'] = this.orderInvoiceNumber;
    data['orderStatus'] = this.orderStatus;
    data['orderFullPrice'] = this.orderFullPrice;
    data['orderDate'] = this.orderDate;
    data['orderType'] = this.orderType;
    data['address'] = this.address;
    data['timeslot'] = this.timeslot;
    data['agentName'] = this.agentName;
    data['deliveryPartner'] = this.deliveryPartner;
    data['pincode'] = this.pincode;
    data['deliveryCharges'] = this.deliveryCharges;
    return data;
  }
}



// class OrderListModel {
//   OrderListModel({
//     this.orderId,
//     this.orderUserId,
//     this.orderNumber,
//     this.orderInvoiceNumber,
//     this.orderStatus,
//     this.orderFullPrice,
//     this.orderdate,
//     this.orderType,
//     this.address,
//     this.timeslot,
//     this.deliveryCharges,
//   });

//   int orderId;
//   String orderUserId;
//   String orderNumber;
//   String orderInvoiceNumber;
//   String orderStatus;
//   int orderFullPrice;
//   String orderdate;
//   String orderType;
//   String address;
//   String timeslot;
//   int deliveryCharges;

//   OrderListModel.fromJson(Map<String, dynamic> json) {
//     orderId = json["orderId"];
//     orderUserId = json["orderUserId"];
//     orderNumber = json["orderNumber"];
//     orderInvoiceNumber = json["orderInvoiceNumber"];
//     orderStatus = json["orderStatus"];
//     orderFullPrice = json["orderFullPrice"];
//     orderdate = json["orderDate"];
//     orderType = json["orderType"];
//     address = json["address"];

//     timeslot = json["timeslot"];

//     deliveryCharges = json["deliveryCharges"];
//   }

//   Map<String, dynamic> toJson() => {
//         "orderId": orderId,
//         "orderUserId": orderUserId,
//         "orderNumber": orderNumber,
//         "orderInvoiceNumber": orderInvoiceNumber,
//         "orderStatus": orderStatus,
//         "orderFullPrice": orderFullPrice,
//         "orderdate": orderdate,
//         "orderType": orderType,
//         "address": address,
//         "timeslot": timeslot,
//         "deliveryCharges": deliveryCharges,
//       };
// }

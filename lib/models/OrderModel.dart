class OrderModel {
  OrderModel({
    this.orderId,
    this.invoiceNumber,
    this.totalprice,
    this.invoiceStatus,
    this.deliveryTime,
    this.address,
    this.orderdate,
    this.mobile,
    this.productList,
    this.paymentMethod,
    this.deliveryCharges,
  });

  int? orderId;
  String? invoiceNumber;
  double? totalprice;
  String? invoiceStatus;
  String? deliveryTime;
  String? address;
  String? orderdate;
  String? mobile;
  String? paymentMethod;
  List<ProductLists>? productList;
  int? deliveryCharges;

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json["orderId"];
    invoiceNumber = json["invoiceNumber"];
    totalprice = double.parse(json["totalprice"]);
    invoiceStatus = json["invoiceStatus"];
    deliveryTime = json["deliveryTime"];
    address = json["address"];
    orderdate = json["orderdate"];
    mobile = json["mobile"];
    paymentMethod = json["paymentMethod"];
    deliveryCharges = json["deliveryCharges"];
    productList = List<ProductLists>.from(
        json["productList"].map((x) => ProductLists.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "invoiceNumber": invoiceNumber,
        "totalprice": totalprice,
        "invoiceStatus": invoiceStatus,
        "deliveryTime": deliveryTime,
        "address": address,
        "orderdate": orderdate,
        "mobile": mobile,
        "paymentMethod": paymentMethod,
        "deliveryCharges": deliveryCharges,
        "productList": productList != null ? List<dynamic>.from(productList!.map((x) => x.toJson())) : null,
      };
}

class ProductLists {
  ProductLists({
    this.productId,
    this.productCode,
    this.productName,
    this.price,
    this.marketPrice,
    this.priceMinQuantity,
    this.brandname,
    this.priceId,
    this.cityId,
    this.numOfItems,
    this.totalPrice,
  });

  int? productId;
  String? productCode;
  String? productName;
  String? price;
  String? marketPrice;
  int? priceMinQuantity;
  String? brandname;
  int? priceId;
  int? cityId;
  int? numOfItems;
  String? totalPrice;

  ProductLists.fromJson(Map<String, dynamic> json) {
    productId = json["productId"];
    productCode = json["productCode"];
    productName = json["productName"];
    price = json["price"];
    marketPrice = json["marketPrice"];
    priceMinQuantity = json["priceMinQuantity"];
    brandname = json["brandname"];
    priceId = json["priceId"];
    cityId = json["cityId"];
    numOfItems = json["numOfItems"];
    totalPrice = json["totalPrice"];
  }

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productCode": productCode,
        "productName": productName,
        "price": price,
        "marketPrice": marketPrice,
        "priceMinQuantity": priceMinQuantity,
        "brandname": brandname,
        "priceId": priceId,
        "cityId": cityId,
        "numOfItems": numOfItems,
        "totalPrice": totalPrice,
      };
}

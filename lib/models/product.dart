class Product {
  int? productId;
  String? productCode;
  String? productName;
  String? price;
  String? marketPrice;
  int? priceMinQuantity;
  String? brandname;
  int? priceId;
  int? cityId;
  String? quantity;
  int? cId;
  String? productDescription;

  Product(
    this.productId,
    this.productCode,
    this.productName,
    this.price,
    this.marketPrice,
    this.priceMinQuantity,
    this.brandname,
    this.priceId,
    this.cityId,
    this.quantity,
    this.cId,
    this.productDescription,
  );

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productCode = json['productCode'];
    productName = json['productName'];
    price = json['price'].toString();
    marketPrice = json['marketPrice'].toString();
    priceMinQuantity = json['priceMinQuantity'];
    brandname = json['brandname'];
    priceId = json['priceId'];
    cityId = json['cityId'];
    quantity = json['quantity'];
    cId = json["cId"];
    productDescription = json['productDescription'];
  }
  calculateDiscount() {
    double regularprice = double.parse(this.marketPrice ?? "0");
    double salePrice =
        this.price != null && this.price != "" ? double.parse(this.price!) : regularprice;
    double discount = regularprice - salePrice;
    double disPersent = (discount / regularprice) * 100;
    return disPersent.round();
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productCode': productCode,
      'productName': productName,
      'price': price,
      'marketPrice': marketPrice,
      'priceMinQuantity': priceMinQuantity,
      'brandname': brandname,
      'priceId': priceId,
      'cityId': cityId,
      'quantity': quantity,
      'cId': cId,
      'productDescription': productDescription,
    };
  }
}

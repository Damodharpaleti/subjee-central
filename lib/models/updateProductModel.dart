class updateProductModel {
  updateProductModel(
      {this.productId,
      this.productname,
      this.productdescription,
      this.productvendor,
      this.productcode,
      this.productweight,
      this.productweightunit,
      this.categoryid,
      this.priceminquantity,
      this.pricevalue,
      this.marketprice,
      this.brandName,
      this.cityId,
      this.active,
      this.cityName,
      this.productTitle});

  int? productId;
  String? productname;
  String? productdescription;
  String? productvendor;
  String? productcode;
  String? productweight;
  String? productweightunit;
  int? categoryid;
  int? priceminquantity;
  double? pricevalue;
  double? marketprice;
  String? brandName;
  int? cityId;
  String? active;
  String? cityName;
  String? productTitle;

  factory updateProductModel.fromJson(Map<String, dynamic> json) =>
      updateProductModel(
        productId: json["productId"],
        productname: json["product_name"],
        productdescription: json["product_description"],
        productvendor: json["product_vendor"],
        productcode: json["product_code"],
        productweight: json["product_weight"],
        productweightunit: json["product_weight_unit"],
        categoryid: json["category_id"],
        priceminquantity: json["price_min_quantity"],
        pricevalue: json["price_value"],
        marketprice: json["market_price"],
        brandName: json["brandName"],
        cityId: json["cityId"],
        active: json["active"],
        cityName: json["city_Name"],
        productTitle: json["productTitle"],
      );

  // Map<String, dynamic> toJson() {
  //   Map<String, dynamic> updatejson = {};
  //   updatejson.addAll({
  //     "productId": productId,
  //     "productname": productname,
  //     "productdescription": productdescription,
  //     "productvendor": productvendor,
  //     "productcode": productcode,
  //     "productweight": productweight,
  //     "productweightunit": productweightunit,
  //     "categoryid": categoryid,
  //     "priceminquantity": priceminquantity,
  //     "pricevalue": pricevalue,
  //     "marketprice": marketprice,
  //     "brandName": brandName,
  //     "cityId": cityId,
  //     "active": active,
  //     "cityName": cityName,
  //     "productTitle": productTitle,
  //   });
  //   return updatejson;
  // }

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "product_name": productname,
        "product_description": productdescription,
        "product_vendor": productvendor,
        "product_code": productcode,
        "product_weight": productweight,
        "product_weight_unit": productweightunit,
        "category_id": categoryid,
        "price_min_quantity": priceminquantity,
        "price_value": pricevalue,
        "market_price": marketprice,
        "brandName": brandName,
        "cityId": cityId,
        "active": active,
        "city_Name": cityName,
        "productTitle": productTitle,
      };
}

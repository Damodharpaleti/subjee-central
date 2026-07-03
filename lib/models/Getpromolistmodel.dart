class Getpromolistmodel {
  Getpromolistmodel({
    required this.promocode,
    this.startdate,
    this.enddate,
    this.minAmount,
    this.percentage,
    this.maxdiscount,
    this.peruserLimit,
    this.cityList,
    this.pincodeList,
  });

  String promocode;
  String? startdate;
  String? enddate;
  int? minAmount;
  int? percentage;
  int? maxdiscount;
  int? peruserLimit;
  List<CityList>? cityList;
  List<PincodeList>? pincodeList;

  factory Getpromolistmodel.fromJson(Map<String, dynamic> json) =>
      Getpromolistmodel(
        promocode: json["promocode"],
        startdate: json["startdate"],
        enddate: json["enddate"],
        minAmount: json["minAmount"],
        percentage: json["percentage"],
        maxdiscount: json["maxdiscount"],
        peruserLimit: json["peruserLimit"],
        cityList: List<CityList>.from(
            json["cityList"].map((x) => CityList.fromJson(x))),
        pincodeList: List<PincodeList>.from(
            json["pincodeList"].map((x) => PincodeList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "promocode": promocode,
        "startdate": startdate,
        "enddate": enddate,
        "minAmount": minAmount,
        "percentage": percentage,
        "maxdiscount": maxdiscount,
        "peruserLimit": peruserLimit,
        "cityList": cityList != null ? List<dynamic>.from(cityList!.map((x) => x.toJson())) : null,
        "pincodeList": pincodeList != null ? List<dynamic>.from(pincodeList!.map((x) => x.toJson())) : null,
      };
}

class CityList {
  CityList({
    this.cityName,
  });

  String? cityName;

  factory CityList.fromJson(Map<String, dynamic> json) => CityList(
        cityName: json["cityName"],
      );

  Map<String, dynamic> toJson() => {
        "cityName": cityName,
      };
}

class PincodeList {
  PincodeList({
    this.pincode,
  });

  int? pincode;

  factory PincodeList.fromJson(Map<String, dynamic> json) => PincodeList(
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "pincode": pincode,
      };
}

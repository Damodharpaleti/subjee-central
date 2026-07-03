class CityListModel {
  CityListModel({
    required this.id,
    required this.cityName,
    required this.cityCode,
  });

  int id;
  String cityName;
  int cityCode;

  factory CityListModel.fromJson(Map<String, dynamic> json) => CityListModel(
        id: json["id"],
        cityName: json["cityName"],
        cityCode: json["cityCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cityName": cityName,
        "cityCode": cityCode,
      };
}

import 'package:subjeecentral/models/Address.dart';

class LocalloginResponse {
  String? name;

  String? location;

  String? mobileNumber;
  Address? address;
  String? token;

  LocalloginResponse({
    this.name,
    this.location,
    this.mobileNumber,
    this.address,
    this.token,
  });

  LocalloginResponse.fromJson(Map<String, dynamic> json) {
    location = json["location"];
    name = json["name"];
    mobileNumber = json["mobileNumber"];

    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }

    data['location'] = this.location;
    data['name'] = this.name;
    data['mobileNumber'] = this.mobileNumber;

    data['token'] = this.token;
    return data;
  }

  @override
  String toString() {
    return '"LocalloginResponse" : {"name": $name,"mobileNumber": $mobileNumber,${address.toString()}, "token": $token}';
  }
}

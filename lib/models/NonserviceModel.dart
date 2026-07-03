class GetNonserviceModel {
  int? id;
  String? pincode;
  String? address;
  String? mobileNumber;
  String? customerName;

  GetNonserviceModel(
      {required this.id,
      required this.pincode,
      required this.address,
      required this.mobileNumber,
      required this.customerName});

  GetNonserviceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pincode = json['pincode'];
    address = json['address'];
    mobileNumber = json['mobileNumber'];
    customerName = json['customerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pincode'] = this.pincode;
    data['address'] = this.address;
    data['mobileNumber'] = this.mobileNumber;
    data['customerName'] = this.customerName;
    return data;
  }
}

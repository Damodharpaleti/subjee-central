class DeliverPartnerModel {
  late int id;
  late String postalCode;
  late String vendorName;
  late int subjeepartnerId;
  late bool isactive;
  late bool userStatus;
  late DateTime createdOn;
  late String mobileNumber;
  late String email;
  late String address1;
  late String address2;
  late DateTime updatedOn;

  DeliverPartnerModel(
      {required this.id,
      required this.subjeepartnerId,
      required this.createdOn,
      required this.isactive,
      required this.mobileNumber,
      required this.postalCode,
      required this.updatedOn,
      required this.vendorName,
      required this.userStatus,
      required this.email,
      required this.address1,
      required this.address2});

  DeliverPartnerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjeepartnerId = json['subjeepartnerId'];
    createdOn = json['createdOn'];
    isactive = json['isactive'];
    mobileNumber = json['mobile_Number'];
    postalCode = json['postalCode'];
    updatedOn = json['updatedOn'];
    vendorName = json['vendor_Name'];
    userStatus = json['userStatus'];
    email = json['email'];
    address1 = json['address1'];
    address2 = json['address2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subjeepartnerId'] = this.subjeepartnerId;
    data['createdOn'] = this.createdOn;
    data['isactive'] = this.isactive;
    data['mobile_Number'] = this.mobileNumber;
    data['postalCode'] = this.postalCode;
    data['updatedOn'] = this.updatedOn;
    data['vendor_Name'] = this.vendorName;
    data['userStatus'] = this.userStatus;
    data['email'] = this.email;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    return data;
  }
}

class PincodeModel {
  int? id;
  String? postalcode;
  String? mobileNumber;
  String? vendorName;
  int? partnerId;
  int? userStatus;
  String? address1;
  String? address2;
  String? email;

  PincodeModel(
      {this.id,
      this.postalcode,
      this.mobileNumber,
      this.vendorName,
      this.partnerId,
      this.userStatus,
      this.email,
      this.address1,
      this.address2});

  PincodeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postalcode = json['postalcode'];
    mobileNumber = json['mobileNumber'];
    vendorName = json['vendorName'];
    partnerId = json['partnerId'];
    userStatus = json['userStatus'];
    address1 = json['address1'];
    address2 = json['address2'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['postalcode'] = this.postalcode;
    data['mobileNumber'] = this.mobileNumber;
    data['vendorName'] = this.vendorName;
    data['partnerId'] = this.partnerId;
    data['userStatus'] = this.userStatus;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['email'] = this.email;
    return data;
  }
}

// class PincodeModel {
//   int id;
//   String postalcode;
//   String mobileNumber;
//   String vendorName;
//   int partnerId;
//   bool userStatus;

//   PincodeModel(
//       {this.id,
//       this.postalcode,
//       this.mobileNumber,
//       this.vendorName,
//       this.partnerId,
//       this.userStatus});

//   PincodeModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     postalcode = json['postalcode'];
//     mobileNumber = json['mobileNumber'];
//     vendorName = json['vendorName'];
//     partnerId = json['partnerId'];
//     userStatus = json['userStatus'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['postalcode'] = this.postalcode;
//     data['mobileNumber'] = this.mobileNumber;
//     data['vendorName'] = this.vendorName;
//     data['partnerId'] = this.partnerId;
//     data['userStatus'] = this.userStatus;
//     return data;
//   }
// }

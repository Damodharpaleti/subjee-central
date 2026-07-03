class AddTransporterModel {
  late String mobileNumber;
  late String emailId;
  late String firstName;
  late String lastName;
  late String location;
  late String address;
  late String transportName;
  late String state;
  late String pinCode;

  AddTransporterModel(
      {required this.mobileNumber,
      required this.emailId,
      required this.firstName,
      required this.lastName,
      required this.location,
      required this.address,
      required this.transportName,
      required this.state,
      required this.pinCode});

  AddTransporterModel.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
    emailId = json['emailId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    location = json['location'];
    address = json['address'];
    transportName = json['transportName'];
    state = json['state'];
    pinCode = json['pinCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this.mobileNumber;
    data['emailId'] = this.emailId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['location'] = this.location;
    data['address'] = this.address;
    data['transportName'] = this.transportName;
    data['state'] = this.state;
    data['pinCode'] = this.pinCode;
    return data;
  }
}

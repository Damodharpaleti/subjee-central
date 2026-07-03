class Address {
  late String address1;
  late String address2;
  late String city;
  late String pinCode;
  late String state;

  Address({
    required this.address1,
    required this.address2,
    required this.city,
    required this.pinCode,
    required this.state,
  });

  Address.fromJson(Map<String, dynamic> json) {
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    pinCode = json['pinCode'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['pinCode'] = this.pinCode;
    data['state'] = this.state;
    return data;
  }

  @override
  String toString() {
    return '"Address" : { "address1": $address1, "address2": $address2, "city": $city,"pinCode": $pinCode,"state": $state}';
  }

  // factory Address.fromJson(Map<String, dynamic> json) => Address(
  //       address1: json["address1"],
  //       address2: json["address2"],
  //       city: json["city"],
  //       pinCode: json["pinCode"].toString(),
  //       state: json["state"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "address1": address1,
  //       "address2": address2,
  //       "city": city,
  //       "pinCode": pinCode,
  //       "state": state,
  //     };
}

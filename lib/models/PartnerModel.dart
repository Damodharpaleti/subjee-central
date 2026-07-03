class PartnerModel {
  int? id;
  String? city;
  String? partnerAccountnumber;
  String? mobileNumber;
  String? partnerName;

  PartnerModel(
      {this.id,
      this.city,
      this.partnerAccountnumber,
      this.mobileNumber,
      this.partnerName});

  PartnerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    partnerAccountnumber = json['partnerAccountnumber'];
    mobileNumber = json['mobileNumber'];
    partnerName = json['partnerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // Only include id if it's not null and not 0 (for new partners, id should not be sent)
    if (this.id != null && this.id != 0) {
      data['id'] = this.id;
    }
    data['city'] = this.city;
    data['partnerAccountnumber'] = this.partnerAccountnumber;
    data['mobileNumber'] = this.mobileNumber;
    data['partnerName'] = this.partnerName;
    return data;
  }
}

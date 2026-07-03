class FeedbackModel {
  late String issueType;
  late String orderId;
  late String status;
  late String userComments;
  late String userMobNumber;

  FeedbackModel(
      {required this.issueType,
      required this.orderId,
      required this.status,
      required this.userComments,
      required this.userMobNumber});

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    issueType = json['issueType'];
    orderId = json['orderId'];
    status = json['status'];
    userComments = json['userComments'];
    userMobNumber = json['userMobNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['issueType'] = this.issueType;
    data['orderId'] = this.orderId;
    data['status'] = this.status;
    data['userComments'] = this.userComments;
    data['userMobNumber'] = this.userMobNumber;
    return data;
  }
}

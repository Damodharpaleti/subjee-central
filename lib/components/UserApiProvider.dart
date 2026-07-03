import 'dart:io';

import 'package:dio/dio.dart';
import 'package:subjeecentral/Config.dart';
import 'package:subjeecentral/models/FeedbackModel.dart';
import 'package:subjeecentral/models/NonserviceModel.dart';
import 'package:subjeecentral/models/OrderListModel.dart';
import 'package:subjeecentral/models/OrderModel.dart';
import 'package:subjeecentral/models/PartnerModel.dart';

class UserApiProvider {
  Future<List<OrderListModel>> getOrder(String status) async {
    List<OrderListModel> data = <OrderListModel>[];
    print("calling Step 1>>>>>>");

    try {
      String url = Config.url + Config.getOrders + "?status=$status";

      var response = await Dio().get(url,
          options: new Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
      if (response.statusCode == 200) {
        print("new one>>");
        data = (response.data as List)
            .map((i) => OrderListModel.fromJson(i))
            .toList();
        print("data>>>>>>>>>");
        print(data);
      }
    } on DioException catch (e) {
      print("no new one");
      print(e.response);
    }

    return data;
  }

  Future<List<OrderModel>> getOrderDetais(int orderId) async {
    List<OrderModel> data = <OrderModel>[];
    print("calling Step 1>>>>>>");
    print("geeting order id");
    print(orderId);

    try {
      // String url =
      //     "http://44.192.46.200:8083/subjeeCentralService/orders/v1/getOrderDetails?orderId=2332";
      String url = Config.url + Config.getOrderDetails + "?orderId=$orderId";
      var response = await Dio().get(url,
          options: new Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
      if (response.statusCode == 200) {
        print("new two>>");
        data =
            (response.data as List).map((i) => OrderModel.fromJson(i)).toList();
        print("data 2>>>>>>>>>");
        print(data);
      }
    } on DioException catch (e) {
      print("no new one");
      print(e.response);
    }

    return data;
  }

  Future<List<PartnerModel>> getPartnersList() async {
    List<PartnerModel> data = <PartnerModel>[];
    print("calling Step 1>>>>>>");

    try {
      String url = Config.url + Config.getPartnersList;

      var response = await Dio().get(url,
          options: new Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
      if (response.statusCode == 200) {
        print("new one>>");
        data = (response.data as List)
            .map((i) => PartnerModel.fromJson(i))
            .toList();
        print("data>>>>>>>>>");
        print(data);
      }
    } on DioException catch (e) {
      print("no new one");
      print(e.response);
    }

    return data;
  }

  Future<List<GetNonserviceModel>> getNonServicePincodeslist() async {
    List<GetNonserviceModel> data = <GetNonserviceModel>[];
    print("calling Step 1>>>>>>");

    try {
      String url = Config.url + Config.getPartnersList;

      var response = await Dio().get(url,
          options: new Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
      if (response.statusCode == 200) {
        print("new one>>");
        data = (response.data as List)
            .map((i) => GetNonserviceModel.fromJson(i))
            .toList();
        print("data>>>>>>>>>");
        print(data);
      }
    } on DioException catch (e) {
      print("no new one");
      print(e.response);
    }

    return data;
  }

  Future<List<FeedbackModel>> getUserFeedBack() async {
    List<FeedbackModel> data = <FeedbackModel>[];
    print("calling Step 1>>>>>>");

    try {
      String url = Config.url + Config.UserFeedback;

      var response = await Dio().get(url,
          options: new Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
      if (response.statusCode == 200) {
        print("new one>>");
        data = (response.data as List)
            .map((i) => FeedbackModel.fromJson(i))
            .toList();
        print("data>>>>>>>>>");
        print(data);
      }
    } on DioException catch (e) {
      print("no new one");
      print(e.response);
    }

    return data;
  }

  Future<List<FeedbackModel>> getUserFeedBackBySearch(String OrderId) async {
    List<FeedbackModel> data = <FeedbackModel>[];
    print("calling Step 31>>>>>>");

    try {
      String url = Config.url + Config.SearchuserFeedback + "?orderId=$OrderId";
      print(url);
      var response = await Dio().get(url,
          options: new Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
      if (response.statusCode == 200) {
        print("new one>>");
        data = (response.data as List)
            .map((i) => FeedbackModel.fromJson(i))
            .toList();
        print("data>>>>>>>>>");
        print(data);
      }
    } on DioException catch (e) {
      print("no new one");
      print(e.response);
    }

    return data;
  }
}

import 'package:flutter/material.dart';
import 'package:subjeecentral/api_service.dart';
import 'package:subjeecentral/models/OrderListModel.dart';

class OrderProvider with ChangeNotifier {
  late APIService apiService;
  late List<OrderListModel> _orderList;
  List<OrderListModel> get allOrders => _orderList;
  fetchOrders() async {
    //String customerId = mobileNumber;
    //String tokens = token;
    List<OrderListModel> orderList = await apiService.getOrders("c");

    if (_orderList.isEmpty) {
      _orderList = [];
    }
    if (orderList.length > 0) {
      _orderList = [];
      _orderList.addAll(orderList);
    }
    notifyListeners();
  }
}

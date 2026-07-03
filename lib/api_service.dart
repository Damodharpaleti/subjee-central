// ignore_for_file: missing_return

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subjeecentral/Config.dart';
import 'package:subjeecentral/models/AddTransporterModel.dart';
import 'package:subjeecentral/models/Getpromolistmodel.dart';
import 'package:subjeecentral/models/LocalLoinresponse.dart';
import 'package:subjeecentral/models/LoginRespose.dart';
import 'package:subjeecentral/models/NonserviceModel.dart';
import 'package:subjeecentral/models/OrderListModel.dart';
import 'package:subjeecentral/models/updateProductModel.dart';

import 'models/PartnerModel.dart';
import 'models/PincodeModel.dart';
import 'models/product.dart';
import 'models/serverresponse.dart';

class APIService {
  late String token;
  Future<void> saveUserInfo(name, mobileNumber, address1, address2, city,
      pincode, state, rolename, token) async {
    final LocalloginResponse localresponse = LocalloginResponse.fromJson({
      "name": name,
      "mobileNumber": mobileNumber,
      'address': {
        'address1': address1,
        'address2': address2,
        'city': city,
        'pinCode': pincode,
        'state': state,
      },
      "roleDetails": [
        {
          "name": rolename,
        }
      ],
      'token': token
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result =
        await prefs.setString('localresponse', jsonEncode(localresponse));
    print(result);
    if (localresponse.mobileNumber != null) {
      prefs.setString("loginmobileNumber", localresponse.mobileNumber!);
    }
  }

  bool loginFlag = false;
  Future<LoginResponse> login(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    late LoginResponse model;
    String url = Config.loginUrl + Config.login;
    try {
      final response = await Dio().post(
        url,
        data: {
          "username": username,
          "acessCode": password,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        model = LoginResponse.fromJson(response.data);
        if (model.roleDetails == null || model.roleDetails!.length == 0) {
          prefs.setString("ROLE", "Role not assigned");
        } else {
          if (model.roleDetails![0].name != null) {
            prefs.setString("ROLE", model.roleDetails![0].name!);
          }
          if (model.address != null && model.address!.address1 != null) {
            saveUserInfo(
                model.name,
                model.mobileNumber,
                model.address!.address1,
                model.address!.address2,
                model.address!.city,
                model.address!.pinCode,
                model.address!.state,
                model.roleDetails![0].name,
                model.token);
          }
          if (model.roleDetails![0].name != null) {
            print(model.roleDetails![0].name);
          }
        }
      } else {
        model = LoginResponse();
        prefs.setString("ROLE", "Role not assigned");
      }
    } on DioException catch (e) {
      print(e.message);
      model = LoginResponse();
      model.statusCode = 400;
    }
    return model;
  }
  //     if (response.statusCode == 200) {
  //       loginFlag = true;
  //       model = LoginResponse.fromJson(response.data);
  //       token = model.token;
  //       globals.username = model.name;
  //       // sideMenuDrawer.setUserDetails(model.firstName, model.emailId);
  //       saveUserInfo(
  //           model.name,
  //           model.mobileNumber,
  //           // model.telephoneNumber,
  //           // model.resetPassword,
  //           model.address.address1,
  //           model.address.address2,
  //           model.address.city,
  //           model.address.pinCode,
  //           model.address.state,
  //           model.roleDetails[0].name,
  //           model.token);

  //       // LoginState().SaveLocalResponse(
  //       //     model.company,
  //       //     model.emailId,
  //       //     model.employeeId,
  //       //     model.firstName,
  //       //     model.lastName,
  //       //     model.location,
  //       //     model.middleName,
  //       //     model.mobileNumber,
  //       //     model.telephoneNumber,
  //       //     model.resetPassword,
  //       //     model.address.toString(),
  //       //     model.token);
  //       prefs.setString('ROLE', model.roleDetails[0].name);
  //       print(response.data);
  //       print(">>>>>>>>>>>>>>>>>>>Login response");
  //       print(model.address.address1);
  //       print(model.address.address2);
  //       print(model.address.city);
  //       print(model.address.pinCode);
  //       print(model.roleDetails[0].name);
  //       print(">>>>>>>>>>>>>>>>>>>Login response");
  //       print(model.token);
  //     }
  //   } on DioError catch (e) {
  //     loginFlag = false;
  //     print(e.message);
  //   }
  //   return model;
  // }

  Future<LoginResponse> Otplogin(String username, String accessCode) async {
    late LoginResponse model;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String url = Config.loginUrl + Config.login;
    try {
      final response = await Dio().post(
        url,
        data: {"username": username, "acessCode": accessCode},
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        model = LoginResponse.fromJson(response.data);
        if (model.roleDetails == null || model.roleDetails!.isEmpty) {
          print("role name>>>>>>>>> Role not assigned");
          prefs.setString("ROLE", "Role not assigned");
          // globals.role = prefs.getString("ROLE");
        } else {
          if (model.roleDetails![0].name != null) {
            prefs.setString("ROLE", model.roleDetails![0].name!);
            print("role+++++" + model.roleDetails![0].name!);
          }
          // globals.role = model.roleDetails[0].name;
        }
      } else {
        model = LoginResponse();
        prefs.setString("ROLE", "Role not assigned");
      }
    } on DioException catch (e) {
      print(e.message);
      model = LoginResponse();
      model.statusCode = 400;
    }
    return model;
  }

  Future<bool> loginOTP(String mobileNumber) async {
    bool ret = false;
    String url = Config.loginUrl + Config.loginOtp;
    print(url);
    print(mobileNumber);
    try {
      final response = await Dio().post(
        url,
        data: {
          "mobileNumber": mobileNumber,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioException {
      ret = false;
    }
    return ret;
  }

  Future<List<OrderListModel>> getOrders(String status) async {
    List<OrderListModel> data = <OrderListModel>[];
    print("calling Step 1>>>>>>");

    try {
      String url = Config.url + Config.getOrders + "?status=$status";
      // String url =
      //     "http://44.192.46.200:8083/subjeeCentralService/orders/v1/getOrdersList?status=C";
      print("Location hardcode>>>>>>>>>");
      // print(Location.replaceAll('"', ""));
      print("Location hardcode>>>>>>>>>");
      var response = await Dio().get(url,
          options: new Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
      if (response.statusCode == 200) {
        print("new one Api>>");
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

  Future<List<GetNonserviceModel>> getNonservicepincodes() async {
    List<GetNonserviceModel> data = <GetNonserviceModel>[];
    print("calling Step 1>>>>>>");

    try {
      String url = Config.url + Config.getnonservicelist;
      // String url =
      //     "http://44.192.46.200:8083/subjeeCentralService/orders/v1/getOrdersList?status=C";
      print("Location hardcode>>>>>>>>>");
      // print(Location.replaceAll('"', ""));
      print("Location hardcode>>>>>>>>>");
      var response = await Dio().get(url,
          options: new Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
      if (response.statusCode == 200) {
        print("new one Api>>");
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

  Future<List<OrderListModel>> getTopsavingProduct() async {
    List<OrderListModel> data = <OrderListModel>[];
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String Location = prefs.getString('localCity');
    // String newLocation = Location.replaceAll('"', "");
    // print("@@@@@@@@@@@@@@@@@@@@@@ " + Location);
    // if (newLocation == null || newLocation.contains('Mountain View')) {
    //   newLocation = 'Bengaluru';
    // }
    try {
      // String url =
      //     Config.url + Config.topSaving + "?cId=$cId&cityName=$newLocation";
      String url =
          "http://44.192.46.200:8083/subjeeCentralService/orders/v1/getOrdersList?status=C";
      print("Location hardcode>>>>>>>>>");
      // print(Location.replaceAll('"', ""));
      print("Location hardcode>>>>>>>>>");
      var response = await Dio().get(url,
          options: new Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
      if (response.statusCode == 200) {
        print("new one>>");
        data = (response.data as List)
            .map((i) => OrderListModel.fromJson(i))
            .toList();
      }
    } on DioException catch (e) {
      print("no new one");
      print(e.response);
    }

    return data;
  }

  // Future<List<Product>> getProduct(
  //     {int cId,
  //     int pageNumber,
  //     int pageSize,
  //     String strSearch,
  //     String sortBy,
  //     String sortOrder = "asc"}) async {
  //   List<Product> data = new List<Product>();

  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String Location = prefs.getString('localCity');
  //   String newLocation = Location.replaceAll('"', "");

  //   if (newLocation == null || newLocation.contains('Mountain View')) {
  //     newLocation = 'Bengaluru';
  //   }
  //   try {
  //     String parameter = "";
  //     if (strSearch != null) {
  //       parameter += "&search=$strSearch";
  //     }
  //     if (pageSize != null) {
  //       parameter += "&pageSize=$pageSize";
  //     }
  //     if (pageNumber != null) {
  //       parameter += "&pageNumber=$pageNumber";
  //     }
  //     if (sortBy != null) {
  //       parameter += "&sortBy=$sortBy";
  //     }
  //     if (sortOrder != null) {
  //       parameter += "&order=$sortOrder";
  //     }
  //     // String url = Config.url +
  //     //     Config.product +
  //     //     "?cId=$cId&search=&cityName=$newLocation";
  //     String url = Config.url + Config.product;
  //     var response = await Dio().get(url,
  //         options: new Options(
  //             headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
  //     if (response.statusCode == 200) {
  //       data = (response.data as List).map((i) => Product.fromJson(i)).toList();
  //       // print(response.data);
  //     }
  //   } on DioError catch (e) {
  //     print(e.response);
  //   }

  //   return data;
  // }
  //////////////////////////////////////////////
  Future<List<Product>> getProduct(
      {int? cId,
      int? pageNumber,
      int? pageSize,
      String? strSearch,
      String? sortBy,
      String? cityname,
      String sortOrder = "asc"}) async {
    List<Product> data = <Product>[];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? locationTemp = prefs.getString('localCity');
    String Location = locationTemp ?? 'Bengaluru';
    String newLocation = Location.replaceAll('"', "");
    //  print("@@@@@@@@@@@@@@@@@@@@@@ " + Location);
    if (newLocation.contains('Mountain View')) {
      newLocation = 'Bengaluru';
    }
    try {
      // Note: parameter variable commented as URL is hardcoded
      // if (strSearch != null) {
      //   parameter += "&search=$strSearch";
      // }
      // etc...
      String url =
          "http://44.192.46.200:8083/subjeeCentralService/product/v1/getProductByDetails?cId=1&search=&cityName=Bengaluru";

      // String url = Config.url +
      //     Config.product +
      //     "?cId=$cId&search=&cityName=$newLocation";
      print(">>>>>>>>>>>>>>>>>>>>>>>>url>>");
      print(url);
      // String url =
      //     "http://44.192.46.200:8083/subjeeCentralService/product/v1/getProductByDetails?cId=$cId&search=&cityName=Bengaluru";
      var response = await Dio().get(url,
          options: new Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
      if (response.statusCode == 200) {
        data = (response.data as List).map((i) => Product.fromJson(i)).toList();
        // print(response.data);
      }
    } on DioException catch (e) {
      print(e.response);
    }

    return data;
  }
  /////////////////////////////////////////////

//   Future<List<Product>> getProduct(String city) async {
//     List<Product> data = new List<Product>();

//     if (city == null || city.isEmpty) {
//       city = 'Bengaluru';
//     }
//     print("calling Step 100>>>>>>");
// //Bengaluru
//     try {
//       // String url = Config.url + Config.getOrders + "?status=$status";
//       String url = Config.url + Config.product + "=$city";
//       print(">>>>>>>>>>>>>>>>>>");
//       print(url);
//       print(">>>>>>>>>>>>>>>>>>");
//       var response = await Dio().get(url,
//           options: new Options(
//               headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
//       if (response.statusCode == 200) {
//         print("new one>>");
//         data = (response.data as List).map((i) => Product.fromJson(i)).toList();
//         print("data>>>>>>>>>");
//         print(data);
//       }
//     } on DioError catch (e) {
//       print("no new onehundred");
//       print(e.response);
//     }

  Future<ServerResponse> updateProduct(String username, String password) async {
    ServerResponse model = ServerResponse(message: "Error", statusCode: 0);
    String url = Config.url + Config.updateProduct;
    try {
      final response = await Dio().post(
        url,
        data: {
          "productId": 544,
          "product_name": "Buy spacial Amla juce",
          "product_description":
              " Amla has a variety of benefits, including antidiabetic, anticancer, and anti-inflammatory effects.",
          "product_vendor": "suyogavender",
          "product_code": "SUG_Aml_028",
          "product_weight": "1",
          "product_weight_unit": "kg",
          "category_id": 2,
          "price_min_quantity": 250,
          "price_value": 220.00,
          "market_price": 420.00,
          "brandName": "SUYOGA",
          "cityId": 1,
          "active": "1",
          "city_Name": "Bengaluru",
          "productTitle": "nalli kayi special juice"
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        loginFlag = true;
        model = ServerResponse.fromJson(response.data);
        print("response from post method update project>>>>>>>>>>>>>>>");
        print(model.message);
        print(model.statusCode);
        print("response from post method update project>>>>>>>>>>>>>>>");
      } else {
        loginFlag = false;
        print("Unexpected status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      loginFlag = false;
      print("Error: ${e.message}");
      model = ServerResponse(message: e.message ?? "Error", statusCode: 0);
    }
    return model;
  }

  Future<ServerResponse> updateProductnew(
      updateProductModel updateModel) async {
    ServerResponse model = ServerResponse(message: "Error", statusCode: 0);
    String url = Config.url + Config.updateProduct;
    print(url);
    try {
      final response = await Dio().post(
        url,
        data: updateModel.toJson(),
        // data: {
        //   "productId": 544,
        //   "product_name": "Buy spacial Amla juce",
        //   "product_description":
        //       " Amla has a variety of benefits, including antidiabetic, anticancer, and anti-inflammatory effects.",
        //   "product_vendor": "suyogavender",
        //   "product_code": "SUG_Aml_028",
        //   "product_weight": "1",
        //   "product_weight_unit": "kg",
        //   "category_id": 2,
        //   "price_min_quantity": 250,
        //   "price_value": 220.00,
        //   "market_price": 420.00,
        //   "brandName": "SUYOGA",
        //   "cityId": 1,
        //   "active": "1",
        //   "city_Name": "Bengaluru",
        //   "productTitle": "nalli kayi special juice"
        // },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        loginFlag = true;
        model = ServerResponse.fromJson(response.data);
        print("response from post method update project>>>>>>>>>>>>>>>");
        print(model.message);
        print(model.statusCode);
        print("response from post method update project>>>>>>>>>>>>>>>");
      } else {
        loginFlag = false;
        print("Unexpected status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      loginFlag = false;
      print("Error: ${e.message}");
      model = ServerResponse(message: e.message ?? "Error", statusCode: 0);
    }
    return model;
  }

  Future<ServerResponse> updateTransporter(
      AddTransporterModel addtransporterModel) async {
    ServerResponse model = ServerResponse(message: "Error", statusCode: 0);
    String url = Config.addTransposrter;
    print(url);
    try {
      final response = await Dio().post(
        url,
        data: addtransporterModel.toJson(),
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        loginFlag = true;
        model = ServerResponse.fromJson(response.data);
        print("response from post method update project>>>>>>>>>>>>>>>");
        print(model.message);
        print(model.statusCode);
        print("response from post method update project>>>>>>>>>>>>>>>");
      } else {
        loginFlag = false;
        print("Unexpected status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      loginFlag = false;
      print("Error: ${e.message}");
      model = ServerResponse(message: e.message ?? "Error", statusCode: 0);
    }
    return model;
  }

  Future<ServerResponse> updateSamarpanaProduct(
      updateProductModel updateModel) async {
    ServerResponse model = ServerResponse(message: "Error", statusCode: 0);
    String url = Config.url + Config.updateSamarpanaProduct;
    //  String url =
    //    "http://44.192.46.200:8083/subjeeCentralService/product/v1/AddSamarpanaProduct";

    print(url);
    try {
      final response = await Dio().post(
        url,
        data: updateModel.toJson(),
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        loginFlag = true;
        if (response.data != null) {
          try {
            model = ServerResponse.fromJson(response.data);
          } catch (e) {
            model = ServerResponse(message: "Product updated successfully", statusCode: response.statusCode);
          }
        } else {
          model = ServerResponse(message: "Product updated successfully", statusCode: response.statusCode);
        }
        print("response from post method Samarpana project>>>>>>>>>>>>>>");
        print("Message: ${model.message}");
        print("Status Code: ${model.statusCode}");
        print("response from post method Samarpana project>>>>>>>>>>>>>>");
      } else {
        loginFlag = false;
        print("Unexpected status code: ${response.statusCode}");
        model = ServerResponse(message: "Failed to update product", statusCode: response.statusCode);
      }
    } on DioException catch (e) {
      loginFlag = false;
      print("Error: ${e.message}");
      print("Samarpana error>>>>>>>>>>>>>>>>");
      model = ServerResponse(message: e.message ?? "Error", statusCode: 0);
    }
    return model;
  }

  Future<ServerResponse> updatePincode(PincodeModel pincodeModel) async {
    ServerResponse model = ServerResponse(message: "Error", statusCode: 0);
    String url = Config.url + Config.addPincode;
    print(url);
    try {
      final response = await Dio().post(
        url,
        data: pincodeModel.toJson(),
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        loginFlag = true;
        model = ServerResponse.fromJson(response.data);
        print("response from post method update pincode>>>>>>>>>>>>>>>");
        print(model.message);
        print(model.statusCode);
        print("response from post method update pincode>>>>>>>>>>>>>>>");
      } else {
        loginFlag = false;
        print("Unexpected status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      loginFlag = false;
      print("Error: ${e.message}");
      model = ServerResponse(message: e.message ?? "Error", statusCode: 0);
    }
    return model;
  }

  Future<ServerResponse> addPartner(PartnerModel partnermodel) async {
    ServerResponse model = ServerResponse(message: "Error", statusCode: 0);
    String url = Config.url + Config.addPartnersList;
    print("\n=== ADD PARTNER API CALL ===");
    print("Endpoint URL: $url");
    print("Sending Partner Data: ${partnermodel.toJson()}");
    try {
      final response = await Dio().post(
        url,
        data: partnermodel.toJson(),
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        //loginFlag = true;
        if (response.data != null) {
          try {
            model = ServerResponse.fromJson(response.data);
          } catch (e) {
            model = ServerResponse(message: "Partner added successfully", statusCode: response.statusCode);
          }
        } else {
          model = ServerResponse(message: "Partner added successfully", statusCode: response.statusCode);
        }
        print("✅ SUCCESS - Partner Response Message: ${model.message}");
        print("✅ SUCCESS - Partner Response Status: ${model.statusCode}");
      } else {
        loginFlag = false;
        print("❌ FAILED - Unexpected status code: ${response.statusCode}");
        model = ServerResponse(message: "Failed to add partner", statusCode: response.statusCode);
      }
    } on DioException catch (e) {
      // loginFlag = false;
      print("❌ ERROR - Network Error: ${e.message}");
      print("❌ ERROR - Error Type: ${e.type}");
      model = ServerResponse(message: e.message ?? "Network error", statusCode: 0);
    }
    print("=== END ADD PARTNER API CALL ===\n");
    return model;
  }

  Future<List<Product>> getProdBySearch(String pname) async {
    List<Product> data = <Product>[];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? locationTemp = prefs.getString('localCity');
    String Location = locationTemp ?? 'Bengaluru';
    String newLocation = Location.replaceAll('"', "");
    //  print("@@@@@@@@@@@@@@@@@@@@@@ " + Location);
    if (newLocation.contains('Mountain View')) {
      newLocation = 'Bengaluru';
    }
    try {
      String url = Config.url +
          Config.searchByProductName +
          "?cityName=$newLocation&productName=$pname";
      print("product search url>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(url);
      //cityName=Bangalore&productName=apple
      //String url =
      //    "http://44.192.46.200:8082/subjeeService/product/v1/searchProductByname?productName=beans";
      //http://44.192.46.200:8082/subjeeService/product/v1/searchProductByname?productName=beans
      var response = await Dio().get(url,
          options: new Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
      if (response.statusCode == 200) {
        data = (response.data as List).map((i) => Product.fromJson(i)).toList();
        print(">>>>>>>>>>>>>>>>>>comming here>>>>>>>");
        print(url);
        print(data);
        print(">>>>>>>>>>>>>>>>>>comming here>>>>>>>");
      }
    } on DioException catch (e) {
      print(e.response);
    }

    return data;
  }

  Future<List<Getpromolistmodel>> getPromolist() async {
    return [];
  }

  Future<bool> deletepincode(int id) async {
    bool isdelete = false;
    String url = Config.url + Config.deletepincode + "?id=$id";
    print(url);
    var response = await Dio().delete(url,
        options: new Options(
            headers: {HttpHeaders.contentTypeHeader: 'application/json'}));
    if (response.statusCode == 200) {
      isdelete = true;
    }
    return isdelete;
  }

  

  Future<List<Getpromolistmodel>> getpromolist() async {
    return [];
  }

  Future<bool> promocodelist() async {
    return false;
  }
}

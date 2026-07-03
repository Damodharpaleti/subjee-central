import 'package:flutter/widgets.dart';
import 'package:subjeecentral/api_service.dart';
import 'package:subjeecentral/models/product.dart';

enum LoadMoreStatus { INITIAL, LOADING, STABLE }

class ProductProvider with ChangeNotifier {
  APIService? _apiService;
  List<Product> _productList = [];
  List<Product> _searchList = [];
  SortBy? _sortBy;
  int pageSize = 10;

  List<Product> get allProducts => _productList;
  List<Product> get searchProducts => _searchList;

  double get totalRecords => _productList.length.toDouble();

  LoadMoreStatus _loadMoreStatus = LoadMoreStatus.STABLE;

  getLoadMoreStatus() => _loadMoreStatus;

  ProductProvider() {
    resetStreams();
    _sortBy = SortBy("modified", "Latest", "asc");
  }

  void resetStreams() {
    _apiService = APIService();
    _productList = [];
    _searchList = [];
  }

  setLoadingStatus(LoadMoreStatus loadMoreStatus) {
    _loadMoreStatus = loadMoreStatus;
    notifyListeners();
  }

  setSortOrder(SortBy sortBy) {
    _sortBy = sortBy;
    notifyListeners();
  }

  fetchProduct(int pageNumber,
      {String? strSearch,
      String? tagName,
      int? categoryId,
      String? sortBy,
      String? city,
      String sortOrder = "asc"}) async {
    List<Product> itemModel = await _apiService!.getProduct(
        cId: categoryId,
        cityname: city,
        strSearch: strSearch,
        sortBy: this._sortBy?.value,
        pageNumber: pageNumber,
        pageSize: this.pageSize,
        sortOrder: this._sortBy?.sortOrder ?? '');

    if (itemModel.length > 0) {
      _productList.addAll(itemModel);
    }
    setLoadingStatus(LoadMoreStatus.STABLE);
  }

//////////////////
  // fetchProduct(pageNumber,
  //     {String strSearch,
  //     String tagName,
  //     int categoryId,
  //     String sortBy,
  //     String sortOrder = "asc",
  //     String city}) async {
  //   List<Product> itemModel = await _apiService.getProduct(city
  //       // cId: categoryId,
  //       // strSearch: strSearch,
  //       // sortBy: this._sortBy.value,
  //       // pageNumber: pageNumber,
  //       // pageSize: this.pageSize,
  //       // sortOrder: this._sortBy.sortOrder
  //       );

  //   if (itemModel.length > 0) {
  //     _productList.addAll(itemModel);
  //   }
  //   setLoadingStatus(LoadMoreStatus.STABLE);
  // }

  fetchSearchProduct(String pname) async {
    List<Product> itemModel = await _apiService!.getProdBySearch(pname);

    if (itemModel.length > 0) {
      _searchList.addAll(itemModel);
    }
    setLoadingStatus(LoadMoreStatus.STABLE);
  }
}

class SortBy {
  String value;
  String text;
  String sortOrder;

  SortBy(this.value, this.text, this.sortOrder);
}

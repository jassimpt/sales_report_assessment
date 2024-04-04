import 'package:assessment/model/product_model.dart';
import 'package:assessment/model/product_sales_model.dart';
import 'package:flutter/material.dart';

class BasicController extends ChangeNotifier {
  ProductModel? selectedProduct;
  ProductModel? selectedService;
  String? selectedParticular;
  String? selectedServiceParticular;
  List<ProductSalesModel> productsList = [];
  List<ProductSalesModel> serviceList = [];
  void productChanger(newValue) {
    selectedProduct = newValue;
    notifyListeners();
  }

  void serviceChanger(newValue) {
    selectedService = newValue;
    notifyListeners();
  }

  void addProduct(ProductSalesModel product) {
    productsList.add(product);

    notifyListeners();
  }

  void addService(ProductSalesModel product) {
    serviceList.add(product);

    notifyListeners();
  }
}

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
  String selectedPaymentMethod = "Select any mode";

  void paymentModeChanger(String method) {
    selectedPaymentMethod = method;
    notifyListeners();
  }

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

  Map<String, double> calculateTotals(List<ProductSalesModel> productsList,
      List<ProductSalesModel> serviceList, double discount) {
    double productTotal = 0;
    for (var product in productsList) {
      productTotal += product.amount ?? 0 * product.qty!;
    }

    double serviceTotal = 0;
    for (var service in serviceList) {
      serviceTotal += service.amount ?? 0 * service.qty!;
    }

    double subTotal = productTotal + serviceTotal;
    double totalAmount = subTotal - discount;

    return {
      'productTotal': productTotal,
      'serviceTotal': serviceTotal,
      'subTotal': subTotal,
      'totalAmount': totalAmount,
    };
  }
}

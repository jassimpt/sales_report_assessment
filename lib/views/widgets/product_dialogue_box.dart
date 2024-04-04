import 'package:assessment/controllers/basic_controller.dart';
import 'package:assessment/model/product_model.dart';
import 'package:assessment/model/product_sales_model.dart';
import 'package:assessment/views/widgets/product_add_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDialogueBox extends StatelessWidget {
  ProductDialogueBox({
    super.key,
    required this.amountController,
    required this.qtyController,
  });
  final TextEditingController amountController;
  final TextEditingController qtyController;
  final List<ProductModel> products = [
    ProductModel(name: 'Item 1', amount: 10.0),
    ProductModel(name: 'Item 2', amount: 20.0),
    ProductModel(name: 'Item 3', amount: 30.0),
  ];
  final List<ProductModel> services = [
    ProductModel(name: 'printing', amount: 1005),
    ProductModel(name: 'service 1', amount: 2350),
    ProductModel(name: 'service 2', amount: 4568),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AlertDialog(
        title: const Text("Add product or Service"),
        content: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(
                    child: Text("Add Product"),
                  ),
                  Tab(
                    child: Text("Add Service"),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ProductAddTab(
                      addItem: () => addProduct(context),
                      amountController: amountController,
                      products: products,
                      qtyController: qtyController,
                      values: products.first,
                    ),
                    // addProductTab(context),
                    ProductAddTab(
                        values: services.first,
                        products: services,
                        addItem: () => addService(context),
                        amountController: amountController,
                        qtyController: qtyController),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  addProduct(BuildContext context) {
    final pro = Provider.of<BasicController>(context, listen: false);
    ProductSalesModel product = ProductSalesModel(
      amount: double.parse(amountController.text),
      particular: pro.selectedParticular,
      qty: int.parse(qtyController.text),
    );
    pro.addProduct(product);
    amountController.clear();
    pro.selectedParticular = "";
    qtyController.clear();
    Navigator.pop(context);
  }

  addService(BuildContext context) {
    final pro = Provider.of<BasicController>(context, listen: false);
    ProductSalesModel product = ProductSalesModel(
      amount: double.parse(amountController.text),
      particular: pro.selectedParticular,
      qty: int.parse(qtyController.text),
    );
    pro.addService(product);
    amountController.clear();
    pro.selectedServiceParticular = "";
    qtyController.clear();
    Navigator.pop(context);
  }
}

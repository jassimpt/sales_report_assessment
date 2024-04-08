import 'package:assessment/controllers/basic_controller.dart';
import 'package:assessment/helpers/colors.dart';
import 'package:assessment/model/product_model.dart';
import 'package:assessment/model/product_sales_model.dart';
import 'package:assessment/views/widgets/day_closing_data_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductAddDialogueBox extends StatelessWidget {
  ProductAddDialogueBox({
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text("Add Product"),
      actions: [
        Row(
          children: [
            const Text(
              "Particular: ",
              style: TextStyle(fontSize: 18),
            ),
            Consumer<BasicController>(
              builder: (context, value, child) => DropdownButton<ProductModel>(
                value: products.first,
                onChanged: (ProductModel? newValue) {
                  value.productChanger(newValue);
                  if (newValue != null) {
                    amountController.text = newValue.amount.toString();
                    value.selectedParticular = newValue.name;
                  }
                },
                items: products.map((ProductModel product) {
                  return DropdownMenuItem<ProductModel>(
                    key: UniqueKey(),
                    value: product,
                    child: Text(product.name!),
                  );
                }).toList(),
              ),
            )
          ],
        ),
        Row(
          children: [
            const Text(
              "Quantity: ",
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: SizedBox(
                height: size.height * 0.08,
                child: DayClosingDataField(
                    fillColor: textFieldFill,
                    readOnly: false,
                    controller: qtyController),
              ),
            )
          ],
        ),
        Row(
          children: [
            const Text(
              "Amount: ",
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: SizedBox(
                height: size.height * 0.08,
                child: DayClosingDataField(
                    fillColor: textFieldFill,
                    readOnly: false,
                    controller: amountController),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
            TextButton(
                onPressed: () {
                  addProduct(context);
                },
                child: const Text("Submit"))
          ],
        )
      ],
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
}

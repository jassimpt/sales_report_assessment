import 'package:assessment/controllers/basic_controller.dart';
import 'package:assessment/helpers/colors.dart';
import 'package:assessment/model/product_model.dart';
import 'package:assessment/model/product_sales_model.dart';
import 'package:assessment/views/widgets/day_closing_data_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceAddDialogueBox extends StatelessWidget {
  ServiceAddDialogueBox({
    super.key,
    required this.amountController,
    required this.qtyController,
  });

  final TextEditingController amountController;
  final TextEditingController qtyController;
  final List<ProductModel> services = [
    ProductModel(name: 'printing', amount: 1005),
    ProductModel(name: 'service 1', amount: 2350),
    ProductModel(name: 'service 2', amount: 4568),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text("Add Service"),
      actions: [
        Row(
          children: [
            const Text(
              "Particular: ",
              style: TextStyle(fontSize: 18),
            ),
            Consumer<BasicController>(
              builder: (context, value, child) => DropdownButton<ProductModel>(
                value: services.first,
                onChanged: (ProductModel? newValue) {
                  value.productChanger(newValue);
                  if (newValue != null) {
                    amountController.text = newValue.amount.toString();
                    value.selectedParticular = newValue.name;
                  }
                },
                items: services.map((ProductModel product) {
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
                  addService(context);
                },
                child: const Text("Submit"))
          ],
        )
      ],
    );
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

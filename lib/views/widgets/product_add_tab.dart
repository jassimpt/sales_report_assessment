import 'package:assessment/controllers/basic_controller.dart';
import 'package:assessment/helpers/colors.dart';
import 'package:assessment/model/product_model.dart';
import 'package:assessment/views/widgets/day_closing_data_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductAddTab extends StatelessWidget {
  ProductAddTab({
    super.key,
    required this.values,
    required this.products,
    required this.addItem,
    required this.amountController,
    required this.qtyController,
  });

  final ProductModel values;
  final List<ProductModel> products;
  final TextEditingController amountController;
  final TextEditingController qtyController;
  void Function()? addItem;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Particular: ",
              style: TextStyle(fontSize: 18),
            ),
            Consumer<BasicController>(
              builder: (context, value, child) => DropdownButton<ProductModel>(
                value: values,
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
            TextButton(onPressed: () => addItem!(), child: const Text("Submit"))
          ],
        )
      ],
    );
  }
}

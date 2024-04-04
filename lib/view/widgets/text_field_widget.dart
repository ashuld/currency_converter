import 'package:currency_converter/controller/currency_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyTextField extends StatelessWidget {
  final TextEditingController textController;
  final CurrencyPickerController controller;
  final bool convertFrom;
  const CurrencyTextField(
      {super.key,
      required this.textController,
      required this.controller,
      required this.convertFrom});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Obx(() {
        return TextField(
          enabled: convertFrom,
          controller: textController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            labelText:
                'Amount in ${convertFrom ? controller.convertFrom.value : controller.convertTo.value}',
          ),
        );
      }),
    );
  }
}

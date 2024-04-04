import 'package:currency_converter/controller/currency_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrencySelectWidget extends StatelessWidget {
  final Function() onTap;
  final bool convertFrom;
  final CurrencyPickerController controller;

  const CurrencySelectWidget({
    super.key,
    required this.onTap,
    required this.controller,
    required this.convertFrom,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 100,
        height: 75,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(width: 2)),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
        ),
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(() {
                return Text(
                  convertFrom
                      ? controller.convertFromFlag.value
                      : controller.convertToFlag.value,
                  style: const TextStyle(fontSize: 25),
                );
              }),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      convertFrom
                          ? controller.convertFrom.value
                          : controller.convertTo.value,
                      style: GoogleFonts.notoSans(
                          textStyle: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      convertFrom
                          ? controller.convertFromSymbol.value
                          : controller.convertToSymbol.value,
                      style: GoogleFonts.notoSans(
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}

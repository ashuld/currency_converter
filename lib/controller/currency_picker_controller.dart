import 'dart:developer';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyPickerController extends GetxController {
  final RxString _convertFrom = 'INR'.obs;
  final RxString _convertFromFlag = '🇮🇳'.obs;
  final RxString _convertFromSymbol = '₹'.obs;
  final RxString _convertTo = 'USD'.obs;
  final RxString _convertToFlag = '🇺🇸'.obs;
  final RxString _convertToSymbol = "\$".obs;

  RxString get convertFrom => _convertFrom;
  RxString get convertTo => _convertTo;
  RxString get convertFromFlag => _convertFromFlag;
  RxString get convertToFlag => _convertToFlag;
  RxString get convertFromSymbol => _convertFromSymbol;
  RxString get convertToSymbol => _convertToSymbol;

  void updateConvertFrom(
      {required String code, required String symbol, required Currency flag}) {
    _convertFrom.value = code;
    _convertFromSymbol.value = symbol;
    _convertFromFlag.value = CurrencyUtils.currencyToEmoji(flag);
    log(_convertFromFlag.value);
  }

  void updateConvertTo(
      {required String code, required String symbol, required Currency flag}) {
    if (_convertFrom.value == code) {
      Get.snackbar(
          margin: const EdgeInsets.all(10),
          snackPosition: SnackPosition.TOP,
          'Action Denied',
          'Cannot choose same Currency');
    } else {
      _convertTo.value = code;
      _convertToSymbol.value = symbol;
      _convertToFlag.value = CurrencyUtils.currencyToEmoji(flag);
      log(_convertFromFlag.value);
    }
  }
}

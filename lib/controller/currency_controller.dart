import 'dart:convert';
import 'dart:developer';

import 'package:currency_converter/model/currency_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CurrencyConverterController extends GetxController {
  final RxString _convertedAmount = '0.0'.obs;
  final apiKey = dotenv.env['API_KEY'];

  RxString get convertedAmount => _convertedAmount;

  Future<void> convertCurrency(
      {required String convertTo,
      required String convertFrom,
      required String amount}) async {
    try {
      if (amount.isEmpty) {
        Get.snackbar('Amount Empty', 'Enter the Amount To be converted');
        return;
      }
      //api url
      var uri = Uri.parse(
          'https://api.apilayer.com/currency_data/convert?to=$convertTo&from=$convertFrom&amount=$amount');

// changing the queries in the url
      var queryParams = {
        'to': convertTo,
        'from': convertFrom,
        'amount': amount
      };

      var urlQueryParams = uri.replace(queryParameters: queryParams);
      var headers = {'apikey': apiKey!};

      final response = await http.get(urlQueryParams, headers: headers);
      int statuscode = response.statusCode;
      if (statuscode >= 200 && statuscode < 300) {
        log('Status Code:$statuscode');
        log('Response Body :${response.body}');

        final currency = CurrencyModel.fromJson(jsonDecode(response.body));
        _convertedAmount.value = currency.result.toString();
      }
    } catch (e) {
      Get.snackbar('Erorr', 'Something unexpected Happended!');
    }
  }
}

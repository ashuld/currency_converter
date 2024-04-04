import 'package:currency_converter/controller/currency_picker_controller.dart';
import 'package:currency_converter/view/widgets/currency_select_widget.dart';
import 'package:currency_converter/view/widgets/text_field_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CurrencyPickerController controller = Get.find();
    final TextEditingController convertFromController = TextEditingController();
    final TextEditingController convertToController = TextEditingController();
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Currency Converter',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60, bottom: 30),
                  height: 75,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      CurrencySelectWidget(
                          convertFrom: true,
                          controller: controller,
                          onTap: () => showCurrencyPicker(
                              showFlag: true,
                              showCurrencyName: true,
                              showCurrencyCode: true,
                              favorite: ['inr', 'eur', 'usd', 'jpy'],
                              theme: CurrencyPickerThemeData(
                                  flagSize: 30,
                                  bottomSheetHeight:
                                      MediaQuery.of(context).size.height * 0.4),
                              context: context,
                              onSelect: (Currency currency) =>
                                  controller.updateConvertFrom(
                                      code: currency.code,
                                      symbol: currency.symbol,
                                      flag: currency))),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CurrencyTextField(
                              textController: convertFromController,
                              controller: controller,
                              convertFrom: true),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 7.0),
                const Icon(Icons.swap_vert, size: 40),
                const SizedBox(height: 7.0),
                _convertButton(),
                const SizedBox(height: 7.0),
                const Icon(Icons.swap_vert, size: 40),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 75,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      CurrencySelectWidget(
                          onTap: () => showCurrencyPicker(
                                favorite: ['inr', 'eur', 'usd', 'jpy'],
                                theme: CurrencyPickerThemeData(
                                    flagSize: 30,
                                    bottomSheetHeight:
                                        MediaQuery.of(context).size.height *
                                            0.4),
                                context: context,
                                showFlag: true,
                                showCurrencyName: true,
                                showCurrencyCode: true,
                                onSelect: (Currency currency) {
                                  controller.updateConvertTo(
                                      code: currency.code,
                                      symbol: currency.symbol,
                                      flag: currency);
                                },
                              ),
                          controller: controller,
                          convertFrom: false),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CurrencyTextField(
                              textController: convertToController,
                              controller: controller,
                              convertFrom: false),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _convertButton() {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 222, 228, 227),
            shape: RoundedRectangleBorder(
                side:
                    const BorderSide(color: Color.fromARGB(255, 98, 148, 188)),
                borderRadius: BorderRadius.circular(8))),
        onPressed: () {},
        child: const Text(
          'Convert',
          style: TextStyle(color: Colors.black, fontSize: 21),
        ),
      ),
    );
  }
}

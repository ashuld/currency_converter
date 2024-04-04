import 'dart:async';

import 'package:currency_converter/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 3), () {
              Get.off(() => const HomePage());
            }),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container();
              } else {
                return SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset('assets/images/splash_image.png'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SplashscreenController controller = Get.put(SplashscreenController());
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: "logoTag",
              child: Image.asset(
                "assets/image/vistr-logo.png",
                width: 250,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Vistr",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF018386)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )),
    );
  }
}

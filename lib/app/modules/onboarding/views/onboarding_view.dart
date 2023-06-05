import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vistr/app/modules/login/views/login_view.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OnboardingController controller = Get.put(OnboardingController());
    return Scaffold(
        body: TabBarView(controller: controller.tabController, children: [
      Column(
        children: [
          Container(
              color: Colors.white,
              height: 300,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset(
                "assets/image/onboarding-1.png",
                fit: BoxFit.cover,
              )),
          Container(
            height: MediaQuery.sizeOf(context).height - 300,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Temukan Destinasi Impianmu!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF013660)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "•  Rekomendasi tempat berlibur, hotel terdekat, dan restoran terdekat berdasarkan preferensi pengguna\nNikmati liburanmu dengan mudah menemukan destinasi yang sesuai dengan minat dan keinginanmu.",
                    style: TextStyle(fontSize: 16, color: Color(0xFF013660)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "• Nikmati liburanmu dengan mudah menemukan destinasi yang sesuai dengan minat dan keinginanmu.",
                      style: TextStyle(fontSize: 16, color: Color(0xFF013660))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "• Temukan akomodasi terbaik dan restoran terdekat untuk pengalaman liburan yang tak terlupakan.",
                    style: TextStyle(fontSize: 16, color: Color(0xFF013660)),
                  ),
                  Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF018386),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            controller.tabController.index = 1;
                          },
                          child: Text(
                            "Lanjut",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))),
                ],
              ),
            ),
          )
        ],
      ),
      Column(
        children: [
          Container(
              color: Colors.white,
              height: 300,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset(
                "assets/image/onboarding-2.png",
                fit: BoxFit.cover,
              )),
          Container(
            height: MediaQuery.sizeOf(context).height - 300,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ketahui Kondisi di Sekitarmu!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF013660)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "• Pendeteksian keramaian yang membantu kamu menghindari keramaian yang tidak diinginkan.",
                    style: TextStyle(fontSize: 16, color: Color(0xFF013660)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "• Ketahui situasi di sekitarmu sebelum memutuskan untuk pergi ke suatu tempat.",
                      style: TextStyle(fontSize: 16, color: Color(0xFF013660))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "• Dapatkan informasi real-time tentang tingkat keramaian di tempat-tempat populer untuk mengoptimalkan pengalamanmu.",
                    style: TextStyle(fontSize: 16, color: Color(0xFF013660)),
                  ),
                  Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF018386),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            controller.tabController.index = 2;
                          },
                          child: Text(
                            "Lanjut",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))),
                ],
              ),
            ),
          )
        ],
      ),
      Column(
        children: [
          Container(
              color: Colors.white,
              height: 300,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset(
                "assets/image/onboarding-3.png",
                fit: BoxFit.cover,
              )),
          Container(
            height: MediaQuery.sizeOf(context).height - 300,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Siapkan Rencanamu dengan Lebih Baik!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF013660)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "• Pendeteksian cuaca yang memberikan informasi cuaca terkini di daerah tujuanmu.",
                    style: TextStyle(fontSize: 16, color: Color(0xFF013660)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "• Rencanakan kegiatanmu dengan lebih baik dengan mengetahui kondisi cuaca yang akan kamu hadapi..",
                      style: TextStyle(fontSize: 16, color: Color(0xFF013660))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "• Siapkan dirimu dengan persiapan yang tepat, apakah itu membawa payung atau memilih tempat indoor yang cocok.",
                    style: TextStyle(fontSize: 16, color: Color(0xFF013660)),
                  ),
                  Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF018386),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            Get.off(LoginView());
                          },
                          child: Text(
                            "Mulai",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))),
                ],
              ),
            ),
          )
        ],
      )
    ]));
  }
}

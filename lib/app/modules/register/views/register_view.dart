import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vistr/app/modules/login/views/login_view.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Color(0xFF1F2C3A),
                        image: DecorationImage(
                          image: ExactAssetImage(
                            "assets/image/vistr-logo.png",
                            scale: 6,
                          ),
                        ),
                      ),
                      child: new BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white.withOpacity(0.0)),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 30,
                        left: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Daftar",
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Buat akun anda",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ))
                  ],
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height - 300,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: controller.registerFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              controller: controller.emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email Wajib Diisi!';
                                }
                                return null;
                              },
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.all(10.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    // width: 0.0 produces a thin "hairline" border
                                    borderSide: BorderSide(
                                        color: Color(0xFFE7E9EB), width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    // width: 0.0 produces a thin "hairline" border
                                    borderSide: BorderSide(
                                        color: Color(0xFF018386), width: 1),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.black),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  labelText: 'Email',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 60,
                            child: Obx(
                              () => TextFormField(
                                controller: controller.passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password Wajib Diisi!';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                obscureText: controller.isPasswordHidden.value,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                          controller.isPasswordHidden.value
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                      onPressed: () {
                                        controller.isPasswordHidden.value =
                                            !controller.isPasswordHidden.value;
                                      },
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: Color(0xFFE7E9EB), width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: Color(0xFF018386), width: 1),
                                    ),
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    hintStyle: TextStyle(color: Colors.black),
                                    labelText: 'Password',
                                    fillColor: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: SizedBox(
                              height: 60,
                              width: MediaQuery.sizeOf(context).width - 40,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF018386),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    if (controller.registerFormKey.currentState!
                                        .validate()) {
                                      // AppMainTheme.showLoading(info: 'register');

                                      controller.register(context);
                                    }
                                  },
                                  child: Text(
                                    "Daftar",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Sudah punya akun? ",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF018386)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
        ));
  }
}

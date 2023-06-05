import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vistr/app/data/app_theme.dart';
import 'package:vistr/app/modules/login/views/login_view.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final box = GetStorage();
  RxBool isPasswordHidden = false.obs;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  register(context) async {
    print("FCM : ${box.read('deviceFcmToken')}");
    print("email : ${emailController.text}");
    print("password : ${passwordController.text}");

    AppMainTheme.showLoading(info: 'register');
    try {
      var response = await Dio().post(
          "https://vistr-capstone.et.r.appspot.com/user/signup",
          options:
              Options(followRedirects: false, validateStatus: (status) => true),
          data: {
            'email': emailController.text,
            'password': passwordController.text,
          });

      print(response.data);
      int? statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        AppMainTheme.closeLoading();

        AppMainTheme.showSnackBar(context,
            title: "Berhasil Daftar",
            desc: "Berhasil mendaftarkan akun, silahkan login.",
            icon: Icons.done,
            iconColor: AppMainTheme.bluePrimary);
        // box.write('isUserExist', true);
        // box.write('userData', response.data['data']);
        // box.write('userToken', response.data['token']);
        // box.write('userRole', response.data['data']["role"]);
        // print("Is User Exist : ${box.read('isUserExist')}");
        // print("User Token : ${box.read('userToken')}");
        // print("User Role : ${box.read('userRole')}");

        Get.offAll(LoginView());
      } else {
        AppMainTheme.closeLoading();
        print(response.data['message']);
        AppMainTheme.showSnackBar(context,
            title: "Oops.. Ada masalah!",
            desc: '${response.data['message']}',
            icon: Icons.close,
            iconColor: AppMainTheme.redPrimary);
      }
    } catch (e) {
      print(e);
      AppMainTheme.closeLoading();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error Code :${e}')),
      );
    }
  }
}

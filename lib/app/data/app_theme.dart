import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AppMainTheme {
  static Color redPrimary = Color(0xffD70137);
  static Color orangePrimary = Color(0xffFAAD26);
  static Color pinkPrimary = Color(0xffFFD6E1);
  static Color greyLight = Color.fromARGB(255, 202, 202, 202);
  static Color greyNew = Colors.grey.shade100;
  static Color bluePrimary = Color(0xFF018386);
  // system color
  static Color success = Color(0xff00C247);
  static Color error = Color(0xffED2121);
  static Color warning = Color(0xffFFE16A);
  static Color info = Color(0xff004CE8);
  static Color greyNotActive = Color(0xffaaaaaa);

  // text
  static Color textPrimary = Color(0xff181818);
  static Color textGrey = Color(0xffE0E0E0);

  // static InputDecoration mainFormDecor({String hint, IconData prefixIcon}) {
  //   return InputDecoration(
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.redPrimary,
  //       ),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.redPrimary,
  //       ),
  //     ),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.greyNotActive,
  //       ),
  //     ),
  //     errorBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.redPrimary,
  //       ),
  //     ),
  //     errorStyle: TextStyle(
  //       color: AppMainTheme.error,
  //       fontSize: 13,
  //     ),
  //     hintText: hint,
  //     prefixIcon: Icon(prefixIcon),
  //   );
  // }

  // static InputDecoration mainFormWithTrailDecor(Function function,
  //     {String hint, IconData suffixIcon}) {
  //   return InputDecoration(
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.redPrimary,
  //       ),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.redPrimary,
  //       ),
  //     ),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.greyNotActive,
  //       ),
  //     ),
  //     errorBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.redPrimary,
  //       ),
  //     ),
  //     errorStyle: TextStyle(
  //       color: AppMainTheme.error,
  //       fontSize: 13,
  //     ),
  //     hintText: hint,
  //     // prefixIcon: Icon(suffixIcon),
  //     suffixIcon: IconButton(
  //       onPressed: function,
  //       icon: Icon(suffixIcon),
  //     ),
  //   );
  // }

  // static InputDecoration dropDownButtonFormWithTrailDecor(Function function,
  //     {String hint, IconData suffixIcon}) {
  //   return InputDecoration(
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.greyNotActive,
  //       ),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.greyNotActive,
  //       ),
  //     ),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.greyNotActive,
  //       ),
  //     ),
  //     errorBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.greyNotActive,
  //       ),
  //     ),
  //     errorStyle: TextStyle(
  //       color: AppMainTheme.error,
  //       fontSize: 13,
  //     ),
  //     hintText: hint,
  //     // prefixIcon: Icon(suffixIcon),
  //   );
  // }

  // static InputDecoration passFormDecor(
  //     {String hint, IconData prefixIcon, Function functionIcon}) {
  //   return InputDecoration(
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.redPrimary,
  //       ),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.redPrimary,
  //       ),
  //     ),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.greyNotActive,
  //       ),
  //     ),
  //     errorBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //       borderSide: BorderSide(
  //         color: AppMainTheme.redPrimary,
  //       ),
  //     ),
  //     errorStyle: TextStyle(
  //       color: AppMainTheme.error,
  //       fontSize: 13,
  //     ),
  //     hintText: hint,
  //     suffixIcon: IconButton(
  //       icon: Icon(Icons.remove_red_eye_outlined),
  //       onPressed: functionIcon,
  //     ),
  //     prefixIcon: Icon(prefixIcon),
  //   );
  // }

  static showSnackBar(BuildContext context,
      {required String title,
      required String desc,
      required IconData icon,
      required Color iconColor}) {
    final snackBar = SnackBar(
      width: MediaQuery.of(context).size.width - 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      content: Container(
        height: 40,
        child: Row(
          children: [
            Container(
              width: 4,
              height: 36,
              decoration: BoxDecoration(
                  color: AppMainTheme.textGrey,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            SizedBox(width: 8),
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(width: 8),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppMainTheme.textPrimary),
                  ),
                  SizedBox(height: 2),
                  Text(
                    desc,
                    style: TextStyle(
                        fontSize: 14, color: AppMainTheme.textPrimary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      onVisible: () {
        //your code goes here
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showLoading({required String info}) {
    print("Opening loading $info");
    Get.dialog(
        Center(
          child: Lottie.asset(
            'assets/animation/loading.json',
            width: 250,
            height: 250,
          ),
        ),
        barrierDismissible: false);
  }

  static closeLoading() {
    print('Loading closed');
    Get.back();
  }
}

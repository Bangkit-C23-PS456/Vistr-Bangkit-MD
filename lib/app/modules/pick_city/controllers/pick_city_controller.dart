import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vistr/app/modules/itinerary/views/itinerary_view.dart';

import '../../../data/app_theme.dart';

class PickCityController extends GetxController {
  //TODO: Implement PickCityController

  var box = GetStorage();

  List listDataItenerary = [];
  RxBool isListDataItenerary = false.obs;

  RxDouble userLat = 0.0.obs;
  RxDouble userLng = 0.0.obs;

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

  getDataItenerary() async {
    print("User Token : ${box.read('userToken')} ");
    print("User Exist ?  : ${box.read('isUserExist')} ");

    AppMainTheme.showLoading(info: 'get data itenerary');

    try {
      print("get data itenerary");
      var response = await Dio().get(
        "https://vistr-capstone.et.r.appspot.com/user/iternary?latitude=${userLat.value}1&longitude=${userLng.value}",
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {"token": "${box.read('userToken')}"}),
      );
      var statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        AppMainTheme.closeLoading();

        print("Response Get Data Itenerary: ${response.data}");
        listDataItenerary = response.data["data"];
        isListDataItenerary = true.obs;
        print(listDataItenerary);
        Get.to(() => ItineraryView(), arguments: listDataItenerary);
        update();
      } else if (statusCode == 401) {
        // Get.offAll(() => LoginView());
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Sesi anda telah habis.')),
        // );
        AppMainTheme.closeLoading();
      } else {
        // print(response);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Ada masalah!')),
        // );
        AppMainTheme.closeLoading();
      }
    } catch (e) {
      print(e);
    }
  }
}

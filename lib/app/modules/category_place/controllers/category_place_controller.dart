import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CategoryPlaceController extends GetxController {
  //TODO: Implement CategoryPlaceController
  var box = GetStorage();
  var dataCategory = Get.arguments;

  List listDataPlaces = [];
  RxBool isListDataPlacesExist = false.obs;

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

  getListDataPlaces() async {
    print("User Token : ${box.read('userToken')} ");
    print("User Exist ?  : ${box.read('isUserExist')} ");

    try {
      print("get list data places");
      var response = await Dio().get(
        "https://vistr-capstone.et.r.appspot.com/place/get-by-category?categories=${dataCategory["name"]}",
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {"Authorization": "Bearer ${box.read('userToken')}"}),
      );
      var statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        print("Response Get List Data Places: ${response.data}");
        listDataPlaces = response.data["data"];
        isListDataPlacesExist = true.obs;
        print(listDataPlaces);
        update();
      } else if (statusCode == 401) {
        // Get.offAll(() => LoginView());
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Sesi anda telah habis.')),
        // );
      } else {
        // print(response);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Ada masalah!')),
        // );
      }
    } catch (e) {
      print(e);
    }
  }
}

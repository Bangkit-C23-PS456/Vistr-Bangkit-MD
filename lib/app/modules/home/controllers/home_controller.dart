import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var box = GetStorage();
  List listDataCategory = [
    "Rekomendasi",
    "Populer",
  ];

  RxString pickedCategory = "Rekomendasi".obs;

  List listDataPlaces = [];
  RxBool isListDataPlacesExist = false.obs;

  List listDataPlaceCategory = [
    {
      "id": 8,
      "name": "Amusement Parks",
      "image":
          "https://images.unsplash.com/photo-1505731110654-99d7f7f8e39c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1674&q=80"
    },
    {
      "id": 1,
      "name": "Beach",
      "image":
          "https://images.unsplash.com/photo-1519046904884-53103b34b206?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
    },
    {
      "id": 16,
      "name": "Cave",
      "image":
          "https://plus.unsplash.com/premium_photo-1681578990806-c0f5dd8984bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
    },
    {
      "id": 5,
      "name": "Conservation",
      "image":
          "https://images.unsplash.com/photo-1474139169836-9b0f8f138409?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1674&q=80"
    },
    {
      "id": 9,
      "name": "Culture",
      "image":
          "https://images.unsplash.com/photo-1616386232566-80015c23aeff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1673&q=80"
    },
    {
      "id": 3,
      "name": "Hill",
      "image":
          "https://images.unsplash.com/photo-1467830839049-11173e7b2755?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2832&q=80"
    },
    {
      "id": 10,
      "name": "History",
      "image":
          "https://images.unsplash.com/photo-1604580864964-0462f5d5b1a8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
    },
    {
      "id": 7,
      "name": "Lake",
      "image":
          "https://images.unsplash.com/photo-1516132006923-6cf348e5dee2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1674&q=80"
    },
    {
      "id": 4,
      "name": "Nature Reverses",
      "image":
          "https://images.unsplash.com/photo-1504700610630-ac6aba3536d3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
    },
    {
      "id": 13,
      "name": "Night Club",
      "image":
          "https://images.unsplash.com/photo-1574155376612-bfa4ed8aabfd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
    },
    {
      "id": 6,
      "name": "Places of Worship",
      "image":
          "https://images.unsplash.com/photo-1520311634477-e500298a8911?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1674&q=80"
    },
    {
      "id": 15,
      "name": "River",
      "image":
          "https://images.unsplash.com/photo-1423245617392-005724ca6338?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2101&q=80"
    },
    {
      "id": 2,
      "name": "Shopping Center",
      "image":
          "https://images.unsplash.com/photo-1481437156560-3205f6a55735?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2095&q=80"
    },
    {
      "id": 12,
      "name": "Spa",
      "image":
          "https://images.unsplash.com/photo-1596178060671-7a80dc8059ea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80"
    },
    {
      "id": 14,
      "name": "Sport",
      "image":
          "https://images.unsplash.com/photo-1517649763962-0c623066013b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
    },
    {
      "id": 17,
      "name": "Waterfall",
      "image":
          "https://images.unsplash.com/photo-1482685945432-29a7abf2f466?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2089&q=80"
    }
  ];

  @override
  void onInit() {
    super.onInit();
    getListDataPlaces();
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
        "https://vistr-capstone.et.r.appspot.com/place/get-all-place?page=1&limit=10",
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
        listDataPlaces = response.data["places"];
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

  getListDataPlacesByKeyword() async {
    print("User Token : ${box.read('userToken')} ");
    print("User Exist ?  : ${box.read('isUserExist')} ");

    try {
      print("get list data places");
      var response = await Dio().get(
        "https://vistr-capstone.et.r.appspot.com/place/get-all-place?page=1&limit=10",
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
        listDataPlaces = response.data["places"];
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

  getListDataPopularPlaces() async {
    print("User Token : ${box.read('userToken')} ");
    print("User Exist ?  : ${box.read('isUserExist')} ");

    try {
      print("get list data places");
      var response = await Dio().get(
        "https://vistr-capstone.et.r.appspot.com/place/get-popular-place",
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
        listDataPlaces = response.data["places"];
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

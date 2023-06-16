import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vistr/app/modules/home/views/home_view.dart';
import 'package:vistr/app/modules/login/views/login_view.dart';

import '../../../data/app_theme.dart';

class ItemChoice {
  final int id;
  final String label;
  final IconData icon;

  ItemChoice(this.id, this.label, this.icon);
}

class ItemFilter {
  final int id;
  final String name;
  RxBool isFilterActive;

  ItemFilter(this.id, this.name, this.isFilterActive);
}

class PrefController extends GetxController
    with GetSingleTickerProviderStateMixin {
  GetStorage box = GetStorage();
  var userLat;
  var userCity;
  var userAddress;
  var userLong;
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'Activity'),
    new Tab(text: 'Category'),
    new Tab(text: 'Location'),
  ];

  late TabController tabController;
  RxInt tabIndex = 0.obs;

  var listChoices = [
    ItemChoice(1, 'Indoor', Icons.home),
    ItemChoice(2, 'Outdoor', Icons.forest),
  ];

  RxInt idSelected = 0.obs;
  RxString activitySelected = "".obs;

  List listFilter = [];
  RxBool isListFilterExist = false.obs;

  List<ItemFilter> selectedItem = [];

  @override
  void onInit() {
    super.onInit();
    tabController = new TabController(vsync: this, length: myTabs.length);
    tabController.addListener(handleTabSelection);
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

  handleTabSelection() {
    tabIndex.value = tabController.index;
    print(tabIndex.value);
  }

  getListDataPlaces() async {
    print("User Token : ${box.read('userToken')} ");
    print("User Exist ?  : ${box.read('isUserExist')} ");

    try {
      print("get list data places");
      var response = await Dio().get(
        "https://vistr-capstone.et.r.appspot.com/place/get-all-category",
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
        response.data["places"].map((place) {
          print("place :$place");
          if (place["name"] != "") {
            listFilter.add(ItemFilter(place["id"], place["name"], false.obs));
          }
        }).toList();
        isListFilterExist = true.obs;
        print("list filter : $listFilter");
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

  postPref(context) async {
    print("User Token : ${box.read('userToken')}");
    print("Selected Category : ${selectedItem}");
    print("Activity : ${activitySelected}");
    print("Lat : ${userLat}, Long : ${userLong}");

    String dataString = "";

    for (var i = 0; i < selectedItem.length; i++) {
      dataString += selectedItem[i].name;

      // Tambahkan tanda koma jika belum mencapai elemen terakhir
      if (i < selectedItem.length - 1) {
        dataString += ",";
      }
    }

    print("data String : $dataString");

    AppMainTheme.showLoading(info: 'register');

    try {
      var response = await Dio().post(
          "https://vistr-capstone.et.r.appspot.com/user/post-pref-user",
          options: Options(
              followRedirects: false,
              validateStatus: (status) => true,
              headers: {"token": "${box.read('userToken')}"}),
          data: {
            'city': userCity,
            'place_activity': activitySelected.value,
            'place_category': dataString,
            'latitude': userLat,
            'longitude': userLong
          });

      print(response.data);
      int? statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        AppMainTheme.closeLoading();

        AppMainTheme.showSnackBar(context,
            title: "Berhasil Mengirim Data",
            desc: "Berhasil mengisi preferensi anda.",
            icon: Icons.done,
            iconColor: AppMainTheme.bluePrimary);
        // box.write('isUserExist', true);
        // box.write('userData', response.data['data']);
        // box.write('userToken', response.data['token']);
        // box.write('userRole', response.data['data']["role"]);
        // print("Is User Exist : ${box.read('isUserExist')}");
        // print("User Token : ${box.read('userToken')}");
        // print("User Role : ${box.read('userRole')}");
        box.write("isPrefExist", true);
        Get.offAll(HomeView());
      } else {
        AppMainTheme.closeLoading();
        print(response.data['message']);
        if (response.data['message'] == "Gagal Untuk Membuat User Pref") {
          updatePref(context);
        } else
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

  updatePref(context) async {
    print("User Token : ${box.read('userToken')}");
    print("Selected Category : ${selectedItem}");
    print("Activity : ${activitySelected}");
    print("Lat : ${userLat}, Long : ${userLong}");

    String dataString = "";

    for (var i = 0; i < selectedItem.length; i++) {
      dataString += selectedItem[i].name;

      // Tambahkan tanda koma jika belum mencapai elemen terakhir
      if (i < selectedItem.length - 1) {
        dataString += ",";
      }
    }

    print("data String : $dataString");

    AppMainTheme.showLoading(info: 'register');

    try {
      var response = await Dio().put(
          "https://vistr-capstone.et.r.appspot.com/user/edit-pref-user",
          options: Options(
              followRedirects: false,
              validateStatus: (status) => true,
              headers: {"token": "${box.read('userToken')}"}),
          data: {
            'city': userCity,
            'place_activity': activitySelected.value,
            'place_category': dataString,
            'latitude': userLat,
            'longitude': userLong
          });

      print(response.data);
      int? statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        AppMainTheme.closeLoading();

        AppMainTheme.showSnackBar(context,
            title: "Berhasil Mengirim Data",
            desc: "Berhasil mengisi preferensi anda.",
            icon: Icons.done,
            iconColor: AppMainTheme.bluePrimary);
        // box.write('isUserExist', true);
        // box.write('userData', response.data['data']);
        // box.write('userToken', response.data['token']);
        // box.write('userRole', response.data['data']["role"]);
        // print("Is User Exist : ${box.read('isUserExist')}");
        // print("User Token : ${box.read('userToken')}");
        // print("User Role : ${box.read('userRole')}");
        box.write("isPrefExist", true);
        Get.offAll(HomeView());
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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

  final listChoices = [
    ItemChoice(1, 'Indoor', Icons.home),
    ItemChoice(2, 'Outdoor', Icons.forest),
  ];

  RxInt idSelected = 0.obs;

  final listFilter = [
    ItemFilter(1, 'Belanja', false.obs),
    ItemFilter(2, 'Wisata', false.obs),
    ItemFilter(3, 'Kuliner', false.obs),
    ItemFilter(4, 'Hiburan', false.obs),
    ItemFilter(5, 'Belanja', false.obs),
    ItemFilter(6, 'Wisata', false.obs),
    ItemFilter(7, 'Kuliner', false.obs),
    ItemFilter(8, 'Jambret', false.obs),
  ];

  List<ItemFilter> selectedItem = [];

  @override
  void onInit() {
    super.onInit();
    tabController = new TabController(vsync: this, length: myTabs.length);
    tabController.addListener(handleTabSelection);
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
}

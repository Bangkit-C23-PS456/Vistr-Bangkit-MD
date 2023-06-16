import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:vistr/app/data/app_theme.dart';
import 'package:vistr/app/modules/pref/controllers/pref_controller.dart';

import '../controllers/pick_location_controller.dart';

class PickLocationView extends GetView<PickLocationController> {
  const PickLocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PickLocationController controller = Get.put(PickLocationController());
    PrefController prefController = Get.find<PrefController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Lokasi'),
        centerTitle: true,
        backgroundColor: AppMainTheme.bluePrimary,
      ),
      body: FlutterLocationPicker(
          mapLoadingBackgroundColor: AppMainTheme.bluePrimary,
          locationButtonBackgroundColor: AppMainTheme.bluePrimary,
          zoomButtonsBackgroundColor: AppMainTheme.bluePrimary,
          selectLocationButtonStyle: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(AppMainTheme.bluePrimary),
          ),
          initZoom: 11,
          minZoomLevel: 5,
          maxZoomLevel: 16,
          trackMyPosition: true,
          searchBarBackgroundColor: Colors.white,
          mapLanguage: 'ar',
          onError: (e) => print(e),
          onPicked: (pickedData) {
            print("picked data : $pickedData");
            print("picked data addressdata : ${pickedData.addressData}");
            print("picked data : ${pickedData.addressData}");

            prefController.userAddress = pickedData.address;
            prefController.userCity = pickedData.addressData['city'];
            prefController.userLat = pickedData.latLong.latitude;
            prefController.userLong = pickedData.latLong.longitude;
            prefController.update();

            print(pickedData.latLong.latitude);
            print(pickedData.latLong.longitude);
            print(pickedData.address);
            print(pickedData.addressData['country']);
            Get.back();
          }),
    );
  }
}

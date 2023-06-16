import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

import '../../../data/app_theme.dart';
import '../controllers/pick_city_controller.dart';

class PickCityView extends GetView<PickCityController> {
  const PickCityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PickCityController controller = Get.put(PickCityController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Tujuanmu'),
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

            print(pickedData.latLong.latitude);
            print(pickedData.latLong.longitude);
            print(pickedData.address);
            print(pickedData.addressData['city']);

            controller.userLat.value = pickedData.latLong.latitude;
            controller.userLng.value = pickedData.latLong.longitude;
            controller.getDataItenerary();
          }),
    );
  }
}

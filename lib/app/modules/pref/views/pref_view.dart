import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:vistr/app/data/app_theme.dart';
import 'package:vistr/app/modules/home/views/home_view.dart';
import 'package:vistr/app/modules/pickLocation/views/pick_location_view.dart';

import '../../widgets/pref_indicator_widget.dart';
import '../controllers/pref_controller.dart';

class PrefView extends GetView<PrefController> {
  const PrefView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PrefController controller = Get.put(PrefController());
    var isFilterActive = controller.listFilter
        .where((element) => element.isFilterActive.value)
        .isNotEmpty;

    print(
        "${controller.userAddress}, ${controller.userCity}, ${controller.userLat}, ${controller.userLong}");
    controller.update();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100, // Set this height
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => controller.tabIndex.value != 0
                          ? IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppMainTheme.bluePrimary,
                                size: 25,
                              ),
                              onPressed: () {
                                controller.tabController.index == 2
                                    ? controller.tabController.index = 1
                                    : controller.tabController.index = 0;
                              })
                          : SizedBox(
                              width: 30,
                              height: 30,
                            ),
                    ),
                    Text(
                      "Preference",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppMainTheme.bluePrimary),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 40,
                child: OnboardingIndicatorWidget(
                  tabController: controller.tabController,
                  tabIndex: controller.tabIndex,
                ),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
        body: TabBarView(controller: controller.tabController, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Aktivitas\nyang Kamu\nSukai!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: AppMainTheme.bluePrimary),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Apakah kamu lebih suka aktivitas di luar ruangan (outdoor) atau di dalam ruangan (indoor)?",
                  style:
                      TextStyle(fontSize: 20, color: AppMainTheme.bluePrimary),
                ),
                SizedBox(
                  height: 40,
                ),
                Obx(
                  () => Wrap(
                    children: controller.listChoices
                        .map((e) => ChoiceChip(
                            label: Container(
                              width: 150,
                              height: 60,
                              child: Center(
                                child: Text(
                                  e.label,
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: controller.idSelected.value == e.id
                                          ? Colors.white
                                          : AppMainTheme.bluePrimary),
                                ),
                              ),
                            ),
                            avatar: InkWell(
                              onTap: () {},
                              child: Icon(
                                size: 30,
                                e.icon,
                                color: controller.idSelected.value == e.id
                                    ? Colors.white
                                    : AppMainTheme.bluePrimary,
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: AppMainTheme.bluePrimary)),
                            selectedColor: AppMainTheme.bluePrimary,
                            selected: controller.idSelected.value == e.id,
                            onSelected: (_) =>
                                controller.idSelected.value = e.id))
                        .toList(),
                    runSpacing: 20,
                  ),
                ),
                Spacer(),
                Obx(
                  () => SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 50,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          if (controller.idSelected.value != 0) {
                            if (controller.idSelected.value == 1) {
                              controller.activitySelected.value = "Indoor";
                            } else {
                              controller.activitySelected.value = "Outdoor";
                            }
                            print(controller.activitySelected.value);
                            controller.tabController.index = 1;
                          }
                        },
                        child: Container(
                          width: 148,
                          height: 60,
                          child: Center(
                            child: Text(
                              controller.tabIndex != 2
                                  ? "Selanjutnya"
                                  : "Mulai",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: controller.idSelected.value != 0
                                  ? AppMainTheme.bluePrimary
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Tujuan\nWisatamu!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: AppMainTheme.bluePrimary),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Pilih Kategori\n(maksimal 5 pilihan)",
                  style:
                      TextStyle(fontSize: 20, color: AppMainTheme.bluePrimary),
                ),
                SizedBox(
                  height: 40,
                ),
                GetX<PrefController>(
                  builder: (_) => controller.isListFilterExist.value
                      ? Wrap(
                          children: controller.listFilter
                              .map((e) => FilterChip(
                                  label: Text(
                                    e.name,
                                    style: TextStyle(
                                        color: e.isFilterActive.value
                                            ? Colors.white
                                            : AppMainTheme.bluePrimary),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: AppMainTheme.bluePrimary)),
                                  selectedColor: AppMainTheme.bluePrimary,
                                  selected: e.isFilterActive.value,
                                  onSelected: (_) {
                                    if (controller.selectedItem.length == 5) {
                                      if (controller.selectedItem.contains(e)) {
                                        controller.selectedItem.remove(e);
                                        e.isFilterActive.value =
                                            !e.isFilterActive.value;
                                      } else {
                                        AppMainTheme.showSnackBar(context,
                                            title: "Oops..",
                                            desc:
                                                'Maksimal 5 kategori dipilih!',
                                            icon: Icons.close,
                                            iconColor: AppMainTheme.redPrimary);
                                      }
                                    } else {
                                      e.isFilterActive.value =
                                          !e.isFilterActive.value;
                                      if (controller.selectedItem.contains(e)) {
                                        controller.selectedItem.remove(e);
                                      } else {
                                        controller.selectedItem.add(e);
                                      }
                                    }

                                    print(controller.selectedItem[0].name);
                                    controller.update();
                                  }))
                              .toList(),
                          spacing: 8,
                        )
                      : Container(),
                ),
                Spacer(),
                GetBuilder<PrefController>(
                    builder: (_) => SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: 50,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            if (controller.selectedItem.length != 0) {
                              controller.tabController.index = 2;
                            }
                          },
                          child: Container(
                            width: 148,
                            height: 60,
                            child: Center(
                              child: Text(
                                controller.tabIndex != 2
                                    ? "Selanjutnya"
                                    : "Mulai",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: controller.selectedItem.length != 0
                                    ? AppMainTheme.bluePrimary
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ))),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rekomendasi\nWisata Terbaik\nuntuk Anda!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: AppMainTheme.bluePrimary),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Masukkan Lokasi Saat Ini untuk Pengalaman Wisata yang Tak Terlupakan",
                  style:
                      TextStyle(fontSize: 20, color: AppMainTheme.bluePrimary),
                ),
                SizedBox(
                  height: 40,
                ),
                GetBuilder<PrefController>(
                    builder: (_) => controller.userAddress != ""
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Alamat",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(controller.userAddress != null
                                  ? "${controller.userAddress}"
                                  : "Belum memilih"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Kota",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(controller.userCity != null
                                  ? "${controller.userCity}"
                                  : "Belum memilih"),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : Container()),
                TextButton(
                    child: Text("Pilih titik lokasi",
                        style: TextStyle(fontSize: 14)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            AppMainTheme.bluePrimary),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: AppMainTheme.bluePrimary)))),
                    onPressed: () => Get.to(PickLocationView())),
                Spacer(),
                GetBuilder<PrefController>(
                  builder: (_) => SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 50,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          if (controller.userCity != null) {
                            controller.postPref(context);
                          }
                        },
                        child: Container(
                          width: 148,
                          height: 60,
                          child: Center(
                            child: Text(
                              controller.tabIndex != 2
                                  ? "Selanjutnya"
                                  : "Mulai",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: controller.userCity != null
                                  ? AppMainTheme.bluePrimary
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ]));
  }
}

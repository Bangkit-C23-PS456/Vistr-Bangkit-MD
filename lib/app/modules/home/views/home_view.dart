import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vistr/app/data/app_theme.dart';
import 'package:vistr/app/modules/category_place/views/category_place_view.dart';
import 'package:vistr/app/modules/detail_place/views/detail_place_view.dart';
import 'package:vistr/app/modules/itinerary/views/itinerary_view.dart';
import 'package:vistr/app/modules/pickLocation/views/pick_location_view.dart';
import 'package:vistr/app/modules/pick_city/views/pick_city_view.dart';
import 'package:vistr/app/modules/setting/views/setting_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController controler = Get.put(HomeController());
    return Scaffold(
        backgroundColor: Color(0xFFF7F6F9),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Vistr',
            style: TextStyle(
                color: AppMainTheme.bluePrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(SettingView());
                },
                icon: Icon(
                  Icons.settings,
                  color: AppMainTheme.bluePrimary,
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.map),
          backgroundColor: AppMainTheme.bluePrimary,
          onPressed: () {
            Get.to(PickCityView());
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 60,
                //   child: TextField(
                //     onChanged: (val) {
                //       print(val);
                //     },
                //     style: TextStyle(color: Colors.black, fontSize: 14),
                //     decoration: InputDecoration(
                //         prefixIcon: Icon(Icons.search),
                //         // contentPadding: EdgeInsets.all(10.0),
                //         enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10.0),
                //           // width: 0.0 produces a thin "hairline" border
                //           borderSide:
                //               BorderSide(color: Color(0xFFE7E9EB), width: 1),
                //         ),
                //         focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10.0),
                //           // width: 0.0 produces a thin "hairline" border
                //           borderSide:
                //               BorderSide(color: Color(0xFF018386), width: 1),
                //         ),
                //         filled: true,
                //         hintStyle: TextStyle(color: Colors.black),
                //         floatingLabelBehavior: FloatingLabelBehavior.auto,
                //         labelText: 'Cari tujuanmu',
                //         fillColor: Color(0xFFF7F6F9)),
                //   ),
                // ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 30,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: controller.listDataCategory.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.pickedCategory.value =
                                  controller.listDataCategory[index];
                              if (controller.pickedCategory.value ==
                                  "Populer") {
                                controller.getListDataPopularPlaces();
                              }
                              if (controller.pickedCategory.value ==
                                  "Rekomendasi") {
                                controller.getListDataPlaces();
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: controler.pickedCategory.value ==
                                              controller.listDataCategory[index]
                                          ? BorderSide(
                                              color: Color(0xFF018386),
                                              width: 2)
                                          : BorderSide.none)),
                              margin: EdgeInsets.only(right: 25),
                              child: Text(
                                controller.listDataCategory[index],
                                style: TextStyle(
                                  color: controler.pickedCategory.value ==
                                          controller.listDataCategory[index]
                                      ? Color(0xFF018386)
                                      : Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 25,
                ),
                GetBuilder<HomeController>(
                  builder: (_) => Obx(() => controller
                          .isListDataPlacesExist.value
                      ? SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: 240,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 1.0,
                              enlargeCenterPage: true,
                              viewportFraction: 0.6,
                            ),
                            items: controler.listDataPlaces
                                .map((item) => GestureDetector(
                                      onTap: () {
                                        Get.to(() => DetailPlaceView(),
                                            arguments: item);
                                      },
                                      child: SizedBox(
                                        width: 220,
                                        height: 240,
                                        child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              Container(
                                                  clipBehavior: Clip.hardEdge,
                                                  width: 220,
                                                  height: 240,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Image.network(
                                                    item["photos"].length != 0
                                                        ? item["photos"][0]
                                                                    ["url"] !=
                                                                ""
                                                            ? "${item["photos"][0]["url"]}"
                                                            : "http://via.placeholder.com/220x240"
                                                        : "http://via.placeholder.com/220x240",
                                                    fit: BoxFit.cover,
                                                  )),
                                              Container(
                                                height: 220,
                                                width: 240,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 180,
                                                        child: Text(
                                                          "${item["place_name"]}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Container(
                                                        width: 190,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 16,
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  width: 100,
                                                                  height: 25,
                                                                  child: Text(
                                                                    "${item["city"]["name"]}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .white),
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 50,
                                                              height: 25,
                                                              decoration: BoxDecoration(
                                                                  color: AppMainTheme
                                                                      .bluePrimary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 16,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    "${item["rating"]}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .white),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ))
                                            ]),
                                      ),
                                    ))
                                .toList(),
                          ),
                        )
                      : Container()),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Kategori",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppMainTheme.bluePrimary),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 130,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: controller.listDataPlaceCategory.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => CategoryPlaceView(),
                                arguments:
                                    controller.listDataPlaceCategory[index]);
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 130,
                                height: 130,
                                child: Stack(fit: StackFit.expand, children: [
                                  Container(
                                      clipBehavior: Clip.hardEdge,
                                      width: 130,
                                      height: 130,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.network(
                                        "${controller.listDataPlaceCategory[index]["image"]}",
                                        fit: BoxFit.cover,
                                      )),
                                  Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Container(
                                        width: 100,
                                        child: Text(
                                          "${controller.listDataPlaceCategory[index]["name"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                ]),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}

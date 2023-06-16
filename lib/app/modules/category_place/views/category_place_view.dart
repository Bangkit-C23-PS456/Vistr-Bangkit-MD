import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vistr/app/data/app_theme.dart';

import '../../detail_place/views/detail_place_view.dart';
import '../controllers/category_place_controller.dart';

class CategoryPlaceView extends GetView<CategoryPlaceController> {
  const CategoryPlaceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CategoryPlaceController controller = Get.put(CategoryPlaceController());
    print("DataCategory : ${controller.dataCategory}");
    controller.getListDataPlaces();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('${controller.dataCategory["name"]}'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 100,
              child: Stack(children: [
                Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 100,
                    decoration: BoxDecoration(),
                    child: Image.network(
                      "${controller.dataCategory["image"]}",
                      fit: BoxFit.cover,
                    )),
                Container(
                  height: 100,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Text(
                "List Tempat",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppMainTheme.bluePrimary),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<CategoryPlaceController>(
              builder: (_) => Obx(() => controller.isListDataPlacesExist.value
                  ? SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height - 100 - 80,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: controller.listDataPlaces.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => DetailPlaceView(),
                                    arguments:
                                        controller.listDataPlaces[index]);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                width: 220,
                                height: 240,
                                child: Stack(fit: StackFit.expand, children: [
                                  Container(
                                      clipBehavior: Clip.hardEdge,
                                      width: 220,
                                      height: 240,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.network(
                                        controller
                                                    .listDataPlaces[index]
                                                        ["photos"]
                                                    .length !=
                                                0
                                            ? controller.listDataPlaces[index]
                                                        ["photos"][0]["url"] !=
                                                    ""
                                                ? "${controller.listDataPlaces[index]["photos"][0]["url"]}"
                                                : "http://via.placeholder.com/220x240"
                                            : "http://via.placeholder.com/220x240",
                                        fit: BoxFit.cover,
                                      )),
                                  Container(
                                    height: 220,
                                    width: 240,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width -
                                                60,
                                            child: Text(
                                              "${controller.listDataPlaces[index]["place_name"]}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.white),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width -
                                                60,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      color: Colors.white,
                                                      size: 16,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      height: 25,
                                                      child: Text(
                                                        "${controller.listDataPlaces[index]["city"]["name"]}",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
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
                                                          BorderRadius.circular(
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
                                                        color: Colors.white,
                                                        size: 16,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "${controller.listDataPlaces[index]["rating"]}",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
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
                            );
                          }))
                  : Container()),
            ),
          ],
        ));
  }
}

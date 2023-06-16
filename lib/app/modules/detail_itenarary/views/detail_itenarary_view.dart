import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:vistr/app/modules/detail_hotel/views/detail_hotel_view.dart';
import 'package:vistr/app/modules/detail_place/views/detail_place_view.dart';
import 'package:vistr/app/modules/detail_restaurant/views/detail_restaurant_view.dart';

import '../../../data/app_theme.dart';
import '../../../data/humanize_int.dart';
import '../controllers/detail_itenarary_controller.dart';

class DetailItenararyView extends GetView<DetailItenararyController> {
  const DetailItenararyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DetailItenararyController controller = Get.put(DetailItenararyController());
    print("Data Detail Itenerary : ${controller.dataItenarary}");
    controller.dataPlace =
        controller.dataItenarary[0]["place_recommendation"][0];
    controller.dataHotels = controller.dataItenarary[1]["hotel_recommendation"];
    controller.dataRestaurants =
        controller.dataItenarary[2]["restaurant_recommendation"];
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Detail Place'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(fit: StackFit.loose, children: [
                Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 360,
                    child: Image.network(
                      controller.dataPlace["photo"] != ""
                          ? "${controller.dataPlace["photo"]["images"]["original"]["url"]}"
                          : "http://via.placeholder.com/360x360",
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                  ),
                )
              ]),
              Container(
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width - 120,
                            child: Text(
                              "${controller.dataPlace["place_name"]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${controller.dataPlace["rating"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppMainTheme.bluePrimary,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${controller.dataPlace["city"]}",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.attach_money_rounded,
                                color: AppMainTheme.bluePrimary,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${humanizeInt(controller.dataPlace["min_price"])} - ${humanizeInt(controller.dataPlace["max_price"])}",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Deskripsi",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${controller.dataPlace["description"] != "" ? controller.dataPlace["description"] : "Tidak ada deskripsi."}",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Jam Buka",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller
                              .dataPlace["opening_hours"]["week_ranges"].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${controller.dataPlace["opening_hours"]["week_ranges"][index][0]["day"] != null ? controller.dataPlace["opening_hours"]["week_ranges"][index][0]["day"] : "-"}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " ${controller.dataPlace["opening_hours"]["week_ranges"][index][0]["open_time"] != 0 ? int.parse(controller.dataPlace["opening_hours"]["week_ranges"][index][0]["open_time"].toString().replaceAll("0", "")).toStringAsFixed(2) : 0} - ${int.parse(controller.dataPlace["opening_hours"]["week_ranges"][index][0]["close_time"].toString().replaceAll("0", "")).toStringAsFixed(2)}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            );
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Penginapan",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: 130,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.dataHotels.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => DetailHotelView(),
                                      arguments: controller.dataHotels[index]);
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      height: 130,
                                      child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Container(
                                                clipBehavior: Clip.hardEdge,
                                                width: 130,
                                                height: 130,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Image.network(
                                                  "${controller.dataHotels[index]["image"]}",
                                                  fit: BoxFit.cover,
                                                )),
                                            Container(
                                              height: 130,
                                              width: 130,
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
                                                child: Container(
                                                  width: 100,
                                                  child: Text(
                                                    "${controller.dataHotels[index]["hotel_name"]}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Restoran",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: 130,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.dataRestaurants.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => DetailRestaurantView(),
                                      arguments:
                                          controller.dataRestaurants[index]);
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      height: 130,
                                      child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Container(
                                                clipBehavior: Clip.hardEdge,
                                                width: 130,
                                                height: 130,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Image.network(
                                                  "${controller.dataRestaurants[index]["image"] != null ? controller.dataRestaurants[index]["image"] : "http://via.placeholder.com/130x130"}",
                                                  fit: BoxFit.cover,
                                                )),
                                            Container(
                                              height: 130,
                                              width: 130,
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
                                                child: Container(
                                                  width: 100,
                                                  child: Text(
                                                    "${controller.dataRestaurants[index]["restaurant_name"]}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width - 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF018386),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        MapsLauncher.launchCoordinates(
                            controller.dataPlace["latitude"],
                            controller.dataPlace["longitude"],
                            '${controller.dataPlace["place_name"]} are here');
                      },
                      child: Text(
                        "Google Maps",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}

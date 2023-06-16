import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:vistr/app/data/app_theme.dart';
import 'package:vistr/app/data/humanize_int.dart';

import '../controllers/detail_place_controller.dart';

class DetailPlaceView extends GetView<DetailPlaceController> {
  const DetailPlaceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DetailPlaceController controller = Get.put(DetailPlaceController());
    print("Data Place : ${controller.dataPlace}");
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
                      controller.dataPlace["photos"].length != 0
                          ? "${controller.dataPlace["photos"][0]["url"]}"
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
                                "${controller.dataPlace["city"]["name"]}",
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
                        "${controller.dataPlace["description"]}",
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
                          itemCount:
                              controller.dataPlace["openingHours"].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${controller.dataPlace["openingHours"][index]["day"]}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " ${controller.dataPlace["openingHours"][index]["openTime"] != 0 ? int.parse(controller.dataPlace["openingHours"][index]["openTime"].toString().replaceAll("0", "")).toStringAsFixed(2) : 0} - ${int.parse(controller.dataPlace["openingHours"][index]["closeTime"].toString().replaceAll("0", "")).toStringAsFixed(2)}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            );
                          }),
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

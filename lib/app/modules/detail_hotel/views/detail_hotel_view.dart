import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../../../data/app_theme.dart';
import '../../../data/humanize_int.dart';
import '../controllers/detail_hotel_controller.dart';

class DetailHotelView extends GetView<DetailHotelController> {
  const DetailHotelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DetailHotelController controller = Get.put(DetailHotelController());
    print("Data Hotel : ${controller.dataHotel}");
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Detail Hotel'),
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
                      controller.dataHotel["image"] != null
                          ? "${controller.dataHotel["image"]}"
                          : "http://via.Hotelholder.com/360x360",
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
                              "${controller.dataHotel["hotel_name"]}",
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
                                "${controller.dataHotel["rating"]}",
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
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppMainTheme.bluePrimary,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width - 100,
                            child: Text(
                              "${controller.dataHotel["address"]}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.attach_money_rounded,
                            color: AppMainTheme.bluePrimary,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${humanizeInt(controller.dataHotel["min_price"])} - ${humanizeInt(controller.dataHotel["max_price"])}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Kontak",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.public),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width - 100,
                            child: Text(
                              "${controller.dataHotel["website"]}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${controller.dataHotel["contact_number"]}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
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
                            controller.dataHotel["latitude"],
                            controller.dataHotel["longitude"],
                            '${controller.dataHotel["Hotel_name"]} are here');
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

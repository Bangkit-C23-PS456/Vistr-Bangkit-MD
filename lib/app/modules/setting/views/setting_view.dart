import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vistr/app/data/app_theme.dart';
import 'package:vistr/app/modules/pref/views/pref_view.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    controller.getDataProfile();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppMainTheme.bluePrimary,
        title: const Text('Pengaturan'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GetBuilder<SettingController>(
                builder: (_) => Obx(() => controller.isDataProfileIsExist.value
                    ? ListTile(
                        title: Text(
                          '${controller.dataProfile["name"]}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('${controller.dataProfile["email"]}'),
                      )
                    : Container()),
              ),

              Divider(),
              ListTile(
                leading: const Icon(Icons.map),
                title: const Text('Ubah Preferensi'),
                trailing: IconButton(
                    onPressed: () {
                      Get.to(PrefView());
                    },
                    icon: Icon(Icons.keyboard_arrow_right_rounded)),
              ),
              // Obx(
              //   () => ListTile(
              //     enabled: controller.enabled.value,

              //     // This sets text color and icon color to red when list tile is disabled and
              //     // green when list tile is selected, otherwise sets it to black.
              //     iconColor: MaterialStateColor.resolveWith(
              //         (Set<MaterialState> states) {
              //       if (states.contains(MaterialState.disabled)) {
              //         return Colors.red;
              //       }

              //       return Colors.black;
              //     }),
              //     // This sets text color and icon color to red when list tile is disabled and
              //     // green when list tile is selected, otherwise sets it to black.
              //     textColor: MaterialStateColor.resolveWith(
              //         (Set<MaterialState> states) {
              //       if (states.contains(MaterialState.disabled)) {
              //         return Colors.red;
              //       }

              //       return Colors.black;
              //     }),
              //     leading: const Icon(Icons.bedtime_outlined),
              //     title: const Text('Dark Mode'),

              //     trailing: Switch(
              //       onChanged: (bool? value) {
              //         // This is called when the user toggles the switch.

              //         controller.enabled.value = value!;
              //       },
              //       value: controller.enabled.value,
              //     ),
              //   ),
              // ),
              // Divider(),
              ListTile(
                onTap: () {
                  controller.logOut(context);
                },
                leading: const Icon(
                  Icons.output_rounded,
                  color: Colors.red,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )),
    );
  }
}

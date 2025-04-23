import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'dial_main_logic.dart';

class DialMainPage extends StatefulWidget {
  const DialMainPage({Key? key}) : super(key: key);

  @override
  State<DialMainPage> createState() => _DialMainPageState();
}

class _DialMainPageState extends State<DialMainPage> {
  DialMainLogic controller = Get.find();

  void checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
     Get.toNamed('/dialStart');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkNetwork();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DialMainLogic>(builder: (_) {
        return SafeArea(
            child: <Widget>[
              <Widget>[
                Image.asset(
                  'assets/bg${controller.type}.webp',
                  width: controller.bgwList[controller.type],
                  height: controller.bghList[controller.type],
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: controller.mOffSetY[controller.type],
                  left: controller.mOffSetX[controller.type],
                  child: Transform.rotate(
                    angle: controller.minuteAngle,
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/m${controller.type}.webp',
                      width: controller.mwList[controller.type],
                      height: controller.mhList[controller.type],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: controller.hOffSetY[controller.type],
                  left: controller.hOffSetX[controller.type],
                  child: Transform.rotate(
                    angle: controller.hourAngle,
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/h${controller.type}.webp',
                      width: controller.hwList[controller.type],
                      height: controller.hhList[controller.type],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ].toStack(alignment: Alignment.center),
              const SizedBox(
                height: 90,
              ),
              <Widget>[
                Obx(() {
                  return Text(
                    controller.weekHMDStr.value,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  );
                }),
                Obx(() {
                  return Text(
                    controller.hmAPMStr.value,
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  );
                })
              ].toColumn(),
              const SizedBox(
                height: 120,
              ),
              Container(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: <Widget>[
                  const Text(
                    'Program Settings',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    size: 25,
                    color: Colors.grey,
                  )
                ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
              )
                  .decorated(
                  color: const Color(0xfff5f5f5),
                  borderRadius: BorderRadius.circular(10))
                  .marginSymmetric(horizontal: 20)
                  .gestures(onTap: () {
                Get.toNamed('/dialSetting', arguments: controller.type)
                    ?.then((value) {
                  controller.startTimer();
                });
              })
            ].toColumn(mainAxisAlignment: MainAxisAlignment.end));
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

import 'dial_setting_logic.dart';

class DialSettingPage extends GetView<DialSettingLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      appBar: AppBar(
        title: const Text('Program Settings'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<DialSettingLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return Container(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          'assets/bg$index.webp',
                          fit: BoxFit.cover,
                        ),
                      )
                          .decorated(
                              color: controller.type == index
                                  ? const Color(0xffefefef)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: controller.type == index
                                  ? Border.all(color: const Color(0xffe5e5e5))
                                  : null)
                          .gestures(onTap: () async {
                        controller.type = index;
                        controller.update();
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setInt('type', index);
                      });
                    }),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: <Widget>[
                  const Text(
                    'Version',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const Text("1.0.0").paddingOnly(right: 10)
                ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
              )
                  .decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10))
                  .gestures(onTap: () {
                controller.aboutDialUS(context);
              })
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}

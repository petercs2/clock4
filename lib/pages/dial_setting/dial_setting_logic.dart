import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DialSettingLogic extends GetxController {

  int type = Get.arguments;

  aboutDialUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 71,
        height: 71,
      ),
      children: [
        const Text(
            """We can show you the dial"""),
      ],
      context: context,
    );
  }

}

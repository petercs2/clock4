import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dial_libray_logic.dart';

class DialLibrayView extends GetView<DialLibrayLogic> {
  const DialLibrayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.dubuque.value
              ? CircularProgressIndicator(color: Colors.orange[400])
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.ufxrayn();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'dial_start_logic.dart';

class DialStartView extends GetView<DialStartLogic> {
  const DialStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network error'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            const SizedBox(
              height: 60,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Network abnormality, please refresh and try again',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 116,
              height: 44,
              alignment: Alignment.center,
              child: const Text('Reload',style: TextStyle(fontWeight: FontWeight.bold),),
            )
                .decorated(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1))
                .gestures(onTap: () {
              controller.checkNetwork();
            })
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}

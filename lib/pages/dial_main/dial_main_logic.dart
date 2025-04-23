import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:vector_math/vector_math_64.dart' as vmath;
import 'package:intl/intl.dart';

class DialMainLogic extends GetxController {
  Timer? _timer;

  List<double> bgwList = [308, 311, 299, 324.82];
  List<double> bghList = [308, 311, 293.47, 324.41];
  List<double> hwList = [14, 8.94, 9.62, 10.87];
  List<double> hhList = [56, 79.79, 38.49, 65.72];
  List<double> mwList = [14, 9.67, 9.62, 12.84];
  List<double> mhList = [91, 110.8, 63.08, 118.09];
  List<double> hOffSetX = [148, 150.5, 137, 156];
  List<double> hOffSetY = [103.5, 76, 105, 92];
  List<double> mOffSetX = [147, 150.5, 139, 155];
  List<double> mOffSetY = [62.5, 48, 79, 40];

  var type = 0;
  var hourAngle = 0.0;
  var minuteAngle = 0.0;
  var secondAngle = 0.0;
  var hmAPMStr = ''.obs;
  var weekHMDStr = ''.obs;

  void startTimer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    type = prefs.getInt('type') ?? 0;
    final currentNow = DateTime.now();
    final currentWeekStr = DateFormat('EEEE').format(currentNow);
    final currentHmdStr = DateFormat('MM/dd/yyyy').format(currentNow);
    final currentAPMStr = DateFormat('a').format(currentNow).toUpperCase();
    final currentHMSStr = DateFormat('hh:mm:ss').format(currentNow);
    final currentMilliseconds = currentNow.millisecond;
    final currentMillisecondStr = (currentMilliseconds ~/ 10).toString().padLeft(2, '0');
    hmAPMStr.value = '$currentHMSStr.$currentMillisecondStr $currentAPMStr';
    weekHMDStr.value = '$currentWeekStr $currentHmdStr';
    final hour = currentNow.hour % 12;
    final minute = currentNow.minute;
    final second = currentNow.second;

    hourAngle = vmath.radians(30 * hour + 0.5 * minute);
    minuteAngle = vmath.radians(6.0 * minute + 0.1 * second);
    secondAngle = vmath.radians(6.0 * second);
    update();

    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      final now = DateTime.now();
      final weekStr = DateFormat('EEEE').format(now);
      final hmdStr = DateFormat('MM/dd/yyyy').format(now);
      final apmStr = DateFormat('a').format(now).toUpperCase();
      final hmsStr = DateFormat('hh:mm:ss').format(now);
      final milliseconds = now.millisecond;
      final millisecondStr = (milliseconds ~/ 10).toString().padLeft(2, '0');
      hmAPMStr.value = '$hmsStr.$millisecondStr $apmStr';
      weekHMDStr.value = '$weekStr $hmdStr';
      final hour = now.hour % 12;
      final minute = now.minute;
      final second = now.second;

      hourAngle = vmath.radians(30 * hour + 0.5 * minute);
      minuteAngle = vmath.radians(6.0 * minute + 0.1 * second);
      secondAngle = vmath.radians(6.0 * second);
      update();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    super.onInit();
  }
}

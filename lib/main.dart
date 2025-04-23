import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:four_dial/pages/dial_libray/dial_libray_binding.dart';
import 'package:four_dial/pages/dial_libray/dial_libray_view.dart';
import 'package:four_dial/pages/dial_main/dial_main_binding.dart';
import 'package:four_dial/pages/dial_main/dial_main_view.dart';
import 'package:four_dial/pages/dial_setting/dial_setting_binding.dart';
import 'package:four_dial/pages/dial_setting/dial_setting_view.dart';
import 'package:four_dial/pages/dial_start/dial_start_binding.dart';
import 'package:four_dial/pages/dial_start/dial_start_view.dart';
import 'package:four_dial/tools/pro_dial_config.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color primaryColor = Colors.black;
Color bgColor = Colors.white;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final int? type = prefs.getInt('type');
  if (type == null) {
    await prefs.setInt('type', 0);
  }
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Pocket,
      initialRoute: '/dialLoad',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Pocket = [
  GetPage(name: '/dialLoad', page: () => const DialLibrayView(), binding: DialLibrayBinding()),
  GetPage(name: '/dialMain', page: () => const DialMainPage(), binding: DialMainBinding()),
  GetPage(name: '/dialMonth', page: () => const ProDialConfig()),
  GetPage(name: '/dialSetting', page: () => DialSettingPage(), binding: DialSettingBinding()),
  GetPage(name: '/dialStart', page: () => const DialStartView(), binding: DialStartBinding()),
];
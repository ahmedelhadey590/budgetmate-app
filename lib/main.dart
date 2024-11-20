import 'package:budgetmate/app/service/dio_helper.dart';
import 'package:budgetmate/app/service/shared_preferences_helper.dart';
import 'package:budgetmate/config/route/AppPages.dart';
import 'package:budgetmate/config/route/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

DioHelper dioHelper = DioHelper();
SharedPreferencesHelper prefs = SharedPreferencesHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.init();
  await dioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,
    );
  }
}

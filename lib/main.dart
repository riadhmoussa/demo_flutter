import 'package:flutter/material.dart';
import 'package:flutter_demo/routes/app_pages.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'modules/pets/bindings/home_binding.dart';
import 'modules/pets/ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: HomeBinding(),
      home: const HomePage(),
      getPages: AppPages.pages,
    );
  }
}

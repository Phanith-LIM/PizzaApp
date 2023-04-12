import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_food/pages/page_route.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: PageRouter.home,
      getPages: PageRouter.pages,
    );
  }
}
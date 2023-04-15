import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagesController extends GetxController {
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void onInit() {
    super.onInit();
  }
  final selectedIndex = 0.obs;
  void onSelected(int index) {
    selectedIndex.value = index;
  }
  static onOpenDrawer(){
    scaffoldKey.currentState!.openDrawer();
  }
}

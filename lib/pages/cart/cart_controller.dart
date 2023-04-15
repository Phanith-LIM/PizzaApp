import 'package:get/get.dart';

class CartController extends GetxController {
  final count = RxInt(0);

  void onCount(int value){
    count.value = value;
  }
}
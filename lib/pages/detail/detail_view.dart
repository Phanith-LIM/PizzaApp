import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_food/pages/detail/detail_controller.dart';
import 'package:lottie/lottie.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DetailController());
    return Obx(() {
      if(controller.isLoading.isFalse){
        return Scaffold(
          body: Center(
            child: Lottie.network(
              'https://assets5.lottiefiles.com/packages/lf20_kxsd2ytq.json',
              width: 100,
              height: 100,
            ),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
            title: Obx(() {
              final String name = controller.pizzaDetail.value == null ? "null" : controller.pizzaDetail.value!.name;
              return Text(name, style: const TextStyle(color: Colors.black));
            }),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black54,),
              onPressed: () => Get.back(),
            )
        ),
        body: const Center(
          child: Text('Detail'),
        ),
      );
    });
  }
}

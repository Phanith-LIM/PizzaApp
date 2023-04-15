import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_food/pages/detail/detail_model.dart';
import 'package:pizza_food/pages/detail/detail_respository.dart';

class DetailController extends GetxController{

  @override
  void onInit() {
    pizzaId.value = Get.parameters['id']!;
    getDetail();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
        containerOpacity.value -= 0.1;
      } else {
        containerOpacity.value += 0.1;
      }
      containerOpacity.value = containerOpacity.value.clamp(0.0, 1.0);
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  final pizzaId = RxString('');
  final pizzaDetail = Rx<PizzaDetail?>(null);
  final isLoading = RxBool(false);
  final isFavorite = RxBool(false);
  final showAddToCart = RxBool(true);
  final count = RxInt(0);
  final containerOpacity = 1.0.obs;
  final ScrollController scrollController = ScrollController();
  final IDetailRepository repository = DetailRepository();

  Future<void> getDetail() async{
    final result = await repository.getDetail(pizzaId.value);
    if (result == null) {
      pizzaDetail.value = PizzaDetail(
        name: "null",
        price: 0,
        star: 0,
        image: "null",
        time: 0,
        kal: 0,
        description: '',
      );
    }
    isLoading.value = true;
    pizzaDetail.value = result;
  }

  void onFavorite(){
    isFavorite.value = !isFavorite.value;
  }

  void onCount(int value){
    count.value = value;
  }
}
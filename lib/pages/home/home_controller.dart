import 'package:get/get.dart';
import 'package:pizza_food/pages/home/Home_model.dart';
import 'package:pizza_food/pages/home/home_repository.dart';

class HomeController extends GetxController {
  @override
  onInit() {
    getPizza();
    getSlide();
    super.onInit();
  }
  final IHomeRepository repository = HomeRepository();
  final listPizza = RxList<PizzaModel>();
  final listSlide = RxList<SlideModel>();
  final isLoading = false.obs;

  Future<void> getPizza() async {
    final data = await repository.getPizza();
    if(data == null) return;
    isLoading.value = true;
    listPizza.addAll(data);
  }

  Future<void> getSlide() async {
    final data = await repository.getSlide();
    if(data == null) return;
    isLoading.value = true;
    listSlide.addAll(data);
  }
}
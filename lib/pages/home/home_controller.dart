import 'package:get/get.dart';
import 'package:pizza_food/pages/home/Home_model.dart';
import 'package:pizza_food/pages/home/home_repository.dart';

class HomeController extends GetxController {
  @override
  onInit() {
    getPizza();
    super.onInit();
  }
  final IHomeRepository repository = HomeRepository();
  final listPizza = RxList<PizzaModel>();
  final isLoading = false.obs;

  Future<void> getPizza() async {
    final data = await repository.getPizza();
    if(data == null) return;
    isLoading.value = true;
    listPizza.addAll(data);
  }
}
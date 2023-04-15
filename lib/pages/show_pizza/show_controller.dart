import 'package:get/get.dart';
import 'package:pizza_food/pages/home/home_controller.dart';
import 'package:pizza_food/pages/show_pizza/show_repository.dart';
import '../home/Home_model.dart';

class ShowAllPizzaController extends GetxController {
  @override
  void onInit() {
    getPizza();
    super.onInit();
  }

  @override
  void onClose() {
    repository;
    listPizza;
    super.onClose();
  }
  final listPizza = RxList<PizzaModel>();
  final IShowRepository repository = ShowRepository();
  final isLoading = false.obs;


  Future<void> getPizza() async {
    final data = await repository.getPizza();
    if(data == null) return;
    isLoading.value = true;
    listPizza.addAll(data);
    listPizza.refresh();
  }
}
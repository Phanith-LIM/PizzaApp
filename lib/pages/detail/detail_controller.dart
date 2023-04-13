import 'package:get/get.dart';
import 'package:pizza_food/pages/detail/detail_model.dart';
import 'package:pizza_food/pages/detail/detail_respository.dart';

class DetailController extends GetxController{

  @override
  void onInit() {
    pizzaId.value = Get.parameters['id']!;
    getDetail();
    super.onInit();
  }

  final pizzaId = RxString('');
  final pizzaDetail = Rx<PizzaDetail?>(null);
  final isLoading = RxBool(false);
  final IDetailRepository repository = DetailRepository();

  Future<void> getDetail() async{
    final result = await repository.getDetail(pizzaId.value);
    if (result == null) {
      pizzaDetail.value = PizzaDetail(name: "null", price: 0, star: 0, image: "null");
    }
    isLoading.value = true;
    pizzaDetail.value = result;
  }
}
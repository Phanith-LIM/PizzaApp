import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pizza_food/pages/xcore.dart';

class ShowAllPizzaView extends GetView<ShowAllPizzaController> {
  const ShowAllPizzaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ShowAllPizzaController());
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black54,),
            onPressed: () => Get.back(),
          ),
          title: Text(
            "View All",
            style: kGoogleFont,
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(kPadding* 2),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: controller.listPizza.length,
          itemBuilder: (context, index) {
            final pizza = controller.listPizza[index];
            return InkWell(
              borderRadius: BorderRadius.circular(kRadius * 2),
              child: PizzaWidget(
                name: pizza.name,
                price: pizza.price,
                star: pizza.star,
                image: pizza.image,
              ),
              onTap: (){
                Get.toNamed(PageRouter.detail(pizza.id));
              },
            );
          },
        ),
      );
    });
  }
}

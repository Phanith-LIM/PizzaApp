
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_food/core/size.dart';
import 'package:get/get.dart';
import 'package:pizza_food/pages/cart/cart_controller.dart';
import 'package:pizza_food/pages/detail/detail_view.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: GoogleFonts.firaSans(color: Colors.black, fontSize: 26),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(kRadius),
            child: Container(
                margin: const EdgeInsets.all(kPadding),
                padding: const EdgeInsets.all(kPadding * 2),
                height: Get.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(kRadius * 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kRadius * 2),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/pizza.png',
                        placeholderFit: BoxFit.fitWidth,
                        image: 'https://ik.imagekit.io/vqkeoc9is/Pizza/delicious-classic-italian-pizza-with-mozzarella_79762-2653.jpg_copy.png?updatedAt=1681447769079',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pizza", style: GoogleFonts.firaSans(fontSize: 28, ),),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget> [
                                  Text('\$',
                                    style: GoogleFonts.firaSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: kSpace / 2),
                                  Text(12.toString(),
                                    style: GoogleFonts.firaSans(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                        ),
                      ],
                    ),
                    Obx(() => CounterButton(
                      onChange: (int value) => controller.onCount(value),
                      count: controller.count.value,
                      countColor: Colors.black45,
                      buttonColor: Colors.black45,
                    )),
                  ],
                )
            ),
          );
        },
      ),
    );
  }
}

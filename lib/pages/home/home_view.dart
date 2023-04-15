import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_food/xcore.dart';
import 'package:lottie/lottie.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Obx(() {
      if(HomeController.isLoading.isFalse){
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
          centerTitle: true,
          title: const TitleWidget(),
          leading: Builder(
            builder: (context) {
              return IconButton(
                splashRadius: kRadius * 3,
                icon: const Icon(Icons.dehaze_rounded),
                onPressed: () => PagesController.onOpenDrawer(),
              );
            }
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actions: [
            IconButton(
              splashRadius: kRadius * 3,
              icon: const Icon(Icons.notifications_none_rounded),
              onPressed: (){},
            ),
          ],
        ),
        drawer: const SidebarWidget(
          profile: 'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        ),
        body: Container(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            children:<Widget> [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  aspectRatio: 2.0,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: controller.listSlide.map((item) => ClipRRect(
                  borderRadius: BorderRadius.circular(kRadius * 2),
                  child: Center(
                    child: Image.network(item.image, fit: BoxFit.cover, width: 1000.0),
                  ),
                )).toList(),
              ),
              SizedBox(height: Get.height * 0.01),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: kPadding * 2,
                    bottom: kPadding,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Popular",
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => Get.toNamed(PageRouter.show),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(kRadius * 2),
                              ),
                            ),
                            child: Text(
                              "View All",
                              style: GoogleFonts.roboto(
                                color: Colors.grey,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: controller.listPizza.length <= 4 ? controller.listPizza.length : controller.listPizza.length.clamp(6, 6),
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

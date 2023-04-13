import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_food/pages/page_route.dart';
import 'package:pizza_food/xcore.dart';
import 'package:lottie/lottie.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
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
          centerTitle: true,
          title: const TitleWidget(),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.dehaze_rounded),
                onPressed: () {
                   Scaffold.of(context).openDrawer();
                },
              );
            }
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded),
              onPressed: () {},
            ),
          ],
        ),
        drawer: const Drawer(),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(kRadius * 2),
                child: Container(
                  padding: const EdgeInsets.only(right: kPadding, left: kPadding),
                  width: double.infinity,
                  height: Get.height * 0.040,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius * 2),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.withOpacity(.3),
                      )
                  ),
                  child: Row(
                    children: const <Widget> [
                      Icon(Icons.search, color: Colors.black54),
                      SizedBox(width: kSpace),
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                            hintText: "Find your pizza here...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                          InkWell(
                            child: Text(
                              "View All",
                              style: GoogleFonts.roboto(
                                color: Colors.grey,
                                fontSize: 12.0,
                              ),
                            ),
                            onTap: (){},
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: controller.listPizza.length,
                          itemBuilder: (context, index) {
                            final pizza = controller.listPizza[index];
                            return InkWell(
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

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_food/core/size.dart';
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
          title: const Text("Order Details", style: TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black54,),
            onPressed: () => Get.back(),
          ),
          actions: [
            IconButton(
              onPressed: () => controller.onFavorite(),
              icon: controller.isFavorite.isTrue ? const Icon(Icons.favorite, color: Colors.redAccent,) : const Icon(Icons.favorite_border, color: Colors.black54,),
            ),
          ],
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: kPadding * 3, right: kPadding * 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: NetworkImage(controller.pizzaDetail.value!.image),
                      width: double.infinity,
                      height: Get.height * 0.35,
                    ),
                    const SizedBox(height: kSpace * 1.5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(controller.pizzaDetail.value!.name,
                          style: GoogleFonts.ubuntu(
                            fontSize: 26,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: kSpace * 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InfoWidget(
                          child1: const Icon(Icons.timer, color: Colors.black45,),
                          child2: Text('${controller.pizzaDetail.value!.time} Mins',
                            style: const TextStyle(
                              fontSize: kFont,
                            ),
                          ),
                        ),
                        InfoWidget(
                          child1: const Icon(Icons.local_fire_department_sharp, color: Colors.deepOrangeAccent,),
                          child2: Text('${controller.pizzaDetail.value!.kal} Kal',
                            style: const TextStyle(
                              fontSize: kFont,
                            ),
                          ),
                        ),
                        InfoWidget(
                          child1:  const Image(image: AssetImage('assets/star.png'), width: 24, height: 24,),
                          child2: Text('${controller.pizzaDetail.value!.star}',
                            style: const TextStyle(
                              fontSize: kFont,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                      height: kSpace * 5,
                      indent: Get.width * 0.01,
                      endIndent: Get.width * 0.01,
                      color: Colors.grey[100],
                    ),
                    const SizedBox(height: kSpace,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('\$',
                              style: GoogleFonts.firaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: kSpace / 2),
                            Text(controller.pizzaDetail.value!.price.toString(),
                              style: GoogleFonts.firaSans(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
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
                    ),
                    const SizedBox(height: kSpace,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("About Pizza",
                          style: GoogleFonts.firaSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: kSpace * 2,),
                        RichText(
                          softWrap: true,
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            text: controller.pizzaDetail.value!.description + controller.pizzaDetail.value!.description + controller.pizzaDetail.value!.description + controller.pizzaDetail.value!.description,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: Get.height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 1],
                  colors: [
                    Colors.white.withOpacity(.0),
                    Colors.black.withOpacity(.7),
                  ],
                ),
              ),
              child: SafeArea(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kRadius * 5),
                    ),
                  ),
                  onPressed: (){},
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width * 0.7,
                    height: Get.height * 0.05,
                    child: Text("Add to Cart", style: GoogleFonts.firaSans(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        )
      );
    });
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required  this.child1,
    required  this.child2,
  }) : super(key: key);
  final Widget child1;
  final Widget child2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        child1,
        const SizedBox(width: kSpace / 2,),
        child2,
      ],
    );
  }
}

class CounterButton extends StatefulWidget {
  ///Constructor for the counter button
  const CounterButton(
      {Key? key,
        required this.count,
        required this.onChange,
        this.countColor = Colors.black,
        this.addIcon = const Icon(Icons.add),
        this.removeIcon = const Icon(Icons.remove),
        this.buttonColor = Colors.black,
        this.progressColor = Colors.black})
      : super(key: key);

  ///Value of the counter displayed in the center
  final int count;

  ///Color of the counter value
  final Color countColor;

  ///Value change callback when the buttons are pressed
  final ValueChanged<int> onChange;

  ///Color of the progress indicator
  final Color progressColor;

  ///Color of the icon button
  final Color buttonColor;

  ///Add button icon
  ///default: Icons.add
  final Icon addIcon;

  ///Remove button icon
  ///default: Icons.remove
  final Icon removeIcon;

  @override
  _AnimatedCounterState createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<CounterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadius * 3),
        border: Border.all(width: 1, color: Colors.grey.withOpacity(.3)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kRadius * 3),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 32.0,
                      height: 32.0,
                      child: IconButton(
                        onPressed: widget.count <= 0 ? null : () {
                          widget.onChange(widget.count - 1);
                        },
                        icon: widget.removeIcon,
                        padding: EdgeInsets.zero,
                        color: Colors.grey,
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      layoutBuilder: (Widget? currentChild,
                          List<Widget> previousChildren) {
                        return currentChild!;
                      },
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        final Animation<Offset> inAnimation = Tween<Offset>(
                            begin: const Offset(1.0, 0.0), end: Offset.zero)
                            .animate(animation);
                        final Animation<Offset> outAnimation = Tween<Offset>(
                            begin: const Offset(-1.0, 0.0),
                            end: Offset.zero)
                            .animate(animation);

                        if (child.key.toString() == widget.count.toString()) {
                          return ClipRect(
                            child: SlideTransition(
                                position: inAnimation, child: child),
                          );
                        } else {
                          return ClipRect(
                            child: SlideTransition(
                                position: outAnimation, child: child),
                          );
                        }
                      },
                      child: SizedBox(
                        key: Key(widget.count.toString()),
                        width: 32.0,
                        height: 32.0,
                        child: Center(
                          child: Text(
                            widget.count.toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32.0,
                      height: 32.0,
                      child: IconButton(
                        onPressed: () {
                          widget.onChange(widget.count + 1);
                        },
                        icon: widget.addIcon,
                        padding: EdgeInsets.zero,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

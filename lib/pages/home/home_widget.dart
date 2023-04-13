import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_food/xcore.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        const Icon(
          Icons.location_on,
          color: Colors.redAccent,
          size: kFont,
        ),
        const SizedBox(width: kSpace / 2),
        Text("Cambodia",
          style: kGoogleFont,
        ),
      ],
    );
  }
}


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Drawer();
  }
}

class PizzaWidget extends StatelessWidget {
  const PizzaWidget({
    Key? key,
    required this.name,
    required this.price,
    required this.star,
    required this.image,
  }) : super(key: key);
  final String name;
  final num price;
  final num star;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadius * 2),
        color: Colors.grey[25],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          FadeInImage.assetNetwork(
            placeholder: 'assets/pizza.png',
            placeholderFit: BoxFit.fitWidth,
            image: image,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: kSpace / 2),
          Text(name,
            style: GoogleFonts.firaSans(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: kSpace),
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
                  Text(price.toString(),
                    style: GoogleFonts.firaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('assets/star.png'), width: 18, height: 18,),
                  const SizedBox(width: kSpace / 2),
                  Text(star.toString(),
                    style: GoogleFonts.firaSans(
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_food/xcore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          ClipRRect(
            borderRadius: BorderRadius.circular(kRadius * 2),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/pizza.png',
              placeholderFit: BoxFit.fitWidth,
              image: image,
              fit: BoxFit.contain,
            ),
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

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({
    Key? key,
    this.profile,
    this.onProfile,
    this.onCart,
    this.onFavorite,
    this.onSetting,
    this.onLogout,
  }) : super(key: key);
  final String? profile;
  final Function()? onProfile;
  final Function()? onCart;
  final Function()? onFavorite;
  final Function()? onSetting;
  final Function()? onLogout;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: <Widget> [
          Container(
            width: double.infinity,
            height: Get.height * 0.27,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SafeArea(
              minimum: const EdgeInsets.only(top: kPadding * 10),
              child: Column(
                children: [
                  CircleAvatar(
                    maxRadius: Get.width * 0.12,
                    minRadius: Get.width * 0.12,
                    backgroundColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: profile == null ? Image.asset('assets/avatar.png').image : Image.network(profile!).image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: kSpace),
                  Text("John Doe",
                    style: GoogleFonts.firaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: kSpace),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: onProfile,
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Cart"),
            onTap: onCart,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Favorite"),
            onTap: onFavorite,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: onSetting,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}

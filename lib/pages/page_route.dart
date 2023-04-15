import 'package:get/get.dart';
import 'package:pizza_food/xcore.dart';

class PageRouter {
  static const String page = '/';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String search = '/search';
  static const String profile = '/profile';
  static const String show = '/show';
  static String detail(id) => '/detail/$id';

  static final pages = [
    GetPage(
        name: page,
        page: () => const PageView()
    ),
    GetPage(
        name: home,
        page: () => const HomeView()
    ),
    GetPage(
        name: cart,
        page: () => const CartView()
    ),
    GetPage(
        name: search,
        page: () => const SearchView()
    ),
    GetPage(
        name: profile,
        page: () => const ProfileView()
    ),
    GetPage(
        name: show,
        page: () => const ShowAllPizzaView(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: detail(':id'),
        page: () => const DetailView(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 500)
    ),
  ];
}
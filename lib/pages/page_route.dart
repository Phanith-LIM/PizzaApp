import 'package:get/get.dart';
import 'package:pizza_food/xcore.dart';

class PageRouter {
  static const String home = '/home';
  static String detail(id) => '/detail/$id';

  static final pages = [
    GetPage(
        name: home,
        page: () => const HomeView()
    ),
    GetPage(
        name: detail(':id'),
        page: () => const DetailView(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 500)
    ),
  ];
}
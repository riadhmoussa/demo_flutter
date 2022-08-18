import 'package:flutter_demo/modules/pets/bindings/add_pet_binding.dart';
import 'package:flutter_demo/modules/pets/ui/pages/add_pet_page.dart';
import 'package:get/get.dart';
import '../modules/pets/bindings/home_binding.dart';
import '../modules/pets/ui/pages/home_page.dart';
import 'app_routes.dart';


class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.addPet,
      page: () =>  AddPetPage(),
      binding: AddPetBinding(),
    ),
  ];
}
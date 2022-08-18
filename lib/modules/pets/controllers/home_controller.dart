import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../../../helper/base_controller.dart';
import '../../../models/pet.dart';
import '../../../routes/app_routes.dart';
import '../../../services/base_client.dart';
import '../../../config/app_constants.dart';


class HomeController extends GetxController with BaseController {

  var pets = <Pet>[].obs;



  @override
  void onInit() {
    super.onInit();

  }


  @override
  void onReady(){
    super.onReady();
    getPets();
  }


  Future  getPets() async {
    showLoading();
    pets.clear();
    var response = await BaseClient().get(AppConstants.baseUrl, "findByStatus?status=available").catchError(handleError);
    var listPosts = listPetsFromJson(response);
    pets.value = listPosts;
    hideLoading();
  }

  void goToAddPetPage(){
    Get.toNamed(AppRoutes.addPet, arguments: [AppConstants.ADDPET])?.then((value) => {
      if(value!=null){
        pets.value.add(Pet.fromJson(json.decode(value))),
      }
    });
  }

  void goToEditPetPage(int index){
    Get.toNamed(AppRoutes.addPet, arguments: [AppConstants.EDITPET,pets[index]])?.then((value) => {
      if(value!=null){
        pets[index] = Pet.fromJson(json.decode(value)),
      }
    });
  }
}
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper/bottomsheet_helper.dart';
import 'package:flutter_demo/helper/dialog_helper.dart';
import 'package:flutter_demo/models/pet.dart';
import 'package:flutter_demo/models/tag.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../config/app_constants.dart';
import '../../../helper/base_controller.dart';
import '../../../services/base_client.dart';
import 'package:flutter_demo/models/category_model.dart';

class AddPetController extends GetxController with BaseController {
  late TextEditingController etName,etCategory,etTags;
  RxString title = "".obs;
  late File image;
  late String imagePath;
  late Pet pet;
  final _picker = ImagePicker();
  List<CategoryModel> categorys = [CategoryModel(id: 0, name: "Category 1"),CategoryModel(id: 0, name: "Category 2"),CategoryModel(id: 0, name: "Category 3")];
  List<Tag> tags = [Tag(id: 0, name: "Tag 1"),Tag(id: 0, name: "Tag 2"),Tag(id: 0, name: "Tag 3")];
  Rx<CategoryModel> selectedCatgory = Rx<CategoryModel>(CategoryModel(name: '', id: 0));
  var selectedTags = <Tag>[].obs;
  dynamic argumentData = Get.arguments;



  @override
  void onInit() {
    super.onInit();
    etName = TextEditingController();
    etCategory = TextEditingController();
    etTags = TextEditingController();
    title.value = argumentData[0];


  }


  @override
  void onReady(){
    super.onReady();
    if(title.value==AppConstants.EDITPET){
      pet = argumentData[1];
      etName.text = pet.name!;
      etCategory.text = pet.category.name!;
      selectedCatgory.value = pet.category;
      selectedTags.value = pet.tags;
      for (var item in pet.tags) {
        etTags.text = "${etTags.text} ${item.name!}";
      }
    }
  }

  Future<void> getImage() async {
   final pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      showLoading();
      image = File(pickedFile.path);
      imagePath = pickedFile.path;
      var response = await BaseClient().uploadPhotos(AppConstants.baseUrl, "9223372036854094000/uploadImage",image).catchError(handleError);
      hideLoading();
    } else {
      print('No image selected.');
    }
  }

  void addPet() async {
    if(etName.text.isEmpty){
      DialogHelper.showToast(AppConstants.NAMEREQUIRED);
      return null;
    }
    if(etCategory.text.isEmpty){
      DialogHelper.showToast(AppConstants.CATEGORYREQUIRED);
      return null;
    }
    if(etTags.text.isEmpty){
      DialogHelper.showToast(AppConstants.TAGSREQUIRED);
      return null;
    }
    showLoading();
    var petPet = Pet(id:0,category: selectedCatgory.value, name: etName.text.toString(), photoUrls: [], tags: selectedTags.value,
        status: "available");
    var response = await BaseClient().post(AppConstants.baseUrl, "",petPet.toJson()).catchError(handleError);
    hideLoading();
    Get.back(result: response);
  }
  void editPet() async {
    if(etName.text.isEmpty){
      DialogHelper.showToast(AppConstants.NAMEREQUIRED);
      return null;
    }
    if(etCategory.text.isEmpty){
      DialogHelper.showToast(AppConstants.CATEGORYREQUIRED);
      return null;
    }
    if(etTags.text.isEmpty){
      DialogHelper.showToast(AppConstants.TAGSREQUIRED);
      return null;
    }
    showLoading();
    var petPet = Pet(id:pet.id,category: selectedCatgory.value, name: etName.text.toString(), photoUrls: [], tags: selectedTags.value,
        status: "available");
    var response = await BaseClient().update(AppConstants.baseUrl, "",petPet.toJson()).catchError(handleError);
    hideLoading();
    Get.back(result: response);
  }


  Future<void> addPetImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath = pickedFile.path;
      var response = await BaseClient().get(AppConstants.baseUrl, "").catchError(handleError);
    } else {
      print('No image selected.');
    }
  }

  void selectCategory(){
    BottomSheetHelper.showBottomSheet(categorys,(index)=>{
      selectedCatgory.value = categorys[index],
      etCategory.text = categorys[index].name.toString(),
      Get.back(),
    });

  }
  void selectTags(){
    BottomSheetHelper.showBottomSheet(tags,(index)=>{
      selectedTags.add(tags[index]),
      etTags.text = "${etTags.text} ${tags[index].name}",
      Get.back(),
    });
  }

}
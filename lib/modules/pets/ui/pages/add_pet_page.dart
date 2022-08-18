import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/config/app_constants.dart';
import 'package:flutter_demo/modules/pets/controllers/add_pet_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:multiselect/multiselect.dart';
import '../../../../widgets/input_field.dart';
import 'package:get/get.dart';

class AddPetPage extends StatelessWidget {
  AddPetController controller = Get.put(AddPetController());

  AddPetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title:  Text(
          controller.title.value,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  title: "Name",
                  placeholder: "Entrez name",
                  controller: controller.etName,
                  enabled: true,
                ),
                GestureDetector(
                  onTap: () => controller.selectCategory(),
                  child: InputField(
                    title: "Category",
                    placeholder: "Select category",
                    controller: controller.etCategory,
                    enabled: false,
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.selectTags(),
                  child: InputField(
                    title: "Tags",
                    placeholder: "Select tags",
                    controller: controller.etTags,
                    enabled: false,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: ()=>controller.getImage(),
                  child: SizedBox(
                    width: 50,
                      height: 50,
                      child: Image.asset(AppConstants.ATTACHIMAGEICON)),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: ()=>controller.addPet(),
                      child: Text(controller.title.value),
                    )
                ),

                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

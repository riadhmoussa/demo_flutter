import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/card_pet.dart';
import '../../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
              controller.goToAddPetPage();
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.pets.length,
                  itemBuilder: (context, index) {
                    return CardPet(pet: controller.pets[index], onPressed: () {
                      controller.goToEditPetPage(index);
                    },);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

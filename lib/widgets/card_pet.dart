import 'package:flutter/material.dart';
import 'package:flutter_demo/config/app_constants.dart';

import '../models/pet.dart';

class CardPet extends StatelessWidget {
  final Pet pet;
  final Function() onPressed;

  const CardPet({Key? key, required this.pet, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                 AppConstants.PLACEHOLDER,
                  height: 100,
                  width: 100,),

                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.name!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                        '${pet.category.name}'),
                  ],
                ),
                ElevatedButton(onPressed: onPressed, child:
                Text("Edit"))

              ],
            ),
          ],
        ),
      ),
    );
  }
}
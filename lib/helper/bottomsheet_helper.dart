

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/category_model.dart';
import 'package:flutter_demo/models/tag.dart';
import 'package:get/get.dart';

class BottomSheetHelper {
  //show bottomsheet
  static void showBottomSheet(List<Object> data, Function(int index) onPressed) {
    Get.bottomSheet(
      backgroundColor: Colors.white,
      ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: ()=>onPressed(index),
            child: Container(
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
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index] is Tag? (data[index] as Tag).name!:(data[index] as CategoryModel).name!,
                              style: const TextStyle(fontSize: 24),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
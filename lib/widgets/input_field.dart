import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String placeholder;
  final TextEditingController controller;
  final bool enabled;
  const InputField({Key? key, required this.title, required this.placeholder, required this.controller, required this.enabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
           title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xff374151),
            ),
          ),
        ),
        TextField(
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintStyle: const TextStyle(
                fontSize: 12,
              ),
              hintText: placeholder),
        ),
      ],
    );
  }
}

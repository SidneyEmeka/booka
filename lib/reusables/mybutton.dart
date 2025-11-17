import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../stylings.dart';

class Mybutton extends StatelessWidget {
  final String bText;
  final bool diffColor;
  final Color col1;
  final  Color col2;
  final bool isActive;
  final bool hasMargin;
  final Function() toDo;
  const Mybutton({super.key, required this.bText, required this.diffColor,  this.isActive=true, this.hasMargin=true, this.col1=Colors.transparent, this.col2=Colors.transparent, required this.toDo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: hasMargin ? const EdgeInsets.symmetric(vertical: 8) : EdgeInsets.zero,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          width: Get.width,
          height: Get.height * 0.064,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [0.7, 1.0],
              colors: !diffColor
                  ? [Color(0xFF1A73E8), Color(0xFF00C6FF)]
                  : [col1, col2],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () {
              toDo();
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
              alignment: const Alignment(0, 0),
              child: Text(
                bText,
                style: Stylings.buttonTexts.copyWith(
                  color: isActive ? Colors.white : const Color(0xFFD0D5Dd),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

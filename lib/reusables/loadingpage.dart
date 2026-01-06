import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../stylings.dart';


class Loadingpage extends StatefulWidget {
  final String doingWhat;
  const Loadingpage({super.key, required this.doingWhat});

  @override
  State<Loadingpage> createState() => _LoadingpageState();
}

class _LoadingpageState extends State<Loadingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        color: Stylings.bgColor,
        alignment: Alignment(0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadingAnimationWidget.flickr(

              size: 30, leftDotColor: Stylings.priGreen, rightDotColor: Stylings.priYellow,
            ),
            SizedBox(height: 10,),
            Text( textAlign: TextAlign.center,'${widget.doingWhat}...',style: Stylings.bodyMediumLarge)
          ],
        ),
      )

    );
  }
}

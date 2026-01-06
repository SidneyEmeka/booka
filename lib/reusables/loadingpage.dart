import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../stylings.dart';


class Loadingpage extends StatefulWidget {
  final String doingWhat;
  final RxBool persist;
  final Function whatNext;
  const Loadingpage({super.key, required this.doingWhat, required this.persist, required this.whatNext});

  @override
  State<Loadingpage> createState() => _LoadingpageState();
}

class _LoadingpageState extends State<Loadingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>widget.persist.value?
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
      ):
      widget.whatNext()
        ,)
    );
  }
}

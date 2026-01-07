import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../reusables/mybutton.dart';
import '../server/getxserver.dart';
import '../stylings.dart';


class Otherinformation extends StatefulWidget {
  const Otherinformation({super.key});

  @override
  State<Otherinformation> createState() => _OtherinformationState();
}

class _OtherinformationState extends State<Otherinformation> {
  final _otherInfoKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: Stylings.transparent,
          onTap: (){
          },
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.arrow_back_ios_new_sharp,color: Stylings.accentBlue,size: 23,)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            Form(
              key: _otherInfoKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      'Other Information',
                      style: Stylings.displaySemiBoldMedium.copyWith(color: Stylings.accentBlue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: Get.height*0.03,),


                  //University
                 Obx(()=> Container(
                   // margin: const EdgeInsets.only(top: 8),
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(8),
                     // border: Border.all(color: Stylings.brown)
                   ),
                   child: DropdownButton(
                       alignment: Alignment.center,
                       isExpanded: true,
                       borderRadius: BorderRadius.circular(10),
                       menuMaxHeight: Get.size.height * 0.4,
                       value: Get.find<Bookax>().userUniversityId.value,
                       // iconEnabledColor: Stylings.brown,
                       iconSize: 15,
                       dropdownColor: Colors.white,
                       underline: const SizedBox(),
                       items: [
                         ...Get.find<Bookax>().universities.map((aUni) {
                           return DropdownMenuItem(
                               value: aUni.id,
                               child: Text(aUni.name,
                                   style: Stylings.bodyMediumLarge.copyWith(color: Colors.black)));
                         })
                       ],
                       onChanged: (value) {
                         Get.find<Bookax>().userUniversityId.value=value!.toString();
                         Get.find<Bookax>().getDepartments(value.toString());
                       }),
                 ),),
                  const SizedBox(height: 20,),

                  //Department
                 Obx(()=> Container(
                   // margin: const EdgeInsets.only(top: 8),
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(8),
                     // border: Border.all(color: Stylings.brown)
                   ),
                   child: DropdownButton(
                       alignment: Alignment.center,
                       isExpanded: true,
                       borderRadius: BorderRadius.circular(10),
                       menuMaxHeight: Get.size.height * 0.4,
                       value: Get.find<Bookax>().userDepartment.value,
                       // iconEnabledColor: Stylings.brown,
                       iconSize: 15,
                       dropdownColor: Colors.white,
                       underline: const SizedBox(),
                       items: [
                         ...Get.find<Bookax>().departments.map((aDept) {
                           return DropdownMenuItem(
                               value: aDept.name,
                               child: Text(aDept.name,
                                   style: Stylings.bodyMediumLarge.copyWith(color: Colors.black)));
                         })
                       ],
                       onChanged: (value) {
                         Get.find<Bookax>().userDepartment.value=value!.toString();
                         // print(Get.find<Bookax>().userUniversityId.value);
                       }),
                 ),),
                  const SizedBox(height: 20,),

                  //level
                  TextFormField(
                    onChanged: (p) {
                  p.isNotEmpty? Get.find<Bookax>().userLevel.value=int.parse(p):Get.find<Bookax>().userLevel.value=0;
                    },
                    validator: (e){
                      if (e == null || e.isEmpty) {
                        return "Please enter your current level is required";
                      }
                      else if(e!="100"&&e!="200"&&e!="300"&&e!="400"&&e!="500"&&e!="600"){
                        return "Please enter a valid level";
                      }
                      return null;

                    },
                    style: Stylings.bodyRegularMedium.copyWith(
                        color: const Color(0xFF222222)),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.grey.shade500,
                    cursorHeight: 15,
                    cursorWidth: 1,
                    decoration: const InputDecoration(
                      hintText: "Level",
                    ),
                  ),
                  const SizedBox(height: 20,),

                  //phone
                  TextFormField(
                    onChanged: (p) {
                      Get.find<Bookax>().userPhoneNumber.value=p;
                    },
                    validator: (e){
                      if (e == null || e.isEmpty) {
                        return "Phone number is required";
                      }
                      else if (e.length < 10) {
                        return "Phone number must be at least 10 digits long";
                      }
                      else if (e.length > 11) {
                        return "Phone number must not exceed 11 digits";
                      }
                      return null;
                    },
                    style: Stylings.bodyRegularMedium.copyWith(
                        color: const Color(0xFF222222)),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.grey.shade500,
                    cursorHeight: 15,
                    cursorWidth: 1,
                    decoration: const InputDecoration(
                      hintText: "Phone number",
                    ),
                  ),
                  const SizedBox(height:30,),

                  Mybutton(bText: "Continue",toDo: (){

                    if (_otherInfoKey.currentState?.validate() ?? false) {
                      //print("kkk");
                     Get.find<Bookax>().createAccount();
                    }
                  }),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

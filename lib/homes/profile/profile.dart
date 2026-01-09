import 'package:booka/homes/profile/editprofile.dart';
import 'package:booka/reusables/copybutton.dart';
import 'package:booka/reusables/mybutton.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../getxcontrollers/maincontroller.dart';
import '../../reusables/myswitch.dart';
import '../../stylings.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop){
          if(!didPop){
            Get.find<MainController>().onTapNavItem(0,context);
          }
        },
        child: Obx(()=>Container(
        //color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: ListView(
              children: [
              Align(
                  alignment: Alignment(0, 0),
                  child: Text("Edit Profile",style: Stylings.displaySemiBoldMedium.copyWith(color: Stylings.accentBlue),)),
              SizedBox(height: Get.height*0.02),
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/images/avatar.png"),
              ),
              SizedBox(height: Get.height*0.015),
              Align(
                  alignment: Alignment(0, 0),
                  child: Text("Agoha Isdore",style: Stylings.displayBoldMedium.copyWith(color: Stylings.accentBlue),)),
              Align(
                  alignment: Alignment(0, 0),
                  child: Text("Agric Economics and Extension",style: Stylings.displaySemiBoldSmaller)),
              SizedBox(height: Get.height*0.04),


              Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                      top: BorderSide(color: Stylings.accentBlue,width: 1.5),
                      right: BorderSide(color: Stylings.accentBlue,width: 1.5),
                      left: BorderSide(color: Stylings.accentBlue,width: 1.5),
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account Settings",style: Stylings.displayBoldest.copyWith(color: const Color(0xFFBEBFBF)),),
                    SizedBox(height: Get.height*0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Email Notifications",style: Stylings.displaySemiBold.copyWith(color: const Color(0xFFBEBFBF))),

                        Myswitch(value: Get.find<MainController>().userNotificationPreferences['email']!, onChanged: (value){
                          if (value) {
                            Get.find<MainController>().userNotificationPreferences['email']=true;
                          }
                          else {
                            Get.find<MainController>().userNotificationPreferences['email']=false;
                          }
                        })

                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("SMS Updates",style: Stylings.displaySemiBold.copyWith(color: const Color(0xFFBEBFBF))),

                        Myswitch(value: Get.find<MainController>().userNotificationPreferences['sms']!, onChanged: (value){
                          if (value) {
                            Get.find<MainController>().userNotificationPreferences['sms']=true;
                          }
                          else {
                            Get.find<MainController>().userNotificationPreferences['sms']=false;
                          }
                        })

                      ],
                    ),
                    Divider(color: Colors.grey.shade300,),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(FluentIcons.star_28_filled,size: 25,color: Color(0xFFFFD700),),
                        const SizedBox(width: 5,),
                        Text("Current points: 120",style: Stylings.displaySemiBold.copyWith(color: const Color(0xFFBEBFBF))),
                        const Spacer(),
                        const CopyButton(textToCopy: "textToCopy")
                      ],
                    ),

                  ],
                ),
              ),
             // Spacer(),
              Container(
                padding: EdgeInsets.only(right: 30,left: 30,bottom: 30),
                width: Get.width,
                decoration: BoxDecoration(
                    color: Stylings.bgColor
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Mybutton(bText: "Edit profile", toDo: (){
                      Get.to(()=>Editprofile());
                    }),

                    Mybutton(bText: "Log out", diffColor:true, toDo: (){},col1: Color(0xFFE14642), col2: Color(0xFFF26357),)
                  ],
                ),
              ),
            ],)),



            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Stylings.bgColor,
                    border: Border.all(
                        color: const Color(0xFF407BFF),
                        width: 2
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.find<MainController>().onTapNavItem(0,context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FluentIcons.home_28_regular,size: 25,color: Get.find<MainController>().navIndex.value==0?Stylings.accentBlue:Colors.white,),
                          const SizedBox(height: 5,),
                          Text("Home",style: Stylings.displayExtraBoldSmall.copyWith(color: Get.find<MainController>().navIndex.value==0?Stylings.accentBlue:Colors.white,),)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.find<MainController>().onTapNavItem(1,context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FluentIcons.heart_28_regular,size: 25,color: Get.find<MainController>().navIndex.value==1?Stylings.accentBlue:Colors.white,),
                          const SizedBox(height: 5,),
                          Text("Wishlist",style: Stylings.displayExtraBoldSmall.copyWith(color: Get.find<MainController>().navIndex.value==1?Stylings.accentBlue:Colors.white,),)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.find<MainController>().onTapNavItem(2,context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FluentIcons.search_28_regular,size: 25,color: Get.find<MainController>().navIndex.value==2?Stylings.accentBlue:Colors.white,),
                          const SizedBox(height: 5,),
                          Text("Search",style: Stylings.displayExtraBoldSmall.copyWith(color: Get.find<MainController>().navIndex.value==2?Stylings.accentBlue:Colors.white,),)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.find<MainController>().onTapNavItem(3,context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FluentIcons.cart_24_regular,size: 27,color: Get.find<MainController>().navIndex.value==3?Stylings.accentBlue:Colors.white,),
                          const SizedBox(height: 5,),
                          Text("Cart",style: Stylings.displayExtraBoldSmall.copyWith(color: Get.find<MainController>().navIndex.value==3?Stylings.accentBlue:Colors.white,),)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.find<MainController>().onTapNavItem(4,context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Get.find<MainController>().navIndex.value==4?SizedBox(
                            height: 23,
                            width: 23,
                            child: Image.asset("assets/images/avatar.png"),
                          ):SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/images/avatarnav.png"),
                          ),
                          //  Icon(FluentIcons.person_28_regular,size: 25,color: Get.find<MainControoller>().navIndex.value==4?Stylings.accentBlue:Colors.white,),
                          const SizedBox(height: 5,),
                          Text("Profile",style: Stylings.displayExtraBoldSmall.copyWith(color: Get.find<MainController>().navIndex.value==4?Stylings.accentBlue:Colors.white,),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),),)
    );
  }
}



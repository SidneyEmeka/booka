import 'package:booka/getxservers/maincontroller.dart';
import 'package:booka/reusables/bookcard.dart';
import 'package:booka/reusables/booktile.dart';
import 'package:booka/reusables/menucard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../stylings.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: Get.width*0.5,
        leading:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor: Stylings.transparent,
              onTap: (){
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(Icons.arrow_back_ios_new_sharp,color: Stylings.accentBlue,size: 23,)),
            ),
            Builder(
                builder: (context)=> GestureDetector(
                    onTap: (){
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(Icons.menu,color: Stylings.accentBlue,size: 23,)),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: 38,
                height: 20,
                child: Image.asset("assets/images/logospelled.png")),
          ],
        ),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: Stylings.transparent,
            onTap: (){
            },
            child: Icon(Icons.shopping_cart_outlined,color: Stylings.accentBlue,size: 23,),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: Stylings.transparent,
            onTap: (){
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.person,color: Stylings.accentBlue,size: 23,),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Stylings.bgColor,
        width: Get.width,
        child: SafeArea(
          child: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Welcome Isidore",style: Stylings.displayExtraBoldMedium.copyWith(color: Stylings.accentBlue),),
                    Icon(Icons.notifications,size: 25,color: Stylings.accentBlue,),
                  ],
                ),

                Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 3),
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: const Color(0xFF1F6193),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: const Alignment(-1, 0),
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Text("Find books by course or title",style: Stylings.bodyMediumLarger.copyWith(color: Stylings.bgColor.withOpacity(0.6)),),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Icon(Icons.search,color: Colors.white,size: 25,)
                    ],
                  ),
                ),

                SizedBox(
                  height: Get.height*0.8,
                  child:GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    children: [
                      Menucard(title: "Browse Books", icon: Icons.search, color: Color(0xFF287CF6)),
                      Menucard(title: "My Orders", icon: Icons.shopping_cart_outlined, color: Color(0xFF287CF6)),
                      Menucard(title: "Time Slots", icon: Icons.access_time, color: Color(0xFF47C8E5)),
                      Menucard(title: "Pick-Up/Delivery", icon: Icons.delivery_dining_outlined, color: Color(0xFF47C8E5)),
                      Menucard(title: "Loyalty & Referrals", icon: Icons.star, color: Color(0xFF47C8E5)),
                      Menucard(title: "Profile", icon: Icons.person, color: Color(0xFF287CF6)),
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
      body: Obx(()=> Container(
        width: Get.width,
        height: Get.height,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
           ListView(
             children: [
               GestureDetector(
                   onTap: (){
                     Scaffold.of(context).openDrawer();
                   },
                   child: Text("Welcome, Isdore",style: Stylings.displaySemiBoldMedium.copyWith(color: Stylings.accentBlue),)),
               SizedBox(height: Get.height*0.02),
               Container(
                 width: Get.width,
                 padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 3),
                 decoration: BoxDecoration(
                   color: const Color(0xFF1F6193),
                   borderRadius: BorderRadius.circular(5)
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Expanded(
                       child: Container(
                         alignment: const Alignment(-1, 0),
                         padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                         width: Get.width,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(7)
                         ),
                         child: Text("Find books by course or title",style: Stylings.bodyMediumLarger.copyWith(color: Stylings.bgColor.withOpacity(0.6)),),
                       ),
                     ),
                     const SizedBox(width: 10,),
                     const Icon(Icons.search,color: Colors.white,size: 25,)
                   ],
                 ),
               ),
               //recents
               Padding(padding: EdgeInsets.symmetric(vertical: 15,),
               child: Text("Recently searched",style: Stylings.bodyMediumLargest.copyWith(color: Color(0xFFD9D9D9)),),),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 physics: BouncingScrollPhysics(),
                 child: Row(
                   children: [
                     Bookcard(),
                     Bookcard(),
                     Bookcard(),
                     Bookcard(),
                     Bookcard(),
                     Bookcard(),
                     Bookcard(),
                     Bookcard(),
                     Bookcard(),
                     Bookcard(),
                     Bookcard(),
                     Bookcard(),
                     Bookcard(),
                   ],
                 ),
               ),
               //tops
               Padding(padding: EdgeInsets.symmetric(vertical: 15,),
                 child: Text("Top Picks",style: Stylings.bodyMediumLargest.copyWith(color: Color(0xFFD9D9D9)),),),
               SingleChildScrollView(
                 scrollDirection: Axis.vertical,
                 physics: BouncingScrollPhysics(),
                 child: Padding(
                   padding: EdgeInsets.only(bottom: Get.height*0.1,),
                   child: Column(
                     children: [
                      Booktile(),
                      Booktile(),
                      Booktile(),
                      Booktile(),
                      Booktile(),
                      Booktile(),
                      Booktile(),
                      Booktile(),
                      Booktile(),
                      Booktile(),
                      Booktile(),
                      Booktile(),
                      Booktile(),
                      Booktile(),

                     ],
                   ),
                 ),
               ),





             ],
           ),
            ///Bottom NavBar
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
               margin: EdgeInsets.only(bottom: 30),
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
                        Get.find<MainControoller>().onTapNavItem(0);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.home_outlined,size: 25,color: Get.find<MainControoller>().navIndex.value==0?Stylings.accentBlue:Colors.white,),
                         const SizedBox(height: 3,),
                          Text("Home",style: Stylings.displayExtraBoldSmall.copyWith(color: Get.find<MainControoller>().navIndex.value==0?Stylings.accentBlue:Colors.white,),)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.find<MainControoller>().onTapNavItem(1);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite_border,size: 25,color: Get.find<MainControoller>().navIndex.value==1?Stylings.accentBlue:Colors.white,),
                          const SizedBox(height: 3,),
                          Text("Wishlist",style: Stylings.displayExtraBoldSmall.copyWith(color: Get.find<MainControoller>().navIndex.value==1?Stylings.accentBlue:Colors.white,),)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.find<MainControoller>().onTapNavItem(2);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.search,size: 25,color: Get.find<MainControoller>().navIndex.value==2?Stylings.accentBlue:Colors.white,),
                          const SizedBox(height: 3,),
                          Text("Search",style: Stylings.displayExtraBoldSmall.copyWith(color: Get.find<MainControoller>().navIndex.value==2?Stylings.accentBlue:Colors.white,),)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.find<MainControoller>().onTapNavItem(3);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.shopping_cart_outlined,size: 25,color: Get.find<MainControoller>().navIndex.value==3?Stylings.accentBlue:Colors.white,),
                          const SizedBox(height: 3,),
                          Text("Cart",style: Stylings.displayExtraBoldSmall.copyWith(color: Get.find<MainControoller>().navIndex.value==3?Stylings.accentBlue:Colors.white,),)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.find<MainControoller>().onTapNavItem(4);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.person_2_outlined,size: 25,color: Get.find<MainControoller>().navIndex.value==4?Stylings.accentBlue:Colors.white,),
                          const SizedBox(height: 3,),
                          Text("Profile",style: Stylings.displayExtraBoldSmall.copyWith(color: Get.find<MainControoller>().navIndex.value==4?Stylings.accentBlue:Colors.white,),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),)
    );
  }
}

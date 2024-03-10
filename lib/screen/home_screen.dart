import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fabcurate/utils/base_color.dart';
import 'package:fabcurate/utils/base_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controller/home_controller.dart';
import '../utils/base_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());
  List<String> images = [];

  @override
  void initState() {
    homeController.getTopRepositoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Image.asset(
            BaseImage.appLogo,
          ),
          actions: [
            Image.asset(
              BaseImage.search,
              height: 3.2.h,
              width: 3.2.h,
            ),
            SizedBox(
              width: 4.w,
            ),
            Image.asset(
              BaseImage.shopBag,
              height: 3.2.h,
              width: 3.2.h,
            ),
            SizedBox(
              width: 4.w,
            ),
          ],
        ),
        body: Obx(() {
          if (homeController.isLoadingTop.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: BaseColor.appColor,
              ),
            );
          }

          for (var imageUrl in homeController.shopByCategoryList) {
            final image = imageUrl.image;
            images.add(image!);
          }

          Get.log("images list $images");

          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Top
                SizedBox(
                  height: 12.h,
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 5,
                                blurStyle: BlurStyle.outer,
                              )
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                width: double.infinity,
                                height: 8.h,
                                imageUrl: homeController.mainStickyMenuList[index + 1].image!,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Center(
                                  child: baseText(
                                    homeController.mainStickyMenuList[index + 1].title!,
                                    fontSize: 15.sp,
                                    color: Colors.black,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //
                SizedBox(
                  height: 2.h,
                ),
                //
                CarouselSlider(
                  items: homeController.mainStickyMenuList[0].sliderImages!
                      .map(
                        (e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Image.network(
                                e.image!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Container(
                                height: 8.h,
                                color: BaseColor.appColor,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 2.h),
                                height: 8.h,
                                width: 50.w,
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  color: BaseColor.white,
                                ),
                                child: baseText(
                                  e.title!,
                                  color: BaseColor.black,
                                  fontSize: 15.sp,
                                  maxLines: 3,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {},
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                //
                SizedBox(
                  height: 2.h,
                ),
                //

                //Middle
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: baseText(
                    "Shop By Category",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 17.sp,
                  ),
                ),
                //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: homeController.shopByCategoryList.length,
                    itemBuilder: (context, index) {
                      final data = homeController.shopByCategoryList[index];
                      return Container(
                        height: 14.h,
                        color: data.color,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl: data.image!,
                              fit: BoxFit.cover,
                              height: 10.h,
                              width: double.infinity,
                            ),
                            const SizedBox(height: 4.0),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: baseText(
                                  data.name!,
                                  textAlign: TextAlign.start,
                                  fontSize: 14.sp,
                                  maxLines: 2,
                                  color: BaseColor.grey2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: baseText(
                    "Shop By Fabric Material",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 17.sp,
                  ),
                ),
                //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: homeController.shopByFabricList.length,
                    itemBuilder: (context, index) {
                      final data = homeController.shopByFabricList[index];
                      return ClipOval(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            //

                            CachedNetworkImage(
                              imageUrl: data.image!,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),

                            //
                            Container(
                              height: 6.h,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black,
                                    Colors.black.withOpacity(0.8),
                                    Colors.black.withOpacity(0.7),
                                    Colors.black.withOpacity(0.3),
                                    Colors.black.withOpacity(0.1),
                                    Colors.black.withOpacity(0),
                                  ],
                                ),
                              ),
                            ),
                            //
                            Container(
                              margin: const EdgeInsets.all(
                                10.0,
                              ),
                              child: baseText(
                                data.name!,
                                textAlign: TextAlign.center,
                                fontSize: 14.sp,
                                maxLines: 2,
                                color: BaseColor.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //
                SizedBox(
                  height: 2.h,
                ),

//
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: baseText(
                    "Unstitched",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 17.sp,
                  ),
                ),
                //
                CarouselSlider(
                  items: homeController.unstitchedList
                      .map(
                        (e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Image.network(
                                e.image!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              //
                              Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black,
                                      Colors.black.withOpacity(0.8),
                                      Colors.black.withOpacity(0.7),
                                      Colors.black.withOpacity(0.3),
                                      Colors.black.withOpacity(0.1),
                                      Colors.black.withOpacity(0),
                                    ],
                                  ),
                                ),
                              ),
                              //
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 2.h,
                                ),
                                child: baseText(
                                  e.name!,
                                  color: BaseColor.white,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {},
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                //
                SizedBox(
                  height: 2.h,
                ),
                //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: baseText(
                    "Boutique Collection",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 17.sp,
                  ),
                ),
                //
                Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 350.0,
                        autoPlay: false,
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                      ),
                      items: homeController.boutiqueCollectionList.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(imageUrl.bannerImage!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black,
                                        Colors.black.withOpacity(0.8),
                                        Colors.black.withOpacity(0.7),
                                        Colors.black.withOpacity(0.3),
                                        Colors.black.withOpacity(0.1),
                                        Colors.black.withOpacity(0),
                                      ],
                                    ),
                                  ),
                                ),
                                //
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      baseText(
                                        imageUrl.name!,
                                        color: BaseColor.white,
                                        fontSize: 20.sp,
                                        maxLines: 2,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      baseText(
                                        imageUrl.cta!,
                                        color: BaseColor.white60,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                                //
                              ],
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: homeController.boutiqueCollectionList.map((url) {
                        int index = homeController.boutiqueCollectionList.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(index == 0 ? 1 : 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),

                //
                // Bottom

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: baseText(
                    "Range of Pattern",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 17.sp,
                  ),
                ),
                //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: homeController.rangeOfPatternList.length,
                    itemBuilder: (context, index) {
                      final data = homeController.rangeOfPatternList[index];
                      return ClipOval(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            //

                            CachedNetworkImage(
                              imageUrl: data.image!,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),

                            //
                            Container(
                              height: 6.h,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black,
                                    Colors.black.withOpacity(0.8),
                                    Colors.black.withOpacity(0.7),
                                    Colors.black.withOpacity(0.3),
                                    Colors.black.withOpacity(0.1),
                                    Colors.black.withOpacity(0),
                                  ],
                                ),
                              ),
                            ),
                            //
                            Container(
                              margin: const EdgeInsets.all(
                                10.0,
                              ),
                              child: baseText(
                                data.name!,
                                textAlign: TextAlign.center,
                                fontSize: 14.sp,
                                maxLines: 2,
                                color: BaseColor.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //
                SizedBox(
                  height: 2.h,
                ),

                //

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: baseText(
                    "Design As Per Occasion",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 17.sp,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: homeController.designOccasionList.length,
                    itemBuilder: (context, index) {
                      final data = homeController.designOccasionList[index];
                      return Container(
                        height: 14.h,
                        color: Colors.white60,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CachedNetworkImage(
                              imageUrl: data.image!,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                            //
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              color: BaseColor.white60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: baseText(
                                      data.name!,
                                      textAlign: TextAlign.start,
                                      fontSize: 14.sp,
                                      maxLines: 2,
                                      color: BaseColor.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  baseText(
                                    data.subName!,
                                    textAlign: TextAlign.start,
                                    fontSize: 13.sp,
                                    maxLines: 2,
                                    color: BaseColor.grey2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

import 'package:fabcurate/controller/category_controller.dart';
import 'package:fabcurate/screen/widget/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/base_image.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryController categoryController = Get.put(CategoryController());

  @override
  void initState() {
    categoryController.getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back_ios_new,
            size: 3.h,
          ),
          title: Center(
            child: Text(
              "Category",
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
              ),
            ),
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
          if (categoryController.isLoadingCategory.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
          return SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categoryController.categoryList.length,
              itemBuilder: (context, index) {
                final data = categoryController.categoryList[index];
                Get.log("data---$data");
                return SizedBox(
                  // height: 12.h,
                  child: CategoryWidget(
                    categories: data,
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

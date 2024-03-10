import 'dart:convert';

import 'package:fabcurate/model/category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  RxBool isLoadingCategory = false.obs;
  RxList<Categories> categoryList = <Categories>[].obs;

  getCategoryList() async {
    try {
      isLoadingCategory(true);

      final response = await http.get(
        Uri.parse("http://app-interview.easyglue.in/category_repository.json"),
      );

      if (response.statusCode == 200) {
        final res = CategoryModel.fromJson(json.decode(response.body));

        categoryList.value = res.categories!;

        Get.log("categoryList-- ${categoryList.length}");
        isLoadingCategory(false);
      } else {
        Get.log("categoryList-- ${response.statusCode}");
        isLoadingCategory(false);
      }
    } catch (e) {
      Get.log('Error fetching or parsing data: $e');
      isLoadingCategory(false);
      throw Exception('Failed to fetch user. Please try again!');
    }
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/bottom_repository_model.dart';
import '../model/middle_repository_model.dart';
import '../model/top_repository_model.dart';

class HomeController extends GetxController {
  RxBool isLoadingTop = false.obs;
  RxBool isLoadingMiddle = false.obs;
  RxBool isLoadingBottom = false.obs;

  RxList<MainStickyMenu> mainStickyMenuList = <MainStickyMenu>[].obs;

  RxList<ShopByCategory> shopByCategoryList = <ShopByCategory>[].obs;
  RxList<BoutiqueCollection> boutiqueCollectionList = <BoutiqueCollection>[].obs;
  RxList<ShopByFabric> shopByFabricList = <ShopByFabric>[].obs;
  RxList<Unstitched> unstitchedList = <Unstitched>[].obs;

  RxList<DesignOccasion> designOccasionList = <DesignOccasion>[].obs;
  RxList<RangeOfPattern> rangeOfPatternList = <RangeOfPattern>[].obs;

  getTopRepositoryList() async {
    try {
      isLoadingTop(true);

      final response = await http.get(
        Uri.parse("http://app-interview.easyglue.in/top_repository.json"),
      );

      if (response.statusCode == 200) {
        final res = TopRepositoryModel.fromJson(json.decode(response.body));

        mainStickyMenuList.value = res.mainStickyMenu!;

        Get.log("Top-- ${mainStickyMenuList.length}");

        getMiddleRepositoryList();
        getBottomRepositoryList();

        isLoadingTop(false);
      } else {
        Get.log("Top-- ${response.statusCode}");
        isLoadingTop(false);
      }
    } catch (e) {
      Get.log('Error fetching or parsing data: $e');
      isLoadingTop(false);
      throw Exception('Failed to fetch user. Please try again!');
    }
  }

  getMiddleRepositoryList() async {
    try {
      isLoadingMiddle(true);

      final response = await http.get(
        Uri.parse("http://app-interview.easyglue.in/middle_repository.json"),
      );

      if (response.statusCode == 200) {
        final res = MiddleRepositoryModel.fromJson(json.decode(response.body));

        shopByCategoryList.value = res.shopByCategory!;
        boutiqueCollectionList.value = res.boutiqueCollection!;
        shopByFabricList.value = res.shopByFabric!;
        unstitchedList.value = res.unstitched!;

        Get.log("Middle-- shop ${shopByCategoryList.length}");
        Get.log("Middle-- boutique ${boutiqueCollectionList.length}");
        Get.log("Middle-- Fabric ${shopByFabricList.length}");
        Get.log("Middle-- unstitch ${unstitchedList.length}");

        isLoadingMiddle(false);
      } else {
        Get.log("Middle-- ${response.statusCode}");
        isLoadingMiddle(false);
      }
    } catch (e) {
      Get.log('Error fetching or parsing data: $e');
      isLoadingMiddle(false);
      throw Exception('Failed to fetch user. Please try again!');
    }
  }

  getBottomRepositoryList() async {
    try {
      isLoadingBottom(true);

      final response = await http.get(
        Uri.parse("http://app-interview.easyglue.in/bottom_repository.json"),
      );

      if (response.statusCode == 200) {
        final res = BottomRepositoryModel.fromJson(json.decode(response.body));

        designOccasionList.value = res.designOccasion!;
        rangeOfPatternList.value = res.rangeOfPattern!;

        Get.log("Middle-- shop ${designOccasionList.length}");
        Get.log("Middle-- boutique ${rangeOfPatternList.length}");

        isLoadingBottom(false);
      } else {
        Get.log("Bottom-- ${response.statusCode}");
        isLoadingBottom(false);
      }
    } catch (e) {
      Get.log('Error fetching or parsing data: $e');
      isLoadingBottom(false);
      throw Exception('Failed to fetch user. Please try again!');
    }
  }
}

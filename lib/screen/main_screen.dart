import 'package:fabcurate/screen/sale_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/base_color.dart';
import '../utils/base_image.dart';
import '../utils/base_text.dart';
import 'category_screen.dart';
import 'curate_screen.dart';
import 'home_screen.dart';
import 'more_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  final pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const CurateScreen(),
    const SaleScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: IndexedStack(
          index: pageIndex,
          children: pages,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: BaseColor.white,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: BaseColor.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 2.8),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              // vertical: 1.h,
              horizontal: 6.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      pageIndex == 0
                          ? Image.asset(
                              BaseImage.home,
                              width: 3.5.h,
                              height: 3.5.h,
                              color: BaseColor.appColor,
                            )
                          : Image.asset(
                              BaseImage.home,
                              width: 3.5.h,
                              height: 3.5.h,
                              color: BaseColor.black,
                            ),
                      baseText(
                        "Home",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: pageIndex == 0 ? BaseColor.appColor : BaseColor.black,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      pageIndex == 1
                          ? Image.asset(
                              BaseImage.category,
                              width: 3.5.h,
                              height: 3.5.h,
                              color: BaseColor.appColor,
                            )
                          : Image.asset(
                              BaseImage.category,
                              width: 3.5.h,
                              height: 3.5.h,
                              color: BaseColor.black,
                            ),
                      baseText(
                        "Category",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: pageIndex == 1 ? BaseColor.appColor : BaseColor.black,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      pageIndex == 2
                          ? Image.asset(
                              BaseImage.curate,
                              width: 3.5.h,
                              height: 3.5.h,
                              color: BaseColor.appColor,
                            )
                          : Image.asset(
                              BaseImage.curate,
                              width: 3.5.h,
                              height: 3.5.h,
                              color: Colors.black,
                            ),
                      baseText(
                        "Curate",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: pageIndex == 2 ? BaseColor.appColor : BaseColor.black,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      pageIndex == 3
                          ? Image.asset(
                              BaseImage.sale,
                              width: 3.5.h,
                              height: 3.5.h,
                              color: BaseColor.appColor,
                            )
                          : Image.asset(
                              BaseImage.sale,
                              width: 3.5.h,
                              height: 3.5.h,
                              color: BaseColor.black,
                            ),
                      baseText(
                        "Sale",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: pageIndex == 3 ? BaseColor.appColor : BaseColor.black,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 4;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      pageIndex == 4
                          ? Image.asset(
                              BaseImage.more,
                              width: 3.5.h,
                              height: 3.5.h,
                              color: BaseColor.appColor,
                            )
                          : Image.asset(
                              BaseImage.more,
                              width: 3.5.h,
                              height: 3.5.h,
                              color: BaseColor.black,
                            ),
                      baseText(
                        "More",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: pageIndex == 4 ? BaseColor.appColor : BaseColor.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

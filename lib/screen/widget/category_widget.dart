import 'package:cached_network_image/cached_network_image.dart';
import 'package:fabcurate/utils/base_color.dart';
import 'package:fabcurate/utils/base_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../model/category_model.dart';

class CategoryWidget extends StatefulWidget {
  final Categories categories;

  const CategoryWidget({
    super.key,
    required this.categories,
  });

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> with TickerProviderStateMixin {
  late final AnimationController _controller;

  // animation that generates value depending on tween applied
  late final Animation<double> _animation;

  // define the begin and the end value of an animation
  late final Tween<double> _sizeTween;

  // expansion state
  bool _isExpanded = false;
  bool isArrowUp = false;

  void _expandOnChanged() {
    _isExpanded = !_isExpanded;
    _isExpanded ? _controller.forward() : _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _sizeTween = Tween(begin: 0, end: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //Expandable Header
          GestureDetector(
            onTap: () {
              _expandOnChanged();
              setState(() {
                isArrowUp = !isArrowUp;
              });
            },
            child: Container(
              height: 12.h,
              color: BaseColor.appColor,
              width: double.infinity,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: baseText(
                            widget.categories.categoryName!,
                            fontSize: 17.sp,
                            maxLines: 1,
                            fontWeight: FontWeight.w500,
                            color: BaseColor.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: "https://www.91-cdn.com/hub/wp-content/uploads/2022/07/Top-laptop-brands-in-India.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  isArrowUp
                      ? Icon(
                          Icons.keyboard_arrow_down,
                          size: 3.2.h,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.keyboard_arrow_right,
                          size: 3.2.h,
                          color: Colors.white,
                        ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.3.h,
          ),

          //Expandable body
          SizeTransition(
            sizeFactor: _sizeTween.animate(_animation),
            // a widget given to the StatefulWidget
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.categories.child!.length,
                itemBuilder: (context, index) {
                  final data = widget.categories.child![index];

                  return Column(
                    children: [
                      Container(
                        color: BaseColor.grey,
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: baseText(
                                  data.categoryName!,
                                  fontSize: 15.sp,
                                  maxLines: 1,
                                  fontWeight: FontWeight.w500,
                                  color: BaseColor.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: CachedNetworkImage(
                                imageUrl: "https://www.91-cdn.com/hub/wp-content/uploads/2022/07/Top-laptop-brands-in-India.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.3.h,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

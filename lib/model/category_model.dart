class CategoryModel {
  List<Categories>? categories;
  String? bannerImage;
  String? status;
  String? message;

  CategoryModel({this.categories, this.bannerImage, this.status, this.message});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    bannerImage = json['banner_image'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['banner_image'] = bannerImage;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Categories {
  String? categoryId;
  String? categoryName;
  String? parentId;
  List<Child>? child;

  Categories({this.categoryId, this.categoryName, this.parentId, this.child});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    parentId = json['parent_id'];
    if (json['child'] != null) {
      child = <Child>[];
      json['child'].forEach((v) {
        child!.add(Child.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['parent_id'] = parentId;
    if (child != null) {
      data['child'] = child!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Child {
  String? categoryId;
  String? categoryName;
  String? parentId;

  Child({this.categoryId, this.categoryName, this.parentId});

  Child.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['parent_id'] = parentId;
    return data;
  }
}

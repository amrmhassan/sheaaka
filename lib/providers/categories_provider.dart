import 'package:flutter/cupertino.dart';
import 'package:project/constants/categories.dart';
import 'package:project/constants/genders_constants.dart';
import 'package:project/constants/product_constants.dart';
import 'package:project/models/category_model.dart';
import 'package:project/models/customer_gender_model.dart';
import 'package:project/models/types.dart';

class CategoriesProvider extends ChangeNotifier {
  //# fetch categories from cloud
  //? not now

  //# user genders
  List<CustomerGenderModel> genders = [...gendersConstants];
  String activeGenderId = gendersConstants.first.id;
  //? set active gender id
  void setActiveGenderId(String g) {
    //* set categories to match the active gender

    activeGenderId = g;
    notifyListeners();
  }

  //? active gender model
  CustomerGenderModel get activeGenderModel {
    return genders.firstWhere((element) => element.id == activeGenderId);
  }

  //? get gender by id
  CustomerGenderModel getGenderById(String id) {
    return genders.firstWhere((element) => element.id == id);
  }

  //# categories
  List<CategoryModel> get categories {
    return [
      ...categoriesConstants
          .where((element) => element.categoryGenderId == activeGenderId)
    ];
  }

  CategoryModel allOfGenderCategory =
      categoriesConstants.firstWhere((element) => element.id == 'all');

  String? activeCategoryId;

  //? set active category id
  void setActiveCategoryId(String id) {
    activeCategoryId = id;
    notifyListeners();
  }

//? active category model
  CategoryModel? get activeCategoryModel {
    try {
      return categories.firstWhere((element) => element.id == activeCategoryId);
    } catch (e) {
      return null;
    }
  }

  //? get category by id
  CategoryModel getCategoryById(String id) {
    return categories.firstWhere((element) => element.id == id);
  }

  //# colors
  List<dynamic> availableColors = ['all', ...productColors];
  dynamic activeColor = 'all';

  //? set active color
  void setActiveColor(dynamic a) {
    activeColor = a;
    notifyListeners();
  }

  //# sizes
  List<Sizes> sizes = [...productSizes];
  int? activeSizeIndex = productSizes.first.index;
  List<String> dd = [];

  Sizes? get activeSizeEnum {
    return activeSizeIndex == null ? null : Sizes.values[activeSizeIndex!];
  }

//? set active size
  void setActiveSize(int s) {
    activeSizeIndex = s;
    notifyListeners();
  }
}

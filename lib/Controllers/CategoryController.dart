import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Interfaces/ICategoryRepository.dart';
import 'package:review_app/Models/CategoriesViewModel.dart';
import 'package:review_app/Utils/Locator.dart';

class CategoryController extends GetxController{
 TextEditingController categoryName;
 var _categoryRepository=locator<ICategoryRepository>();
 var categoryList=<CategoriesViewModel>[].obs;
  @override
  void onInit() {
    if(categoryName==null) {
      categoryName = TextEditingController();
    }
    super.onInit();
  }
  getCategories(BuildContext context,int businessId){
    _categoryRepository.getCategories(businessId, context).then((categoriesList){
      categoryList.assignAll(categoriesList);
    });
  }
  @override
  void onClose() {
    super.onClose();
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Interfaces/ICategoryRepository.dart';
import 'package:review_app/Models/CategoriesViewModel.dart';
import 'package:review_app/Utils/Locator.dart';
import 'package:review_app/Utils/Utils.dart';

class CategoryController extends GetxController{
 TextEditingController categoryName;
 var _categoryRepository=locator<ICategoryRepository>();
 var _categoryList=<CategoriesViewModel>[].obs;
 var categoryList=<CategoriesViewModel>[];
  @override
  void onInit() {
    if(categoryName==null) {
      categoryName = TextEditingController();
    }
  }
  getCategories(BuildContext context,int businessId){
    _categoryRepository.getCategories(businessId, context).then((categoriesList){
      _categoryList.assignAll(categoriesList);
      categoryList.clear();
      categoryList.addAll(_categoryList);
    });
  }
  addCategories(BuildContext context,int businessId){
    if(categoryName.text.isEmpty){
      Utils.showError(context,"Category Name is Required");
    }else {
      _categoryRepository.addCategories(CategoriesViewModel(
        name: categoryName.text,
        businessId: businessId,
        categoryId: 0,
      ), context).then((value){
        categoryName.text="";
      });
    }
  }
  @override
  void onClose() {
    categoryName?.dispose();
  }
}
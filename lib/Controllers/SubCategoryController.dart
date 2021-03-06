import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Interfaces/ISubCategoryRepository.dart';
import 'package:review_app/Models/CategoriesViewModel.dart';
import 'package:review_app/Utils/Locator.dart';
import 'package:review_app/Utils/Utils.dart';

class SubCategoryController extends GetxController{
  TextEditingController subCategoryName;
  var _subcategories=<CategoriesViewModel>[].obs;
  var subcategoryList=<CategoriesViewModel>[];
  var _subCategoryRepository=locator<ISubCategoryRepository>();
  @override
  void onInit() {
    if(subCategoryName==null) {
      subCategoryName = TextEditingController();
    }
    super.onInit();
  }
   addSubCategory(BuildContext context,int categoryId,int businessId){
    if(subCategoryName.text.isEmpty){
      Utils.showError(context,"Sub Category Name is Required");
    }else{
      _subCategoryRepository.addSubCategories(CategoriesViewModel(
        categoryId: categoryId,
        businessId: businessId,
        name: subCategoryName.text
      ), context).then((value){
        subCategoryName.text="";
      });
    }
   }
   getSubCategory(int categoryId,BuildContext context){
    _subCategoryRepository.getSubCategories(categoryId, context).then((value){
      _subcategories.assignAll(value);
      subcategoryList.clear();
      subcategoryList.addAll(_subcategories);
    });
   }
  @override
  void onClose() {
    subCategoryName?.dispose();
    super.onClose();
  }
}
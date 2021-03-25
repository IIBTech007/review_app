import 'package:flutter/cupertino.dart';
import 'package:review_app/Models/CategoriesViewModel.dart';
abstract class ISubCategoryRepository{
  Future<List<CategoriesViewModel>> getSubCategories(int categoryId,BuildContext context);
  Future<List<CategoriesViewModel>> getSubCategoriesforCustomer(int categoryId,BuildContext context);
  Future<void> addSubCategories(CategoriesViewModel categoriesViewModel,BuildContext context);
  Future<void> changeVisibility(int id,BuildContext context);
  Future<void> updateSubCategories(int id,CategoriesViewModel categoriesViewModel,BuildContext context);
}
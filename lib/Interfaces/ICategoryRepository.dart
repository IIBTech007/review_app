import 'package:flutter/cupertino.dart';
import 'package:review_app/Models/CategoriesViewModel.dart';

abstract class ICategoryRepository{
  Future<List<CategoriesViewModel>> getCategories(int businessId,BuildContext context);
  Future<void> addCategories(CategoriesViewModel categoriesViewModel,BuildContext context);
  Future<void> changeVisibility(int id);
}
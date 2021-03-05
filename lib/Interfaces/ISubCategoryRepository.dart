import 'package:review_app/Models/CategoriesViewModel.dart';
abstract class ISubCategoryRepository{
  Future<List<CategoriesViewModel>> getSubCategories(int categoryId);
  Future<void> addSubCategories(CategoriesViewModel categoriesViewModel);
  Future<void> changeVisibility(int id);
}
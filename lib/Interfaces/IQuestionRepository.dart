import 'package:flutter/cupertino.dart';
import 'package:review_app/Models/Questions.dart';

abstract class IQuestionRepository{
  Future<void> addQuestions(Questions questions,BuildContext context);
  Future<List<Questions>> getQuestionsBySubCategory(int subcategoryId,BuildContext context);
  Future<List<Questions>> getQuestionsBySubCategoryforCustomer(int subcategoryId,BuildContext context);
  Future<List<Questions>> getQuestionsByBusiness(int businessId,BuildContext context);
  Future<List<Questions>> getQuestionsCategory(int categoryId,BuildContext context);
  Future<void> changeVisibility(int id,BuildContext context);
  Future<void> updateQuestions(Questions questions,BuildContext context);
}
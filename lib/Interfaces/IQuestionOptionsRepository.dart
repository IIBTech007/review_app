import 'package:flutter/cupertino.dart';
import 'package:review_app/Models/QuestionOptions.dart';

abstract class IQuestionOptionsRepository{
  Future<void> addQuestionOptions(QuestionOptions questions,BuildContext context);
  Future<void> updateQuestionOptions(QuestionOptions questions,BuildContext context);
  Future<List<QuestionOptions>> getQuestionOptions(int questionId,BuildContext context);
  Future<void> changeVisibility(int id,BuildContext context);
}
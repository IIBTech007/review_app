import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Interfaces/IQuestionRepository.dart';
import 'package:review_app/Models/QuestionOptions.dart';
import 'package:review_app/Models/Questions.dart';
import 'package:review_app/Utils/Locator.dart';

class QuestionController extends GetxController{
  TextEditingController questionText;
 var _questionRepository= locator<IQuestionRepository>();
 var optionsList =<QuestionOptions>[].obs;
  var _questionList =<Questions>[].obs;
  var questionList=<Questions>[];
  List reviewTypeList=["Star Rating", "Yes/No", "Radio Button", "Number Rating"];
  var questionTypeId=1.obs;
  @override
  void onInit() {
   if(questionText==null){
     questionText=TextEditingController();
   }

  }
   AddQuestions(int businessId,int categoryId,int subcategoryId,BuildContext context){
      _questionRepository.addQuestions(Questions(
        businessId: businessId,
        categoryId: categoryId,
        questionText: questionText.text,
        questionType: questionTypeId.value,
        subCategoryId: subcategoryId,
        questionOptions: optionsList
      ), context).then((value) =>questionText.text="");
   }
   getQuestionsBySubCategory(int subCategoryId,BuildContext context){
    _questionRepository.getQuestionsBySubCategory(subCategoryId, context).then((questionlist){
      _questionList.assignAll(questionlist);
      questionList.clear();
      questionList.addAll(_questionList);
    });
   }
  getQuestionsByCategory(int CategoryId,BuildContext context){
    _questionRepository.getQuestionsCategory(CategoryId, context).then((questionlist){
      _questionList.assignAll(questionlist);
      questionList.clear();
      questionList.addAll(_questionList);
    });
  }
  getQuestionsByBusiness(int businessId,BuildContext context){
    _questionRepository.getQuestionsByBusiness(businessId, context).then((questionlist){
      _questionList.assignAll(questionlist);
      questionList.clear();
      questionList.addAll(_questionList);
    });
  }
  @override
  void onClose() {
     questionText?.dispose();
  }
}
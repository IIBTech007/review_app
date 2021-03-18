import 'package:flutter/material.dart';
import 'package:review_app/Models/OverallReport.dart';
import 'package:review_app/Models/feedback.dart';

abstract class IFeedBackRepository{
 Future<void> AddFeedBack(feedback feedback,BuildContext context);
 Future<List<feedback>> getFeedBack(int categoryId,int subcategoryId,int businessId,String email,BuildContext context);
 Future<OverallReport> getOverAllReport(int businessId,double days,BuildContext context);
 Future<List<feedback>> getFeedbackforCustomer(int categoryId,int subcategoryId,int businessId,String email,BuildContext context);
 Future<void> updateFeedBack(feedback feedback,BuildContext context);
 Future<void> changeVisibility(int id,BuildContext context);
}
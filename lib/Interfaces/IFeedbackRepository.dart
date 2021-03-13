import 'package:flutter/material.dart';
import 'package:review_app/Models/feedback.dart';

abstract class IFeedBackRepository{
 Future<void> AddFeedBack(feedback feedback,BuildContext context);
 Future<List<feedback>> getFeedBack(int categoryId,int subcategoryId,int businessId,BuildContext context);
}
import 'package:flutter/material.dart';
import 'package:review_app/Models/BusinessViewModel.dart';

abstract class IBusinessRepository{
 Future<void> addBusiness(BusinessViewModel businessViewModel,BuildContext context);
 Future<List<BusinessViewModel>> getBusinessByOwner(BuildContext context);
 Future<void> updateBusiness(BusinessViewModel businessViewModel,BuildContext context);
 Future<void> changeVisibility(int id);
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Controllers/CategoryController.dart';
import 'package:review_app/components/colorConstants.dart';

class AddBusinessCategory extends StatefulWidget {
  int businessId;

  AddBusinessCategory(this.businessId);

  @override
  _AddBusinessCategoryState createState() => _AddBusinessCategoryState();
}

class _AddBusinessCategoryState extends State<AddBusinessCategory> {
  final categoriesController=Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Business Category", style: TextStyle(
            color: color3, fontSize: 22, fontWeight: FontWeight.bold
        ),
        ),
        iconTheme: IconThemeData(
            color: color3
        ),
        centerTitle: true,
        backgroundColor: color1,
      ),
      body: Container(
        color: color4,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: categoriesController.categoryName,
                style: TextStyle(color: color1,fontWeight: FontWeight.bold),
                obscureText: false,
                validator: (String value) =>
                value.isEmpty ? "This field is Required" : null,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color1, width: 1.0)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color1, width: 1.0)
                  ),
                  labelText: "Category Name",
                  labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),

                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                categoriesController.addCategories(context,widget.businessId);
              },
              child: Center(
                child: Container(
                  height: 55,
                  width: 220,
                  decoration: BoxDecoration(
                    color: color3,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("SAVE", style: TextStyle(
                      color: color1,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

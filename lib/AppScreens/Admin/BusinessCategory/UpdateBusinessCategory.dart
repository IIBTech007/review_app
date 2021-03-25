import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Controllers/CategoryController.dart';
import 'package:review_app/Models/CategoriesViewModel.dart';
import 'package:review_app/components/colorConstants.dart';
class UpdateBusinessCategory extends StatefulWidget{
  CategoriesViewModel category;

  UpdateBusinessCategory(this.category);

  @override
  _UpdateBusinessCategoryState createState() => _UpdateBusinessCategoryState();
}

class _UpdateBusinessCategoryState extends State<UpdateBusinessCategory> {
  final categoriesController=Get.find<CategoryController>();
  @override
  void initState() {
    categoriesController.categoryName.text=widget.category.name;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Business Category", style: TextStyle(
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
                categoriesController.UpdateCategories(CategoriesViewModel(
                  name: categoriesController.categoryName.text,
                  categoryId: 0,
                  id: widget.category.id,
                  businessId: widget.category.businessId,
                ),context);
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
                    child: Text("Update", style: TextStyle(
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

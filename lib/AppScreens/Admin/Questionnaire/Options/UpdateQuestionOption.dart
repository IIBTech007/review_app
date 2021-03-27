import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Controllers/CategoryController.dart';
import 'package:review_app/Controllers/QuestionOptionsController.dart';
import 'package:review_app/Models/CategoriesViewModel.dart';
import 'package:review_app/components/colorConstants.dart';

import '../../../../Models/QuestionOptions.dart';
class UpdateOptions extends StatefulWidget{
  QuestionOptions options;

  UpdateOptions(this.options);

  @override
  _UpdateBusinessCategoryState createState() => _UpdateBusinessCategoryState();
}

class _UpdateBusinessCategoryState extends State<UpdateOptions> {
  final optionController=Get.find<QuestionOptionsController>();
  @override
  void initState() {
    optionController.questionOptionText.text=widget.options.questionOptionText;
    optionController.value.text=widget.options.rating.toString();

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
                controller: optionController.questionOptionText,
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
                  labelText: "Option Text",
                  labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),

                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: optionController.value,
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
                  labelText: "Rating",
                  labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),

                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                optionController.UpdateQuestionOptions
                (QuestionOptions(
                 questionOptionId: widget.options.questionOptionId,
                  questionOptionText: optionController.questionOptionText.text,
                  rating: double.parse(optionController.value.text),
                  questionId: widget.options.questionId
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

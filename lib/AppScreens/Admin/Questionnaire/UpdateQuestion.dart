import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/AppScreens/Admin/Questionnaire/AddAnswers.dart';
import 'package:review_app/Controllers/QuestionsController.dart';
import 'package:review_app/components/colorConstants.dart';

import '../../../Models/Questions.dart';
import '../../../Utils/Utils.dart';


class UpdateQuestion extends StatefulWidget {
  int businessId,categoryId,subCategoryId;
 Questions questions;
  UpdateQuestion(this.businessId, this.categoryId, this.subCategoryId,this.questions);

  @override
  _AddAQuestionState createState() => _AddAQuestionState();
}

class _AddAQuestionState extends State<UpdateQuestion> {
  final _questionController=Get.find<QuestionController>();
  @override
  void initState() {
    _questionController.questionText.text = widget.questions.questionText;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add A Question", style: TextStyle(
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _questionController.questionText,
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
                    labelText: "Question?",
                    labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: DropdownButtonFormField(
                  value: Utils.getQuestionType(widget.questions.questionType),
                  items: _questionController.reviewTypeList!=null?_questionController.reviewTypeList.map((trainer)=>DropdownMenuItem(
                    child: Text(trainer,style: TextStyle(color: color1),),
                    value: trainer,
                  )).toList():[""].map((name) => DropdownMenuItem(
                      value: name,
                      child: Text("$name",style: TextStyle(color: color1),)))
                      .toList(),
                  decoration: InputDecoration(labelText: "Review Options",labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: BorderSide(color: color1, width: 1.0)
                    ),
                  ),
                  onChanged: (value){
                    _questionController.questionTypeId.value=_questionController.reviewTypeList.indexOf(value)+1;
                  },
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  // if(_questionController.questionTypeId.value==3){
                  //   Navigator.push(context,MaterialPageRoute(builder:(context)=>AddOptions(businessId: widget.businessId,subCategoryId: widget.subCategoryId,categoryId: widget.categoryId,questionTypeId: _questionController.questionTypeId.value,questionText: _questionController.questionText.text,)));
                  // }else{
                    _questionController.UpdateQuestions(widget.businessId, widget.categoryId, widget.subCategoryId,widget.questions.id, context);
                //  }
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
      ),
    );
  }
}

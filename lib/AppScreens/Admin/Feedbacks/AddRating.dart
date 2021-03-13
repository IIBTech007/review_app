import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:review_app/AppScreens/Admin/Feedbacks/CommentWithPicture.dart';
import 'package:review_app/Controllers/FeedbackController.dart';
import 'package:review_app/Controllers/QuestionsController.dart';
import 'package:review_app/Models/CustomerFeedBack.dart';
import 'package:review_app/Models/SelectedOptions.dart';
import 'package:review_app/Utils/Utils.dart';
import 'package:review_app/components/colorConstants.dart';

class AddRatings extends StatefulWidget {
  int businessId,categoryId,subcategoryId;

  AddRatings({this.businessId,this.categoryId,this.subcategoryId});

  @override
  _AddRatingsState createState() => _AddRatingsState();
}

class _AddRatingsState extends State<AddRatings> {
  StreamController _event =StreamController<dynamic>.broadcast();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  var groupValue,groupValue2;
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _questionController =Get.put(QuestionController());
    final _feedbackController=Get.put(FeedbackController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Review"),
        iconTheme: IconThemeData(
            color: color3
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon:Icon(Icons.add),
            onPressed: (){
             Navigator.push(context,MaterialPageRoute(builder: (context)=>CommentWithPicture(businessId: widget.businessId,subcategoryId: widget.subcategoryId,categoryId: widget.categoryId,)));
            },
          )
        ],
        backgroundColor: color1,
      ),

      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: ()async{
          return Utils.check_connectivity().then((isConnected){
            if(isConnected){
              _questionController.getQuestionsBySubCategory(widget.subcategoryId, context);
            }
          });
        },
        child: Container(
          color: color4,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:Obx((){

            return ListView.builder(itemCount: _questionController.questionList.length, itemBuilder: (context, index){

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  //height: 190,
                  decoration: BoxDecoration(
                    color: color4,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: color1, width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_questionController.questionList[index].questionText, style: TextStyle(
                            color: color3,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                      _questionController.questionList[index].questionType==1?Center(
                        child: RatingBar.builder(
                          initialRating: 0,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            switch (index) {
                              case 0:
                                return Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.red,
                                );
                              case 1:
                                return Icon(
                                  Icons.sentiment_dissatisfied,
                                  color: Colors.redAccent,
                                );
                              case 2:
                                return Icon(
                                  Icons.sentiment_neutral,
                                  color: Colors.amber,
                                );
                              case 3:
                                return Icon(
                                  Icons.sentiment_satisfied,
                                  color: Colors.lightGreen,
                                );
                              case 4:
                                return Icon(
                                  Icons.sentiment_very_satisfied,
                                  color: Colors.green,
                                );
                            }
                          },
                          onRatingUpdate: (rating) {

                            if(_feedbackController.customerFeedback.length>0) {
                              _feedbackController.customerFeedback.removeWhere((
                                  element) => element.questionId ==
                                  _feedbackController.customerFeedback[index]
                                      .questionId);
                            }
                              _feedbackController.customerFeedback.insert(index,
                                  CustomerFeedBack(
                                      businessId: widget.businessId,
                                      categoryId: _questionController
                                          .questionList[index].categoryId,
                                      subCategoryId: _questionController
                                          .questionList[index].subCategoryId,
                                      questionId: _questionController
                                          .questionList[index].id,
                                      rating: rating,
                                    selectedOptions: [],
                                  ));
                          },
                        ),
                      ):_questionController.questionList[index].questionType==2?Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          RadioListTile(
                        value: "Yes",
                        groupValue: groupValue,
                        onChanged:(value){
                          var alreadyAdded=false;
                          setState(() {
                            groupValue=value;
                              _feedbackController.customerFeedback.insert(index,
                                  CustomerFeedBack(
                                      businessId: widget.businessId,
                                      categoryId: _questionController
                                          .questionList[index].categoryId,
                                      subCategoryId: _questionController
                                          .questionList[index].subCategoryId,
                                      questionId: _questionController
                                          .questionList[index].id,
                                      rating: 5.0,
                                    selectedOptions: [],
                                  ));
                          });
                        },
                        title: Text("Yes"),
                      ),
                          RadioListTile(
                            value: "No",
                            groupValue: groupValue,
                            onChanged:(value){
                              setState(() {
                                groupValue=value;
                                  _feedbackController.customerFeedback.insert(index,
                                      CustomerFeedBack(
                                          businessId: widget.businessId,
                                          categoryId: _questionController
                                              .questionList[index].categoryId,
                                          subCategoryId: _questionController
                                              .questionList[index].subCategoryId,
                                          questionId: _questionController
                                              .questionList[index].id,
                                          rating: 2.0,
                                        selectedOptions: [],
                                      ));

                              });
                            },
                            title: Text("No"),
                          ),
                        ],
                      ):_questionController.questionList[index].questionType==3?
                      Container(
                        height: 150,
                        child: ListView.builder(
                          itemCount: _questionController.questionList[index].questionOptions.length,
                          itemBuilder: (BuildContext context,int i){

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RadioListTile(
                                  value: _questionController.questionList[index].questionOptions[i].questionOptionText,
                                  groupValue: groupValue2,
                                  title: Text(_questionController.questionList[index].questionOptions[i].questionOptionText),
                                  onChanged: (value){
                                    List<SelectedOptions> options=[];
                                    setState(() {
                                      groupValue2=value;
                                      options.add(SelectedOptions(questionOptionsId:  _questionController.questionList[index].questionOptions[i].questionOptionId));
                                        _feedbackController.customerFeedback.insert(index,
                                            CustomerFeedBack(
                                              businessId: widget.businessId,
                                              categoryId: _questionController
                                                  .questionList[index].categoryId,
                                              subCategoryId: _questionController
                                                  .questionList[index].subCategoryId,
                                              questionId: _questionController
                                                  .questionList[index].id,
                                              rating:  _questionController.questionList[index].questionOptions[i].rating,
                                              selectedOptions: options,
                                            ));
                                    });
                                  },
                                )
                              ],
                            );
                          },
                        ),
                      ):Container()
                    ],
                  ),
                ),
              );
            });
          })
        ),
      ),
    );
  }
}

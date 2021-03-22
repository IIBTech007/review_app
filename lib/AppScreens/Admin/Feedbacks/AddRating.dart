import 'dart:async';

// import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_app/AppScreens/Admin/Feedbacks/CommentWithPicture.dart';
import 'package:review_app/Controllers/FeedbackController.dart';
import 'package:review_app/Controllers/QuestionsController.dart';
import 'package:review_app/Models/CustomerFeedBack.dart';
import 'package:review_app/Models/SelectedOptions.dart';
import 'package:review_app/Utils/Utils.dart';
import 'package:review_app/components/colorConstants.dart';
import 'package:review_app/components/radio_grouped.dart';

import '../../customRadioBtn.dart';
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
        title: Text("Add Review",
          style: GoogleFonts.prompt(
            textStyle: TextStyle(
                color: color4,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        iconTheme: IconThemeData(
            color: color4
        ),
        centerTitle: true,
        backgroundColor: color3,
        actions: [
          IconButton(
            icon:Icon(Icons.add, color: color4, size: 30,),
            onPressed: (){
              // final ids = _feedbackController.customerFeedback.map((e) => e.questionId).toSet();
              // _feedbackController.customerFeedback.retainWhere((x) => ids.remove(x.questionId));
              // for(int i=0;i<_feedbackController.customerFeedback.length;i++){
              //   print(_feedbackController.customerFeedback[i].toJson());
              // }
              // print(_feedbackController.customerFeedback.length);
              //print(_feedbackController.customerFeedback.toString());
             Navigator.push(context,MaterialPageRoute(builder: (context)=>CommentWithPicture(businessId: widget.businessId,subcategoryId: widget.subcategoryId,categoryId: widget.categoryId,)));
            },
          )
        ],
      ),

      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: ()async{
          return Utils.check_connectivity().then((isConnected){
            if(isConnected){
              _questionController.getQuestionsforCustomer(widget.subcategoryId, context);
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
                child: Card(
                  elevation: 6,
                  color: color4,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    //height: 190,
                    decoration: BoxDecoration(
                      //color: color4,
                      borderRadius: BorderRadius.circular(8),
                      //border: Border.all(color: color1, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_questionController.questionList[index].questionText,
                            style: GoogleFonts.prompt(
                              textStyle: TextStyle(
                                  color: color3,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
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

                              // if(_feedbackController.customerFeedback.length>0) {
                              //   _feedbackController.customerFeedback.removeWhere((
                              //       element) => element.questionId ==
                              //       _feedbackController.customerFeedback[index]
                              //           .questionId);
                              // }
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
                                        questions: _questionController
                                            .questionList[index],
                                      selectedOptions: [],
                                    ));
                            },
                          ),
                        ):_questionController.questionList[index].questionType==2?Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RadioListTile(
                          value: "Yes",
                          groupValue: groupValue2,
                          onChanged:(value){
                            var alreadyAdded=false;
                            setState(() {
                              groupValue2=value;
                                _feedbackController.customerFeedback.insert(index,
                                    CustomerFeedBack(
                                        businessId: widget.businessId,
                                        categoryId: _questionController
                                            .questionList[index].categoryId,
                                        subCategoryId: _questionController
                                            .questionList[index].subCategoryId,
                                        questionId: _questionController
                                            .questionList[index].id,
                                         questions: _questionController
                                             .questionList[index],
                                        rating: 5.0,
                                      selectedOptions: [],
                                    ));
                            });
                          },
                          title: Text("Yes",
                            style: GoogleFonts.prompt(
                              textStyle: TextStyle(
                                  color: color1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                            RadioListTile(
                              value: "No",
                              groupValue: groupValue2,
                              onChanged:(value){
                                setState(() {
                                  groupValue2=value;
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
                              title: Text("No",
                                style: GoogleFonts.prompt(
                                  textStyle: TextStyle(
                                      color: color1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
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
                                  // MyCustomRadioButton(
                                  //   elevation: 0,
                                  //   absoluteZeroSpacing: false,
                                  //   enableShape: true,
                                  //   padding:5,
                                  //   enableButtonWrap: true,
                                  //   width: 100,
                                  //   horizontal: true,
                                  //   unSelectedColor: Theme.of(context).canvasColor,
                                  //   //defaultSelected:_questionController.questionList[index].questionOptions[i].questionOptionText,
                                  //   buttonLables: [
                                  //     _questionController.questionList[index].questionOptions[i].questionOptionText
                                  //   ],
                                  //   buttonValues: [
                                  //     _questionController.questionList[index].questionOptions[i].rating
                                  //    // _questionController.questionList[index].questionOptions[i].questionOptionText
                                  //   ],
                                  //
                                  //   // buttonTextStyle: ButtonTextStyle(
                                  //   //     selectedColor: Colors.white,
                                  //   //     unSelectedColor: Colors.yellow,
                                  //   //     textStyle: TextStyle(fontSize: 16)),
                                  //   radioButtonValue: (value) {
                                  //     print(value);
                                  //   },
                                  //   autoWidth: false,
                                  //   selectedColor: Theme.of(context).accentColor,
                                  // ),
                                  customRadioBtn(
                                    buttonValue: [ _questionController.questionList[index].questionOptions[i].rating],
                                    buttonLabels: [ _questionController.questionList[index].questionOptions[i].questionOptionText],
                                  )
                                  // RadioListTile(
                                  //   value: _questionController.questionList[index].questionOptions[i].questionOptionText,
                                  //   groupValue: groupValue,
                                  //   title: Text(_questionController.questionList[index].questionOptions[i].questionOptionText),
                                  //   onChanged: (value){
                                  //     List<SelectedOptions> options=[];
                                  //     setState(() {
                                  //       groupValue=value;
                                  //       options.add(SelectedOptions(questionOptionsId:  _questionController.questionList[index].questionOptions[i].questionOptionId));
                                  //         _feedbackController.customerFeedback.insert(index,
                                  //             CustomerFeedBack(
                                  //               businessId: widget.businessId,
                                  //               categoryId: _questionController
                                  //                   .questionList[index].categoryId,
                                  //               subCategoryId: _questionController
                                  //                   .questionList[index].subCategoryId,
                                  //               questionId: _questionController
                                  //                   .questionList[index].id,
                                  //               rating:  _questionController.questionList[index].questionOptions[i].rating,
                                  //               selectedOptions: options,
                                  //             ));
                                  //     });
                                  //   },
                                  // )
                                ],
                              );
                            },
                          ),
                        ):Container()
                      ],
                    ),
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

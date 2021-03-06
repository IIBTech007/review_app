import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:review_app/AppScreens/Admin/Questionnaire/AddAQuestion.dart';
import 'package:review_app/AppScreens/Admin/ReviewCategory/AddReviewCategory.dart';
import 'package:review_app/components/colorConstants.dart';


class QuestionnaireList extends StatefulWidget {
  @override
  _QuestionnaireListState createState() => _QuestionnaireListState();
}

class _QuestionnaireListState extends State<QuestionnaireList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: color3,size:25,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddAQuestion()));
            },
          ),
        ],
        title: Text("Questionnaire", style: TextStyle(
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(itemCount:5, itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.20,
                secondaryActions: <Widget>[
                  // IconSlideAction(
                  //   //icon: storeList[index].isVisible?Icons.visibility_off:Icons.visibility,
                  //   color: Colors.red,
                  //   //caption: storeList[index].isVisible?"InVisible":"Visible",
                  //   // onTap: () async {
                  //   //   networksOperation.storeVisibility(context, token, storeList[index].id).then((value){
                  //   //     if(value){
                  //   //       Utils.showSuccess(context, "Visibility Changed");
                  //   //       WidgetsBinding.instance
                  //   //           .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
                  //   //     }
                  //   //
                  //   //     else
                  //   //       Utils.showError(context, "Please Tr Again");
                  //   //   });
                  //   // },
                  // ),
                  IconSlideAction(
                    icon: Icons.edit,
                    color: color2,
                    caption: 'Update',
                    // onTap: () async {
                    //   //print(discountList[index]);
                    //   Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdateStore(storeList[index])));
                    // },
                  ),
                ],
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                    //color: color1,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: color3, width: 2)
                  ),
                  child: ListTile(
                    title: Text("How was the taste of food?",
                      style: TextStyle(
                          color: color3,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    subtitle: Text("Good",
                      style: TextStyle(
                          color: color1,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  ),
                )
            ),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:review_app/AppScreens/Admin/Feedbacks/FeedbackDetails.dart';
import 'package:review_app/Controllers/FeedbackController.dart';
import 'package:review_app/Utils/Utils.dart';
import 'package:review_app/components/colorConstants.dart';

class IndividualFeedbacks extends StatefulWidget {
  int businessId;

  IndividualFeedbacks({this.businessId});

  @override
  _IndividualFeedbacksState createState() => _IndividualFeedbacksState();
}

class _IndividualFeedbacksState extends State<IndividualFeedbacks> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _feedbackcontroller=Get.put(FeedbackController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Individual Feedback", style: TextStyle(
            color: color4, fontSize: 22, fontWeight: FontWeight.bold
        ),
        ),
        iconTheme: IconThemeData(
            color: color4
        ),
        centerTitle: true,
        backgroundColor: color3,
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: ()async{
          return Utils.check_connectivity().then((isConnected){
            if(isConnected){
              _feedbackcontroller.getFeedBack(widget.businessId, context);
            }else{
              Utils.showError(context,"Network not Available");
            }
          });
        },
        child: Container(
          color: color4,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:Obx((){
            return ListView.builder(itemCount:_feedbackcontroller.feedbacks.length, itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    if(_feedbackcontroller.feedbacks[index].customerFeedBacks.length>0){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>FeedbackDetails(_feedbackcontroller.feedbacks[index].customerFeedBacks)));
                    }else{
                      Utils.showError(context,"No Details Available");
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    decoration: BoxDecoration(
                      //color: color1,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: color3, width: 2)
                    ),
                    child: ListTile(
                      title: Text(_feedbackcontroller.feedbacks[index].customerName,
                        style: TextStyle(
                            color: color1,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text("Overall Rating: ",
                                    style: TextStyle(
                                        color: color3,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                  Text(_feedbackcontroller.feedbacks[index].overallRating.toStringAsFixed(1),
                                    style: TextStyle(
                                        color: color1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text("City: ",
                                    style: TextStyle(
                                        color: color3,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                  Text("-",
                                    style: TextStyle(
                                        color: color1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text("Country: ",
                                    style: TextStyle(
                                        color: color3,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                  Text("-",
                                    style: TextStyle(
                                        color: color1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text("Email: ",
                                    style: TextStyle(
                                        color: color3,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                  Text(_feedbackcontroller.feedbacks[index].email,
                                    style: TextStyle(
                                        color: color1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text("Phone: ",
                                    style: TextStyle(
                                        color: color3,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                  Text(_feedbackcontroller.feedbacks[index].phone,
                                    style: TextStyle(
                                        color: color1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      leading: FaIcon(
                        FontAwesomeIcons.comments,
                        color: color3,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              );
            });
          }),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:need_resume/need_resume.dart';
import 'package:review_app/AppScreens/Admin/Business/AddBusiness.dart';
import 'package:review_app/AppScreens/Admin/Business/DetailsScreen.dart';
import 'package:review_app/AppScreens/Admin/BusinessCategory/BusinessCategoryList.dart';
import 'package:review_app/AppScreens/Admin/Feedbacks/IndividualFeedbacks.dart';
import 'package:review_app/Controllers/AccountController.dart';
import 'package:review_app/Controllers/BusinessController.dart';
import 'package:review_app/Utils/Utils.dart';
import 'package:review_app/components/colorConstants.dart';
import 'package:review_app/components/constants.dart';

class BusinessList extends StatefulWidget {
  @override
  _BusinessListState createState() => _BusinessListState();
}

class _BusinessListState extends ResumableState<BusinessList> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final businessController=Get.put(BusinessController());
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
    super.initState();
  }


  @override
  void onResume() {
    if(resume.data=="Refresh"){
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
    }
  }

  @override
  Widget build(BuildContext context) {
    final _accountController =Get.find<AccountController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          _accountController.getLoggedInUserData().role=="Admin"?
          IconButton(
            icon: Icon(Icons.add, color: color3,size:25,),
            onPressed: (){
              push(context, MaterialPageRoute(builder: (context)=> AddBusiness()));
            },
          ):Container()
        ],
        title: Text("Business", style: TextStyle(
            color: color3, fontSize: 22, fontWeight: FontWeight.bold
        ),
        ),
        iconTheme: IconThemeData(
            color: color1
        ),
        centerTitle: true,
        backgroundColor: color1,
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: ()async{
          return Utils.check_connectivity().then((isConnected){
            if(isConnected){
              businessController.getBusinessByOwner(context);
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
            return ListView.builder(itemCount: businessController.businesses!=null?businessController.businesses.length:0 ,itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onLongPress: (){
                    push(context,MaterialPageRoute(builder:(context)=>IndividualFeedbacks(businessId: businessController.businesses[index].id,isAdmin: true)));
                  },
                  onTap: (){
                    push(context,MaterialPageRoute(builder:(context)=>BusinessCategoryList(businessController.businesses[index].id)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: color3, width: 2),
                      color: BackgroundColor,
                    ),
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.centerRight,
                              fit: BoxFit.fitHeight,
                              image:  MemoryImage(
                                  base64Decode(businessController.businesses!=null&&businessController.businesses[index].image!=null?businessController.businesses[index].image:'')
                              ),
                              // image:  NetworkImage(
                              //     storeList[index].image!=null?storeList[index].image:"http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg"
                              // ),
                            ),
                          ),
                        ),
                        ClipPath(
                          clipper: TrapeziumClipper(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: BackgroundColor,
                              //border: Border.all(color: yellowColor)
                            ),
                            padding: EdgeInsets.all(8.0),
                            width: 340,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: 280
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            //border: Border.all(color: Colors.amberAccent, width: 2),
                            //color: Colors.white38,
                          ),
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 9),
                                      child: FaIcon(FontAwesomeIcons.utensils, color: color1, size: 17,),
                                    ),
                                    Text("Business: ", style: TextStyle(color: color3, fontSize: 17, fontWeight: FontWeight.bold),),
                                    Container(
                                      width: 140,
                                      child:
                                      Text(businessController.businesses!=null?businessController.businesses[index].name:'-',
                                          //storeList[index].name!=null?storeList[index].name:"",
                                          maxLines: 1 ,
                                          style: TextStyle(color: color1, fontSize: 17, fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 3),
                                          child: FaIcon(FontAwesomeIcons.city, color: color1, size: 17,),
                                        ),
                                        Text("Address: ", style: TextStyle(color: color3, fontSize: 15, fontWeight: FontWeight.bold),),
                                        Container(
                                          width: 150,
                                          child: Text(businessController.businesses!=null&&businessController.businesses[index].address!=null?businessController.businesses[index].address:'-',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(color: color1,
                                                fontSize: 15, fontWeight: FontWeight.bold),),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 3),
                                          child: FaIcon(FontAwesomeIcons.city, color: color1, size: 17,),
                                        ),
                                        Text("Business Type: ", style: TextStyle(color: color3, fontSize: 15, fontWeight: FontWeight.bold),),
                                        Text(businessController.businesses!=null&&businessController.businesses[index].businessType!=null?businessController.businesses[index].businessType.name:'-',
                                          style: TextStyle(color: color1,
                                              fontSize: 15, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 3),
                                      child: FaIcon(FontAwesomeIcons.clock, color: color1, size: 17,),
                                    ),
                                    Text("Opening: ",style: TextStyle(color: color3,fontWeight: FontWeight.bold),),
                                    Text(businessController.businesses!=null&&businessController.businesses[index].openingTime!=null?businessController.businesses[index].openingTime:'-',
                                      style: TextStyle(color: color1,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 3),
                                      child: FaIcon(FontAwesomeIcons.clock, color: color1, size: 17,),
                                    ),
                                    Text("Closing: ",style: TextStyle(color: color3,fontWeight: FontWeight.bold),),
                                    Text(businessController.businesses!=null&&businessController.businesses[index].closingTime!=null?businessController.businesses[index].closingTime:'-',
                                      style: TextStyle(color: color1,fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
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
class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 2/3, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(TrapeziumClipper oldClipper) => false;
}
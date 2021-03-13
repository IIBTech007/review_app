import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:need_resume/need_resume.dart';
import 'package:review_app/AppScreens/Admin/BusinessCategory/AddBusinessCategory.dart';
import 'package:review_app/AppScreens/Admin/BusinessSubcategory/BusinessSubCategoryList.dart';
import 'package:review_app/Controllers/CategoryController.dart';
import 'package:review_app/Utils/Utils.dart';
import 'package:review_app/components/colorConstants.dart';

class BusinessCategoryList extends StatefulWidget {
  int businessId;
  BusinessCategoryList(this.businessId);
  @override
  _BusinessCategoryListState createState() => _BusinessCategoryListState();
}

class _BusinessCategoryListState extends ResumableState<BusinessCategoryList> {
  final categoriesController=Get.put(CategoryController());
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }
  @override
  void onResume() {
    if(resume.data=="Refresh"){
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
    }
    super.onResume();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: color3,size:25,),
            onPressed: (){
              push(context,MaterialPageRoute(builder:(context)=>AddBusinessCategory(widget.businessId)));
            },
          ),
        ],
        title: Text("Business Category", style: TextStyle(
            color: color3, fontSize: 22, fontWeight: FontWeight.bold
        ),
        ),
        iconTheme: IconThemeData(
            color: color3
        ),
        centerTitle: true,
        backgroundColor: color1,
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: ()async{
          return Utils.check_connectivity().then((isConnected){
            if(isConnected){
              categoriesController.getCategories(context, widget.businessId);
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
            return ListView.builder(itemCount:categoriesController.categoryList!=null?categoriesController.categoryList.length:0, itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.20,
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        icon: Icons.edit,
                        color: color2,
                        caption: 'Update',
                        onTap: () async {
                          //Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdateStore(storeList[index])));
                        },
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
                        onTap: (){
                          print(categoriesController.categoryList[index].id);
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>BusinessSubCategoryList(widget.businessId,categoriesController.categoryList[index].id)));
                        },
                        title: Text(categoriesController.categoryList!=null&&categoriesController.categoryList[index].name!=null?categoriesController.categoryList[index].name:"-",
                          style: TextStyle(
                              color: color3,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                        leading: FaIcon(
                          FontAwesomeIcons.building,
                          color: color3,
                        ),
                      ),
                    )
                ),
              );
            });
          }),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:review_app/AppScreens/Admin/Business/AddBusiness.dart';
import 'package:review_app/components/colorConstants.dart';
import 'package:review_app/components/constants.dart';

class BusinessList extends StatefulWidget {
  @override
  _BusinessListState createState() => _BusinessListState();
}

class _BusinessListState extends State<BusinessList> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
    // SharedPreferences.getInstance().then((value) {
    //   setState(() {
    //     this.token = value.getString("token");
    //   });
    // });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: color3,size:25,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddBusiness()));
            },
          ),
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
      body: Container(
        color: color4,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(itemCount: 5 ,itemBuilder: (context, index){
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
                IconSlideAction(
                  icon: FontAwesomeIcons.qrcode, color: color3,
                  caption: 'QR Code',
                  // onTap: () async {
                  //   //print(discountList[index]);
                  //   Navigator.push(context,MaterialPageRoute(builder: (context)=>GenerateScreenForStore(storeList[index],"Store/${storeList[index].id}")));
                  // },
                ),
              ],
              child:Container(
                decoration: BoxDecoration(
                  border: Border.all(color: color3, width: 2),
                  color: BackgroundColor,
                ),
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.centerRight,
                          fit: BoxFit.fitHeight,
                          image:  AssetImage(
                            "assets/business.jpg"
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
                                  Text("Hmara Business",
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
                                    Text("City: ", style: TextStyle(color: color3, fontSize: 15, fontWeight: FontWeight.bold),),
                                    Text("Hmara City",
                                      //"${storeList[index].city}",
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
                                Text("00:00:00",
                                  //storeList[index]. openTime!=null?storeList[index]. openTime:"-",
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
                                Text("00:00:00",
                                  //storeList[index].closeTime!=null?storeList[index].closeTime:"-",
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
        }),
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
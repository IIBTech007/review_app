import 'package:expandable_card/expandable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:review_app/AppScreens/Customer/Details/NewDetailScreen.dart';
import 'package:review_app/components/colorConstants.dart';


class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      body: ExpandableCardPage(
        page: BusinessProfileScreen(),
        expandableCard: ExpandableCard(
          backgroundColor: color1,
          padding: EdgeInsets.only(top: 5, left: 20, right: 20),
          maxHeight: MediaQuery.of(context).size.height - 100,
          minHeight: 105,
          hasRoundedCorners: true,
          hasShadow: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.comments, color: color3, size: 35, ),
                        SizedBox(width: 7,),
                        Text("Reviews",
                          style: TextStyle(
                              color: color4,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 155,),
                        IconButton(icon: FaIcon(FontAwesomeIcons.commentMedical, color: color3, size: 35,),
                            onPressed: (){

                            })
                      ],
                    ),

                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                //border: Border.all(color: color1, width: 2)
              ),
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: ListView.builder(itemCount:7, itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                    //color: color1,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: color3, width: 2)
                  ),
                  child: ListTile(
                    title: Text("Review",
                      style: TextStyle(
                          color: color4,
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Food Joint",
                          style: TextStyle(
                              color: color3,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.amber,
                              size: 20,
                            ),
                            SizedBox(width: 2,),
                            Text("4.5",
                              style: TextStyle(
                                  color: color4,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                    leading: FaIcon(
                      FontAwesomeIcons.comments,
                      color: color3,
                      size: 35,
                    ),
                  ),
                ),
              );
            }),
            )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: <Widget>[
            //     FlatButton(
            //       onPressed: () => 1,
            //       colorBrightness: Brightness.light,
            //       splashColor: Colors.white10,
            //       shape: CircleBorder(),
            //       child: Icon(
            //         Icons.skip_previous,
            //         color: Colors.white,
            //         size: 50,
            //       ),
            //     ),
            //     FlatButton(
            //       onPressed: () => 1,
            //       colorBrightness: Brightness.light,
            //       splashColor: Colors.white10,
            //       shape: CircleBorder(),
            //       child: Icon(
            //         Icons.play_arrow,
            //         color: Colors.white,
            //         size: 100,
            //       ),
            //     ),
            //     FlatButton(
            //       onPressed: () => 1,
            //       colorBrightness: Brightness.light,
            //       splashColor: Colors.white10,
            //       shape: CircleBorder(),
            //       child: Icon(
            //         Icons.skip_next,
            //         color: Colors.white,
            //         size: 50,
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

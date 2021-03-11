import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:review_app/AppScreens/Customer/Details/DetailsScreen.dart';
import 'package:review_app/components/colorConstants.dart';

class ClientSeeAllBusinesses extends StatefulWidget {
  @override
  _ClientSeeAllBusinessesState createState() => _ClientSeeAllBusinessesState();
}

class _ClientSeeAllBusinessesState extends State<ClientSeeAllBusinesses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Businesses", style: TextStyle(
            color: color4, fontSize: 22, fontWeight: FontWeight.bold
        ),
        ),
        iconTheme: IconThemeData(
            color: color4
        ),
        centerTitle: true,
        backgroundColor: color3,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: color4,
        child: ListView.builder(itemCount:5, itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage()));
              },
              child: Card(
                elevation: 6,
                color: color4,
                child: Container(
                  width: 300,
                  height: 210,
                  decoration: BoxDecoration(
                    //color: color4,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/business.jpg")
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              right:10,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                width: 60,
                                height: 30,

                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
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
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.building, color: color3, size: 25,),
                            SizedBox(width: 5,),
                            Text("YalaHabibi Dhabba",
                              style: TextStyle(
                                  color: color3,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.mapMarkedAlt, color: color3, size: 25,),
                            SizedBox(width: 5,),
                            Text("Kashmir Plaza, Ramtalai Chowk, Gujrat, Pakistan",
                              style: TextStyle(
                                  color: color1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

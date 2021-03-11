import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:review_app/components/colorConstants.dart';

class IndividualFeedbacks extends StatefulWidget {
  @override
  _IndividualFeedbacksState createState() => _IndividualFeedbacksState();
}

class _IndividualFeedbacksState extends State<IndividualFeedbacks> {
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        color: color4,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(itemCount:7, itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              decoration: BoxDecoration(
                //color: color1,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: color3, width: 2)
              ),
              child: ListTile(
                title: Text("Client Name",
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
                            Text("Reviews: ",
                              style: TextStyle(
                                  color: color3,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            ),
                            Text("Food, Delivery",
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
                            Text("Basti Malook, Zila Tonsa Shareef",
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
                            Text("Pakistan",
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
                            Text("flanatamkana@gmail.com",
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
          );
        }),
      ),
    );
  }
}

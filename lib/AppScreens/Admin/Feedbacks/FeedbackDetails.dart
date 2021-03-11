import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:review_app/components/colorConstants.dart';



class FeedbackDetails extends StatefulWidget {
  @override
  _FeedbackDetailsState createState() => _FeedbackDetailsState();
}

class _FeedbackDetailsState extends State<FeedbackDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback Details", style: TextStyle(
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
              height: 70,
              decoration: BoxDecoration(
                //color: color1,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: color3, width: 2)
              ),
              child: ListTile(
                title: Text("Question Text",
                  style: TextStyle(
                      color: color1,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                subtitle: Text("Answers ",
                  style: TextStyle(
                      color: color3,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),
                ),
                leading: FaIcon(
                  FontAwesomeIcons.comment,
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

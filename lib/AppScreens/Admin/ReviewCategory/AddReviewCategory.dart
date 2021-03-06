import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review_app/components/colorConstants.dart';


class AddReviewCategory extends StatefulWidget {
  @override
  _AddReviewCategoryState createState() => _AddReviewCategoryState();
}

class _AddReviewCategoryState extends State<AddReviewCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Review Category", style: TextStyle(
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                //controller: contactNo,
                style: TextStyle(color: color1,fontWeight: FontWeight.bold),
                obscureText: false,
                // validator: (String value) =>
                // value.isEmpty ? "This field is Required" : null,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color1, width: 1.0)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color1, width: 1.0)
                  ),
                  labelText: "Review Name",
                  labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                //controller: storeAddress,
                style: TextStyle(color: color1,fontWeight: FontWeight.bold),
                obscureText: false,maxLines: 5,
                // validator: (String value) =>
                // value.isEmpty ? "This field is Required" : null,
                decoration: InputDecoration(
                  // suffixIcon: Icon(Icons.add_location,color: Colors.amberAccent,),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color1, width: 1.0)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color1, width: 1.0)
                  ),
                  labelText: 'Description',
                  labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),
                  //suffixIcon: Icon(Icons.email,color: Colors.amberAccent,size: 27,),
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> NewPasswordScreen()));
              },
              child: Center(
                child: Container(
                  height: 55,
                  width: 220,
                  decoration: BoxDecoration(
                    color: color3,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("SAVE", style: TextStyle(
                      color: color1,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

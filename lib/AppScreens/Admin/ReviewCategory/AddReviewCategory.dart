import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text("Add Review Category",
          style: GoogleFonts.prompt(
            textStyle: TextStyle(
                color: color4,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 6,
                color: color4,
                child: Container(
                  child: TextFormField(
                    //controller: contactNo,
                    style: GoogleFonts.prompt(
                      textStyle: TextStyle(
                          color: color1,
                          //fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    obscureText: false,
                    // validator: (String value) =>
                    // value.isEmpty ? "This field is Required" : null,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color3, width: 1.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color6, width: 1.0)
                      ),
                      labelText: "Review Name",
                      labelStyle: GoogleFonts.prompt(
                        textStyle: TextStyle(
                            color: color3,
                            //fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 6,
                color: color4,
                child: Container(
                  child: TextFormField(
                    //controller: storeAddress,
                    style: GoogleFonts.prompt(
                      textStyle: TextStyle(
                          color: color1,
                          //fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    obscureText: false,maxLines: 5,
                    // validator: (String value) =>
                    // value.isEmpty ? "This field is Required" : null,
                    decoration: InputDecoration(
                      // suffixIcon: Icon(Icons.add_location,color: Colors.amberAccent,),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color3, width: 1.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color6, width: 1.0)
                      ),
                      labelText: 'Description',
                      labelStyle: GoogleFonts.prompt(
                        textStyle: TextStyle(
                            color: color3,
                            //fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      //suffixIcon: Icon(Icons.email,color: Colors.amberAccent,size: 27,),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> NewPasswordScreen()));
              },
              child: Center(
                child: Card(
                  elevation: 6,
                  color: color3,
                  child: Container(
                    height: 55,
                    width: 220,
                    decoration: BoxDecoration(
                      color: color3,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("SAVE", style:
                      GoogleFonts.prompt(
                        textStyle: TextStyle(
                            color: color3,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),
                    ),
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

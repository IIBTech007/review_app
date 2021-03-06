import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review_app/components/colorConstants.dart';


class AddAQuestion extends StatefulWidget {
  @override
  _AddAQuestionState createState() => _AddAQuestionState();
}

class _AddAQuestionState extends State<AddAQuestion> {
  List reviewTypeList=["Star Rating", "MultiSelect", "Combo Box", "Number Rating", "Yes/No"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add A Question", style: TextStyle(
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    labelText: "Question?",
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
                  obscureText: false,maxLines: 4,
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
              Padding(
                padding: const EdgeInsets.all(8),
                child: DropdownButtonFormField(
                  // hint: Text("Select Size"),
                  items: reviewTypeList!=null?reviewTypeList.map((trainer)=>DropdownMenuItem(
                    child: Text(trainer,style: TextStyle(color: color1),),
                    value: trainer,
                  )).toList():[""].map((name) => DropdownMenuItem(
                      value: name, child: Text("$name",style: TextStyle(color: color1),)))
                      .toList(),
                  decoration: InputDecoration(labelText: "Review Options",labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: BorderSide(color: color1, width: 1.0)
                    ),
                  ),
                  onChanged: (value){
                    setState(() {
                      //selected_size.insert(cards.length-1, sizesList.indexOf(value));

                    });
                  },
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
      ),
    );
  }
}

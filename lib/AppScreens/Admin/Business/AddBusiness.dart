import 'dart:convert';
import 'dart:io';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review_app/Controllers/BusinessController.dart';
import 'package:review_app/Models/Address.dart';
import 'package:review_app/Utils/Utils.dart';
import 'package:review_app/components/colorConstants.dart';

class AddBusiness extends StatefulWidget {
  @override
  _AddBusinessState createState() => _AddBusinessState();
}

class _AddBusinessState extends State<AddBusiness> {
  @override
  Address address;
  File _image;
  DateTime start_time ;//= DateTime.now();
  DateTime end_time ;
  var _formKey = new GlobalKey<FormState>();
  var _autoValidate = false;
  final businessController=Get.find<BusinessController>();
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Business", style: TextStyle(
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: businessController.nameTextEditingController,
                        style: TextStyle(color: color1,fontWeight: FontWeight.bold),
                        obscureText: false,
                        validator: (String value) =>
                        value.isEmpty ? "This field is Required" : null,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color1, width: 1.0)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color1, width: 1.0)
                          ),
                          labelText: "Name",
                          labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),

                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: businessController.phoneTextEditingController,
                        style: TextStyle(color: color1,fontWeight: FontWeight.bold),
                        obscureText: false,
                        validator: (String value) =>
                        value.isEmpty ? "This field is Required" : null,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color1, width: 1.0)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color1, width: 1.0)
                          ),
                          labelText: "Contact Number",
                          labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: businessController.addressTextEditingController,
                          style: TextStyle(color: color1,fontWeight: FontWeight.bold),
                          obscureText: false,maxLines: 2,
                          validator: (String value) =>
                          value.isEmpty ? "This field is Required" : null,
                          decoration: InputDecoration(
                            // suffixIcon: Icon(Icons.add_location,color: Colors.amberAccent,),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: color1, width: 1.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: color1, width: 1.0)
                            ),
                            labelText: 'Address',
                            labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),
                            //suffixIcon: Icon(Icons.email,color: Colors.amberAccent,size: 27,),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        trailing: InkWell(
                            onTap: () async{
                            //  address = await Navigator.push(context, MaterialPageRoute(builder: (context) => getPosition(),),);
                              // storeAddress.text = address.address;
                            },
                            child: Icon(Icons.add_location_alt,color: color3, size: 30,)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: businessController.emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: color1,fontWeight: FontWeight.bold),
                        obscureText: false,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color1, width: 1.0)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:color1, width: 1.0)
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: businessController.descriptionTextEditingController,
                        style: TextStyle(color: color1,fontWeight: FontWeight.bold),
                        obscureText: false,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color1, width: 1.0)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color1, width: 1.0)
                          ),
                          labelText: "Description",
                          labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          //color: Colors.white12,
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: color1, width: 2)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DateTimeField(
                            style: Theme.of(context).textTheme.body1,
                            //inputType: InputType.time,
                            //alwaysUse24HourFormat: true,
                            format: DateFormat("HH:mm:ss"),
                            onShowPicker: (context, currentValue) async {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                              );

                              return DateTimeField.convert(time);
                            },
                            decoration: InputDecoration(labelText: "Select start time",labelStyle: TextStyle(color: color1, fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                  borderSide: BorderSide(color: color1, width: 2.0)
                              ),),
                            onChanged: (value){
                              setState(() {businessController.openingTime.value=value;
                                this.start_time=value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          //color: Colors.white12,
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: color1, width: 2)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DateTimeField(
                            style: Theme.of(context).textTheme.body1,
                            // alwaysUse24HourFormat: true,
                            format: DateFormat("HH:mm:ss"),
                            onShowPicker: (context, currentValue) async {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                              );

                              return DateTimeField.convert(time);
                            },
                            decoration: InputDecoration(labelText: "Select end time",labelStyle: TextStyle(color:color1, fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                  borderSide: BorderSide(color:color1, width: 2.0)
                              ),),
                            onChanged: (value){
                              setState(() {
                                this.end_time=value;
                                businessController.closingTime.value=value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(16),
                      height: 100,
                      width: 80,
                      child: _image == null ? Text('No image selected.', style: TextStyle(color: color1, fontWeight: FontWeight.bold),) : Image.file(_image),
                    ),
                    MaterialButton(
                      color: color3,
                      onPressed: (){
                        Utils.getImage().then((image_file){
                          if(image_file!=null){
                            image_file.readAsBytes().then((image){
                              if(image!=null){
                                businessController.image.value=base64Encode(image);
                                setState(() {
                                  _image = image_file;
                                });
                              }
                            });
                          }else{

                          }
                        });
                      },
                      child: Text("Select Image",style: TextStyle(color: color1, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  businessController.addBusiness(context);
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
              SizedBox(height: 20,)
            ],
          ),
        ),
      )
    );
  }
}

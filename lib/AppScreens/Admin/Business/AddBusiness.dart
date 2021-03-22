import 'dart:convert';
import 'dart:io';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:review_app/AppScreens/Admin/LocationSetting/Location.dart';
import 'package:review_app/Controllers/AccountController.dart';
import 'package:review_app/Controllers/BusinessController.dart';
import 'package:review_app/Models/Address.dart';
import 'package:review_app/Models/BusinessViewModel.dart';
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
  DateTime start_time ;
  DateTime end_time ;
  var _formKey = new GlobalKey<FormState>();
  var _autoValidate = false;
  final accountController = Get.find<AccountController>();
  final businessController=Get.find<BusinessController>();
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Business",
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
                      child: Card(
                        elevation: 8,
                        color: color6,
                        child: Container(
                          child: TextFormField(
                            controller: businessController.nameTextEditingController,
                            style:  GoogleFonts.prompt(
                              textStyle: TextStyle(
                                  color: color1,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            obscureText: false,
                            validator: (String value) =>
                            value.isEmpty ? "This field is Required" : null,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color3, width: 1.0)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color6, width: 1.0)
                              ),
                              labelText: "Name",
                              labelStyle: GoogleFonts.prompt(
                                textStyle: TextStyle(
                                    color: color3,
                                    fontWeight: FontWeight.w500
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
                        elevation: 8,
                        color: color6,
                        child: Container(
                          child: TextFormField(
                            controller: businessController.phoneTextEditingController,
                            style:  GoogleFonts.prompt(
                              textStyle: TextStyle(
                                  color: color1,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            obscureText: false,
                            validator: (String value) =>
                            value.isEmpty ? "This field is Required" : null,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color3, width: 1.0)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color6, width: 1.0)
                              ),
                              labelText: "Contact Number",
                              labelStyle: GoogleFonts.prompt(
                                textStyle: TextStyle(
                                    color: color3,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
                      child: Card(
                        elevation: 8,
                        color: color6,
                        child: Container(
                          child: ListTile(
                            title: TextFormField(
                              controller: businessController.addressTextEditingController,
                              style:  GoogleFonts.prompt(
                                textStyle: TextStyle(
                                    color: color1,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              obscureText: false,maxLines: 2,
                              validator: (String value) =>
                              value.isEmpty ? "This field is Required" : null,
                              decoration: InputDecoration(
                                // suffixIcon: Icon(Icons.add_location,color: Colors.amberAccent,),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: color3, width: 1.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: color6, width: 1.0)
                                ),
                                labelText: 'Address',
                                labelStyle: GoogleFonts.prompt(
                                  textStyle: TextStyle(
                                      color: color3,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                //suffixIcon: Icon(Icons.email,color: Colors.amberAccent,size: 27,),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                            trailing: InkWell(
                                onTap: () async{
                                 address = await Navigator.push(context, MaterialPageRoute(builder: (context) => Location(),),);
                                  businessController.addressTextEditingController.text = address.address;
                                },
                                child: Icon(Icons.add_location_alt,color: color3, size: 30,)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 8,
                        color: color6,
                        child: Container(
                          child: TextFormField(
                            controller: businessController.emailTextEditingController,
                            keyboardType: TextInputType.emailAddress,
                            style:  GoogleFonts.prompt(
                              textStyle: TextStyle(
                                  color: color1,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color3, width: 1.0)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color:color6, width: 1.0)
                              ),
                              labelText: "Email",
                              labelStyle: GoogleFonts.prompt(
                                textStyle: TextStyle(
                                    color: color3,
                                    fontWeight: FontWeight.w500
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
                        elevation: 8,
                        color: color6,
                        child: Container(
                          child: TextFormField(
                            controller: businessController.descriptionTextEditingController,
                            style:  GoogleFonts.prompt(
                              textStyle: TextStyle(
                                  color: color1,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color3, width: 1.0)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color6, width: 1.0)
                              ),
                              labelText: "Description",
                              labelStyle: GoogleFonts.prompt(
                                textStyle: TextStyle(
                                    color: color3,
                                    fontWeight: FontWeight.w500
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
                        elevation: 8,
                        color: color6,
                        child: Container(
                          decoration: BoxDecoration(
                            //color: Colors.white12,
                            borderRadius: BorderRadius.circular(9),
                            //border: Border.all(color: color1, width: 2)
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
                              decoration: InputDecoration(labelText: "Select start time",
                                labelStyle: GoogleFonts.prompt(
                                textStyle: TextStyle(
                                    color: color3,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 8,
                        color: color6,
                        child: Container(
                          decoration: BoxDecoration(
                            //color: Colors.white12,
                            borderRadius: BorderRadius.circular(9),
                            //border: Border.all(color: color1, width: 2)
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
                              decoration: InputDecoration(labelText: "Select end time",
                                labelStyle: GoogleFonts.prompt(
                                  textStyle: TextStyle(
                                      color: color3,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
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
                      child: _image == null ? Text('No image selected.',
                        style: GoogleFonts.prompt(
                          textStyle: TextStyle(
                              color: color1,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ),
                        ),

                      ) : Image.file(_image),
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
                      child: Text("Select Image",
                        style: GoogleFonts.prompt(
                          textStyle: TextStyle(
                              color: color4,
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  accountController.RegisterUser(context,BusinessViewModel(
                    description: businessController.descriptionTextEditingController.text,
                    ownerId: "Acx",
                    isVisible: true,
                    businessTypeId: 1,
                    longitude: businessController.longitude.value,
                    latitude: businessController.latitude.value,
                    address: businessController.addressTextEditingController.text,
                    image: businessController.image.value,
                    name: businessController.nameTextEditingController.text,
                    closingTime: businessController.closingTime,
                    openingTime: businessController.openingTime,
                    phone: businessController.phoneTextEditingController.text,


                  ));

                },
                child: Center(
                  child: Card(
                    elevation: 8,
                    color: color3,
                    child: Container(
                      height: 55,
                      width: 220,
                      decoration: BoxDecoration(
                        //color: color3,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("SAVE",
                          style: GoogleFonts.prompt(
                            textStyle: TextStyle(
                                color: color4,
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
              SizedBox(height: 20,)
            ],
          ),
        ),
      )
    );
  }
}

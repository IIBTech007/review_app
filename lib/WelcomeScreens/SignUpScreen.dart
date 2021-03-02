import 'dart:ui';

import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //Address primaryAddress;
  TextEditingController firstname, lastname, email,password, address, postcode, cellno, country, city;

  @override
  void initState(){
    this.firstname=TextEditingController();
    this.lastname=TextEditingController();
    this.email=TextEditingController();
    this.password=TextEditingController();
    this.address=TextEditingController();
    this.postcode=TextEditingController();
    this.cellno=TextEditingController();
    this.country=TextEditingController();
    this.city=TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
            // image: DecorationImage(
            //   fit: BoxFit.cover,
            //   //colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.dstATop),
            //   image: AssetImage('assets/bb.jpg'),
            // )
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: new Container(
            //decoration: new BoxDecoration(color: Colors.black.withOpacity(0.3)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.teal,size:30),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(

                    width: MediaQuery.of(context).size.width * 0.7,
                    height:120,
                    //height: MediaQuery.of(context).size.height / 2.9,
                    child: Center(child: Image.asset(
                      "assets/caspian11.png",
                      fit: BoxFit.fill,
                    ),
                    ),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)) ,
                          color: Colors.white12,
                          border: Border.all(color: Colors.teal, width: 2)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text("Sign-Up",style: TextStyle(
                                color: Colors.teal,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            )),
                          ),
                          Center(
                            child: Text("Make your account",style: TextStyle(
                                color: Color(0xFF172a3a),
                                fontSize: 25
                            )),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: firstname,
                              style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),
                              obscureText: false,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                ),
                                labelText: "Name",
                                labelStyle: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                                //suffixIcon: FaIcon(FontAwesomeIcons.userTie, color: yellowColor, size: 30,),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: lastname,
                              style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),
                              obscureText: false,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                ),
                                labelText: "Last Name",
                                labelStyle: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                                //suffixIcon: FaIcon(FontAwesomeIcons.user, color: yellowColor, size: 30,),
                              ),
                              textInputAction: TextInputAction.next,

                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  TextFormField(
                              controller: email,
                              style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),
                              obscureText: false,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                              ),
                              textInputAction: TextInputAction.next,

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  TextFormField(
                              controller: password,
                              style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),
                              obscureText: false,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                              ),
                              textInputAction: TextInputAction.next,

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child:  ListTile(
                              title: TextFormField(
                                controller: address,
                                style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),
                                obscureText: false,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                  ),
                                  labelText:  "Address",
                                  labelStyle: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                                ),
                                textInputAction: TextInputAction.next,

                              ),
                              // trailing: InkWell(
                              //     onTap: () async{
                              //       primaryAddress = await Navigator.push(context, MaterialPageRoute(builder: (context) => getPosition(),),);
                              //       address.text = primaryAddress.address;
                              //     },
                              //     child: Icon(Icons.add_location,color: yellowColor,size: 35,)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  TextFormField(
                              controller: cellno,
                              style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),
                              obscureText: false,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal, width: 1.0)
                                ),
                                labelText: "Contact #",
                                labelStyle: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          InkWell(
                            // onTap: (){
                            //   if(firstname.text == null || firstname.text.isEmpty || lastname.text.isEmpty){
                            //     Utils.showError(context, "Name Required");
                            //   }else if(email.text == null || email.text.isEmpty){
                            //     Utils.showError(context, "Email Required");
                            //   }
                            //   else if(!Utils.validateEmail(email.text)){
                            //     Utils.showError(context, "Email Not Valid");
                            //   }
                            //   else if(password.text == null || password.text.isEmpty){
                            //     Utils.showError(context, "Password Required");
                            //   }else if(!Utils.validateStructure(password.text)) {
                            //     Utils.showError(context, "password contain 1 upper case 1 num and 1 special chracter");
                            //   }
                            //   else if(address.text == null || address.text.isEmpty){
                            //     Utils.showError(context, "Address Required");
                            //   }else if(cellno.text == null || cellno.text.isEmpty){
                            //     Utils.showError(context, "Cell Number Required");
                            //   }
                            //   else{
                            //     Utils.check_connectivity().then((value) {
                            //       if(value) {
                            //         networksOperation.signUp(
                            //             context,
                            //             firstname.text,
                            //             lastname.text,
                            //             email.text,
                            //             password.text,
                            //             address.text,
                            //             cellno.text).then((value) {
                            //           if (value) {
                            //             Utils.showSuccess(context, "Successfully Register");
                            //             Navigator.pop(context);
                            //           }
                            //         });
                            //       }else{
                            //         Utils.showError(context, "Network Error");
                            //       }
                            //     });
                            //
                            //   }
                            // },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)) ,
                                  color: Colors.teal,
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.08,

                                child: Center(
                                  child: Text("Sign-Up",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

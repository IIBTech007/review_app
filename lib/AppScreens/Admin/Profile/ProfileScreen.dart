import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review_app/components/colorConstants.dart';



class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
            Stack(
              children: [
                Container(
                  height: 310,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                  BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.arrow_back, color: color3,size:30),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(
                              width: 155.0,
                              height: 155.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color3
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 15,
                                    child: Container(
                                      width: 130.0,
                                      height: 130.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.amberAccent.shade100,

                                      ),
                                      child:  CircleAvatar(
                                        radius: 75,
                                        backgroundColor: color2,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage('assets/image.jpg'),
                                          //backgroundImage: NetworkImage(userDetail!=null?userDetail['image']:'http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg'),
                                          radius: 70,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8,),
                            Container(
                              width: 220,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                //color: color3,
                                // border: Border.all(
                                //   color: color3,
                                //   width: 2
                                // )
                              ),
                              child: Column(
                                children: [
                                  Text("Harry Potter",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: color3
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Text("as ",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: color3
                                        ),
                                      ),
                                      Text("Branch Admin",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: color4
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ),
                ),
                Positioned(
                  top: 260,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                      shape: CustomShapeBorder(),
                      color: color3
                    )
                    // BoxDecoration(
                    //     color: color3,
                    //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15))
                    // ),
                  ),
                ),
              ],
            ),
              RotationTransition(
                turns: new AlwaysStoppedAnimation(180 / 360),
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: ShapeDecoration(
                        shape: CustomShapeBorder(),
                        color: color3
                    )
                  // BoxDecoration(
                  //     color: color3,
                  //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15))
                  // ),
                ),
              ),
             // Text("PROFILE",
             // style: TextStyle(
             //   color: color1,
             //   fontWeight: FontWeight.bold,
             //   fontSize: 30
             // ),
             // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 22,
                        left: 50,
                        child: Text("Name: ",
                        style: TextStyle(
                          color: color4,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.7,
                            height: 70,
                            decoration: BoxDecoration(
                                color: color3,
                                borderRadius: BorderRadius.circular(40)
                            ),
                            child: Center(
                              child: Text("Harry Potter ",
                                style: TextStyle(
                                    color: color1,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                ),),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 22,
                          left: 50,
                          child: Text("Email: ",
                            style: TextStyle(
                                color: color4,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.7,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: color3,
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: Center(
                                child: Text("harrypotter7@gmail.com ",
                                  style: TextStyle(
                                      color: color1,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 22,
                          left: 50,
                          child: Text("Contact#: ",
                            style: TextStyle(
                                color: color4,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.7,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: color3,
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: Center(
                                child: Text("+1 123 456 7890",
                                  style: TextStyle(
                                      color: color1,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 22,
                          left: 50,
                          child: Text("City: ",
                            style: TextStyle(
                                color: color4,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.7,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: color3,
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: Center(
                                child: Text("London",
                                  style: TextStyle(
                                      color: color1,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 22,
                          left: 50,
                          child: Text("Country: ",
                            style: TextStyle(
                                color: color4,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.7,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: color3,
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: Center(
                                child: Text("England",
                                  style: TextStyle(
                                      color: color1,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
class CustomShapeBorder extends ShapeBorder {
  const CustomShapeBorder();

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => _getPath(rect);

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => _getPath(rect);

  _getPath(Rect rect) {
    final r = rect.height / 2;
    final radius = Radius.circular(r);
    final offset = Rect.fromCircle(center: Offset.zero, radius: r);
    return Path()
      ..moveTo(rect.topLeft.dx, rect.topLeft.dy)
      ..relativeArcToPoint(offset.bottomRight, clockwise: false, radius: radius)
      ..lineTo(rect.center.dx - r, rect.center.dy)
      ..relativeArcToPoint(offset.bottomRight, clockwise: true, radius: radius)
      ..relativeArcToPoint(offset.topRight, clockwise: true, radius: radius)
      ..lineTo(rect.centerRight.dx - r, rect.centerRight.dy)
      ..relativeArcToPoint(offset.topRight, clockwise: false, radius: radius)
      ..addRect(rect);
  }

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(0);
  }

  @override
  ShapeBorder scale(double t) {
    return CustomShapeBorder();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
  }
}
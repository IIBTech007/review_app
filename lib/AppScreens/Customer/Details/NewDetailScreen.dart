import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:review_app/components/colorConstants.dart';



class BusinessProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<BusinessProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: color4,
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration:
                    BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/business.jpg')
                      )
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
                                    icon: Icon(Icons.arrow_back, color: color3,size:45),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  Positioned(
                    top: 200,
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("BUSINESS NAME",
                    style: TextStyle(
                        color: color3,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                  ),
                ),
              ),

            Column(
              children: [
              Padding(
                padding: const EdgeInsets.only(right: 210,top: 3),
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 50,
                  decoration: BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.mobileAlt, color: color3, ),
                      SizedBox(width: 5,),
                      Text("Contact# ",
                      style: TextStyle(
                        color: color4,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130, top: 3),
                child: Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  height: 50,
                  decoration: BoxDecoration(
                      color: color3,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text("+1 123 456 7890 ",
                          style: TextStyle(
                              color: color4,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),
                    ),
                        ),
                      ),],
                  )
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(right: 210,top: 3),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 50,
                    decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.mapMarkedAlt, color: color3, ),
                        SizedBox(width: 5,),
                        Text("Address ",
                          style: TextStyle(
                              color: color4,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130, top: 3),
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 50,
                    decoration: BoxDecoration(
                        color: color3,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Container(
                                width: 220,
                                child: Text("Kashmir Plaza, Ramtalai Road, Gujrat, Pakistan",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: color4,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),],
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 210,top: 3),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 50,
                    decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.clock, color: color3, ),
                        SizedBox(width: 5,),
                        Text("Timings ",
                          style: TextStyle(
                              color: color4,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130, top: 3),
                  child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 50,
                      decoration: BoxDecoration(
                          color: color3,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Container(
                                width: 220,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Open: ",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: color1,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text("00:00",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: color4,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Close: ",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: color1,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text("00:00",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: color4,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ),
                            ),
                          ),],
                      )
                  ),
                ),
              ],
            ),
              SizedBox(height: 50,)
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
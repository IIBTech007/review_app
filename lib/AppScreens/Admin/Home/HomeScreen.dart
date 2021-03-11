import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:review_app/components/colorConstants.dart';
import 'package:slimy_card/slimy_card.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add, color: color3,size:25,),
        //     onPressed: (){
        //       //Navigator.push(context, MaterialPageRoute(builder: (context)=> AddAQuestion()));
        //     },
        //   ),
        // ],
        title: Text("Home", style: TextStyle(
            color: color4, fontSize: 22, fontWeight: FontWeight.bold
        ),
        ),
        iconTheme: IconThemeData(
            color: color3
        ),
        centerTitle: true,
        backgroundColor: color3,
      ),
      body: Container(
        color: color4,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Business Category",
                      style: TextStyle(
                          color: color1,
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("See All",
                      style: TextStyle(
                          color: color3,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                child: CarouselSlider.builder(
                  itemCount: 4,
                  options: CarouselOptions(
                    height: 600,
                    aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemBuilder: ((BuildContext context, int index){
                    return  Container(
                      child: SlimyCard(
                        // In topCardWidget below, imagePath changes according to the
                        // status of the SlimyCard(snapshot.data).
                        topCardWidget: topCardWidget2(),
                        bottomCardWidget: bottomCardWidget(),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget topCardWidget2(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            color: color4,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/business.jpg')),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                right:10,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  width: 60,
                  height: 30,

                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.solidStar,
                          color: Colors.amber,
                          size: 20,
                        ),
                        SizedBox(width: 2,),
                        Text("4.5",
                          style: TextStyle(
                              color: color4,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top:205,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.black45,
                  child: Text("YalaHabibi Dhaba",
                    style: TextStyle(
                        color: color4,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),

        SizedBox(height: 10),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget() {
    return Column(
      children: [
        Row(
          children: [
            Center(
              child: Text("Ramtalai Road, Gujrat, Pakistan",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: color4,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 5,),
      ],
    );
    //   Text(
    //   'It doesn\'t matter \nwhat your name is.',
    //   style: TextStyle(
    //     color: color3,
    //     fontSize: 12,
    //     fontWeight: FontWeight.w500,
    //   ),
    //   textAlign: TextAlign.center,
    // );
  }

}





class WaveClipperTwo extends CustomClipper<Path> {
  /// reverse the wave direction in vertical axis
  bool reverse;

  /// flip the wave direction horizontal axis
  bool flip;

  WaveClipperTwo({this.reverse = false, this.flip = false});

  @override
  Path getClip(Size size) {
    var path = Path();
    if (!reverse && !flip) {
      path.lineTo(0.0, size.height - 20);

      var firstControlPoint = Offset(size.width / 4, size.height);
      var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      var secondControlPoint =
      Offset(size.width - (size.width / 3.25), size.height - 65);
      var secondEndPoint = Offset(size.width, size.height - 40);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy);

      path.lineTo(size.width, size.height - 40);
      path.lineTo(size.width, 0.0);
      path.close();
    } else if (!reverse && flip) {
      path.lineTo(0.0, size.height - 40);
      var firstControlPoint = Offset(size.width / 3.25, size.height - 65);
      var firstEndPoint = Offset(size.width / 1.75, size.height - 20);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      var secondCP = Offset(size.width / 1.25, size.height);
      var secondEP = Offset(size.width, size.height - 30);
      path.quadraticBezierTo(
          secondCP.dx, secondCP.dy, secondEP.dx, secondEP.dy);

      path.lineTo(size.width, size.height - 20);
      path.lineTo(size.width, 0.0);
      path.close();
    } else if (reverse && flip) {
      path.lineTo(0.0, 20);
      var firstControlPoint = Offset(size.width / 3.25, 65);
      var firstEndPoint = Offset(size.width / 1.75, 40);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      var secondCP = Offset(size.width / 1.25, 0);
      var secondEP = Offset(size.width, 30);
      path.quadraticBezierTo(
          secondCP.dx, secondCP.dy, secondEP.dx, secondEP.dy);

      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
    } else {
      path.lineTo(0.0, 20);

      var firstControlPoint = Offset(size.width / 4, 0.0);
      var firstEndPoint = Offset(size.width / 2.25, 30.0);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      var secondControlPoint = Offset(size.width - (size.width / 3.25), 65);
      var secondEndPoint = Offset(size.width, 40);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy);

      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
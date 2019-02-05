import 'package:flutter/material.dart';
class ContainerWithCircle extends StatelessWidget {

  final double circleRadius = 150.0;
  final double circleBorderWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: circleRadius,
          height: circleRadius,
          decoration:
          ShapeDecoration(shape: CircleBorder(), color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(circleBorderWidth),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/Profilepic.jpg'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget BoxLogoGradient() {
  return Center(
    child: new Container(
        decoration: new BoxDecoration(
          color: Colors.purple,
          gradient: new LinearGradient(
            colors: [Colors.red, Colors.cyan],
          ),
        ),
        child: new FlutterLogo(
          size: 200.0,
        )),
  );
}

Widget CardWidget(String title) {
  return Container(
//    width: 70.0,
//    height: 95.0,
    child: Card(
      elevation: 0.3,
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 50.0,
            width: 50.0,
            color: Colors.white,
          ),
          // ContainerWithCircle(),
          SizedBox(
            height: 10.0,
          ),
          Center(child: Text(title)),
        ],
      ),
    ),
  );
}

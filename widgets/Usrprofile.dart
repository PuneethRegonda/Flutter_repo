import 'package:featurediscovery/widgets/userprf.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent.withBlue(10),
//          elevation: 0.0,
        ),
        body: StackBody(),
      ),
    ),
  );
}

class Listcards extends StatelessWidget {
  const Listcards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double WidthmediaQuery = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            width: WidthmediaQuery * 0.9,
            height: 250.0,
            child: Column(
//              scrollDirection: Axis.vertical,
              children: <Widget>[
                CardWidget('Internship'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CardWidget('courses'),
                ),
                CardWidget('title'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CardWidget('title'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StackBody extends StatelessWidget {
  const StackBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientaion = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 252.0,
              color: Colors.blue.withOpacity(0.94),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 170.0,
                    ),
                    Text(
                      'Puneeth',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27.0,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '+91 94410 95976',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              left: orientaion == Orientation.portrait
                  ? size.width * 0.32
                  : size.width * 0.40,
              child: ContainerWithCircle(),
            ),
          ],
        ),

        SizedBox(
          height: 20.0,
        ),

        new CustomeCard(
          size: size,
          title: 'Courses  ',
          count: 0,
          width: 220.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        new CustomeCard(
          size: size,
          title: 'Internships',
          count: 5,
          width: 200.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        new CustomeCard(
          size: size,
          title: 'Internships',
          count: 4,
          width: 200.0,
        ),

//        Listcards(),
      ],
    );
  }
}

class CustomeCard extends StatelessWidget {
  const CustomeCard({
    Key key,
    @required this.size,
    @required this.title,
    @required this.count,
    @required this.width,
  }) : super(key: key);

  final Size size;
  final double width;
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Card(
      child: Container(
        width: orientation == Orientation.portrait
            ? size.width * 0.95
            : size.width * 0.90,
        child: ListTile(
          title: Container(
            width: size.width * 0.95,
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Column(
//                   mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 2.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
//                           color: Colors.red,
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: orientation == Orientation.portrait
                                  ? width
                                  : size.width * 0.55,

                              ///here we use[width]
                            ),
                            Container(
//                           margin: EdgeInsets.only(top: 5.0),
                              child: Text(
                                count.toString(),
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black.withOpacity(0.2),
                          ),
                          height: 1.5,
                          width: size.width * 0.85,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              width: size.width * 0.65,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                'View All',
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

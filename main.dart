import 'package:featurediscovery/widgets/RatingBAR.dart';
import 'package:featurediscovery/gennericlayout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new AppHomePage(),
    );
  }
}

class AppHomePage extends StatefulWidget {
  @override
  AppHomePageState createState() {
    return new AppHomePageState();
  }
}

class AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('menu pressed');
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('search is pressed');
              }),
        ],
      ),
      body: Home(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            print('fab is Pressed');
          }),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 250.0,
              width: double.infinity,
              child: FittedBox(
                  fit: BoxFit.fill, child: Image.asset('assets/mountains.jpg')),
            ),
            Container(
              color: Colors.blue,
              height: 65.0,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Clave Mountains',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            SizedBox(
                              width: 13.0,
                            ),
                            RatingBar(
                              rating: 4,
                              starsize: 20.0,
                              starcolor: Colors.orange,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(
                                  color: Colors.white70,
                                  width: 0.6,
                                  style: BorderStyle.solid,
                                ),
                              ),

                             ),
                          ],
                        ),
                        Text(
                          '  US',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  width: 300.0,
                  height: 50.0,
                  color: Colors.grey.withOpacity(0.3),
                  child: Center(
                    child: Text(
                      'Start the feature discovery',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
                onTap: () {
                  print('pressed to start show');
                },
              ),
            ),
          ],
        ),
        Positioned(
            top: 200.0,
            right: 0.0,
            child: FractionalTranslation(
              translation: Offset(-0.3, 0.25),
              child: AnchorOverlayBuilder(
                showOverlay: false,
                overlayBuilder: (BuildContext context, Offset anchor) {
                  return CenterAbout(
                    position: anchor,
                    child: Material(
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
                child: FloatingActionButton(
//                mini: true,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  onPressed: () {
                    print('direction car is pressed ');
                  },
                  child: Icon(Icons.directions_car),
                ),
              ),
            )),
      ],
    );
  }
}

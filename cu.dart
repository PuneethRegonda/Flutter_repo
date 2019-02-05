import 'package:flutter/material.dart';

//import 'package:flutter/cupertino.dart';

void main(){
  runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
          ),
          body: MyApp(),
        )
      ));
}

BuildContext _dialogcontext;

class DialMe extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return DialMeState();
  }
}

class DialMeState extends State<DialMe>{


  @override
  Widget build(BuildContext context) {
    _dialogcontext = context;
    return Scaffold(
      body: RaisedButton(onPressed: (){
        Box(_dialogcontext);
        Future.delayed(Duration(seconds: 5)).whenComplete((){
          print('5 seconds done');
          _closeIt();
        });
      },child: Text('hei'),color: Colors.blue,),
    );
  }

  _closeIt(){
    Navigator.pop(context);
  }
}





class MyApp extends StatefulWidget {

  final String str='This is the Important Topic';


  @override
  MyAppState createState() {
    return new MyAppState();
  }
}


class MyAppState extends State<MyApp> {
  _closeIt(){
    Navigator.pop(context);
  }

  void _mainfun(BuildContext context){

    Box(context);
    Future.delayed(const Duration(seconds: 5)).whenComplete((){
      _closeIt();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
//        color: Colors.red,
        child: Center(
          child: RaisedButton(
              child: Text('Hi!!'),
              onPressed: (){
                print(context);
                _mainfun(context);
//               Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>AlertBox(widget.str)));
               }
          ),
        ),
    );
  }
}

//class AlertBox extends StatelessWidget {
//
//String _showString;
//
//
// AlertBox(this._showString);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.green,
//      ),
//      body: AlertDialog(
//        content: _Widget(),
//        actions: <Widget>[
//          FlatButton(onPressed: (){
//            print('show pressed ');
//
//            print(_showString);
//
//          },
//              child: Text('show',style: TextStyle(color: Colors.blue),)),
//          FlatButton(onPressed: (){
//            print('hide pressed');
//
//          },
//              child: Text('hide',style: TextStyle(color: Colors.red),)),
//        ],
//      ),
//    );
//  }
//}

Widget _Widget(){
  return Padding(
    padding: const EdgeInsets.only(top:10.0),
    child: Row(
      children: <Widget>[
        Container(
            width: 25.0,
            height: 25.0,
            child: CircularProgressIndicator(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0,),
          child: Text('Loading Please wait..'),
        ),
      ],
    ),
  );
}
//
// BOX(BuildContext context){
//  return  AlertDialog(
//    content: _Widget(),
//    actions: <Widget>[
//      FlatButton(onPressed: (){
//        print('show pressed ');
//
////        print(_showString);
//
//      },
//          child: Text('show',style: TextStyle(color: Colors.blue),)),
//      FlatButton(onPressed: (){
//        print('hide pressed');
//
//      },
//          child: Text('hide',style: TextStyle(color: Colors.red),)),
//    ],
//  );
//}

Future<Null> Box(BuildContext context){
  return showDialog(
    context: context,
  barrierDismissible: false,
    builder: (BuildContext context){
      return AlertDialog(
        content: _Widget(),
//        actions: <Widget>[
//          FlatButton(onPressed: (){
//            print('show pressed ');
//            Navigator.of(context).pop(true);
//          },
//              child: Text('show',style: TextStyle(color: Colors.blue),)),
//          FlatButton(onPressed: (){
//            print('hide pressed');
//            Navigator.of(context).pop(false);
//          },
//              child: Text('hide',style: TextStyle(color: Colors.red),)),
//        ],
      );
    }
  );
}
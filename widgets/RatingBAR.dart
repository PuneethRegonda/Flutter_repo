import 'package:flutter/material.dart';

void main(){

  runApp(
      MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
      ),
      body: Center(
        child:   RatingBar(
          rating: 5,
          starsize: 20.0,
          starcolor: Colors.orange,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
              color: Colors.white70,
              width: 0.5,
              style: BorderStyle.solid,
            ),
          ),
//          starcount: 4,
//          starsize:  20.0,
//          starcolor: Colors.orange,
        ),
      ),
    ),
  ));
}


class RatingBar extends StatefulWidget  {
  final int rating;
  final  double starsize;
  final  Color starcolor;
  final Decoration decoration ;

  RatingBar({
    @required
    this.rating,
    @required
    this.starsize,
    @required
    this.starcolor,
    @required
    this.decoration,
  }) : assert(rating == null || rating >= 0);

  @override
  RatingBarState createState() {
    return new RatingBarState();
  }
}

class RatingBarState extends State<RatingBar> {
  Widget _activestar() {
    return Icon(
      Icons.star,
      color: widget.starcolor==null?Colors.orange:widget.starcolor,
      size: widget.starsize==null?2:widget.starsize,
    );
  }

  List<Widget> _starBuilder() {
    List<Widget> star = [];
    star.add(
      SizedBox(
        width: 3.5,
      ),
    );
    for (int i = 0; i < widget.rating; ++i) {
      star.add(
        _activestar(),
      );
    }
    star.add(
      SizedBox(
        width: 3.5,
      ),
    );
    return star;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.decoration,
      child: Row(
        children: _starBuilder()==null?Container():_starBuilder(),
      ),
    );
  }
}

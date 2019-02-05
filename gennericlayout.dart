
import 'package:flutter/material.dart';

class CenterAbout extends StatelessWidget {
  final Offset position;
  final Widget child;

  const CenterAbout({
    Key key,
    this.position,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy,
      left: position.dx,
      child: FractionalTranslation(
        translation: const Offset(-0.5, -0.5),
        child: child,
      ),
    );
  }
}

///widgets
///
/// Rating

class AnchorOverlayBuilder extends StatelessWidget {

  final bool showOverlay;
  final Widget child;
  final Widget Function(BuildContext,Offset anchor) overlayBuilder;

  AnchorOverlayBuilder({
    this.child,
    this.showOverlay,
    this.overlayBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return OverlayBuilder(
      child: child,
      showoverlay: showOverlay,
      overlayBuilder: (BuildContext overlaycontext){
        RenderBox box =context.findRenderObject() as RenderBox;
        final center =box.size.center(box.localToGlobal(const Offset(0.0, 0.0)));
        return overlayBuilder(overlaycontext, center);
      } ,
    );
  }
}


class OverlayBuilder extends StatefulWidget {

  final bool showoverlay;
  final Function(BuildContext) overlayBuilder;
  final Widget child;

  OverlayBuilder({
    this.showoverlay=false,
    this.child,
    this.overlayBuilder,
  });

  @override
  _OverlayBuilderState createState() => _OverlayBuilderState();
}

class _OverlayBuilderState extends State<OverlayBuilder> {

  OverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();

    if(widget.showoverlay){
      showOverlay();
    }
  }

  @override
  void didUpdateWidget(OverlayBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    syncWidgetAndOverlay();
  }

  @override
  void reassemble() {
    super.reassemble();
    syncWidgetAndOverlay();

  }

  @override
  void dispose() {
    super.dispose();
    if(isShowingOverlay()){
      hideOverlay();
    }
    else{
      showOverlay();
    }

  }
  bool isShowingOverlay()=>overlayEntry!=null;

  void showOverlay(){
    overlayEntry = new OverlayEntry(
      builder: widget.overlayBuilder,
    );
    addToOverlay(overlayEntry);
  }

  void addToOverlay(OverlayEntry entry) async{
    Future.delayed(const Duration(milliseconds: 200)).whenComplete((){
      Overlay.of(context).insert(entry);

    });

  }

  void hideOverlay(){
    overlayEntry.remove();
    overlayEntry=null;
  }

  void  syncWidgetAndOverlay(){

    if(isShowingOverlay()&& !widget.showoverlay){
      hideOverlay();
    }
    else if(!isShowingOverlay() && widget.showoverlay){
      showOverlay();
    }
  }


  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
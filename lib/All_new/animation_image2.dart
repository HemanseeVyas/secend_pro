import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2/All_new/Animation_image1.dart';

class animation extends PageRoute
{
  Widget h2;
  animation(this.h2);

  @override
  // TODO: implement barrierColor
  Color? get barrierColor => Colors.purple.shade300;

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => "testing";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return FadeTransition(opacity: animation,child: h2,);
  }

  @override
  // TODO: implement maintainState
  bool get maintainState => true;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration(seconds: 5);

}
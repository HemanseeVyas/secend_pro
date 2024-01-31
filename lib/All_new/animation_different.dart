import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: ani(),));
}
class ani extends StatefulWidget {
  const ani({super.key});

  @override
  State<ani> createState() => _aniState();
}

class _aniState extends State<ani> {
  bool t=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation"),),
      body: Column(
        children: [
          Expanded(child: PageTransitionSwitcher(
            duration: Duration(seconds: 5),
            child: (t)?one():two(),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return SharedAxisTransition(
              child: child,
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.scaled);
          },)),
          ElevatedButton(onPressed: () {
            t=!t;
            setState(() {

            });
          }, child: Text("Click Here"))
        ],
      ),
    );
  }
}

class one extends StatefulWidget {
  const one({super.key});

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Animation"),),
      body: Container(
        height: 100,
        width: 100,
        child: Image.asset("myassets/mtchpic/aguacate.png"),
      ),
    );
  }
}


class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Animation"),),
      body: Container(
        height: 100,
        width: 100,
        child: Image.asset("myassets/mtchpic/ardilla.png"),
      ),
    );
  }
}

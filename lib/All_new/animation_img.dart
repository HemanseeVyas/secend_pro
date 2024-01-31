import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: anmtn(),));
}
class anmtn extends StatefulWidget {
  const anmtn({super.key});

  @override
  State<anmtn> createState() => _anmtnState();
}

class _anmtnState extends State<anmtn> {
  List imgs=["hamburguesa.png","campana.png","bombon.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ANIMATION"),),
      body: GridView.builder(itemCount: imgs.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ), itemBuilder: (context, index) {
      return OpenContainer(
        middleColor: Colors.pink.shade400,
        transitionDuration: Duration(seconds: 5),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) {
        return Container(
          height: 100,
          width: 100,
          child: Image.asset("myassets/mtchpic/${imgs[index]}"),
        );
      }, openBuilder: (context, action) {
        return an1(imgs[index]);
      },);
      },)
    );
  }
}


class an1 extends StatefulWidget {
  String imgs;
  an1(this.imgs);

  @override
  State<an1> createState() => _an1State();
}

class _an1State extends State<an1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ANIMATION"),),
      body: Container(
        height: 100,
        width: 100,
        child: Image.asset("myassets/mtchpic/${widget.imgs}"),
      ),
    );
  }
}

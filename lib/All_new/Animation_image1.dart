import 'package:flutter/material.dart';
import 'package:p2/All_new/animation_image2.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: h1(),));
}
class h1 extends StatefulWidget {
  const h1({super.key});

  @override
  State<h1> createState() => _h1State();
}

class _h1State extends State<h1> {
  //secend file animation_image2
  List images=["hamburguesa.png","caracol.png","bombon.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ANIMATION_IMAGE"),),
      body: GridView.builder(itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ), itemBuilder: (context, index) {
          return InkWell(onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //    return h2(images[index]);
            // },)); simple animation in show

            Navigator.push(context, animation(h2(images[index])));
          },
            child: Hero(tag: "${images[index]}",
              child: Container(
              height: 100,
                width: 100,
                child: Image.asset("myassets/mtchpic/${images[index]}"),
              ),
            ),
          );
      },),
    );
  }
}


class h2 extends StatefulWidget {
  String images;
  h2(this.images);

  @override
  State<h2> createState() => _h2State();
}

class _h2State extends State<h2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ANIMATION_IMAGES"),),
      body: Hero(tag: "${widget.images}",
        child: Container(
          height: 100,
          width: 100,
          child: Image.asset("myassets/mtchpic/${widget.images}"),
        ),
      ),
    );
  }
}

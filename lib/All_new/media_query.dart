import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
      runApp(MaterialApp(debugShowCheckedModeBanner: false,home: media(),));
}
class media extends StatefulWidget {
  const media({super.key});

  @override
  State<media> createState() => _mediaState();
}

class _mediaState extends State<media> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double status_bar=MediaQuery.of(context).padding.top;
    double app_bar=kToolbarHeight;

    double total=height-status_bar-app_bar;
    double font_size=total*0.05;

    return Scaffold(
      appBar: AppBar(title: Text("Media Query"),),
      body: Column(children: [
        Container(
          height: total/2,
          width: width,
          color: Colors.pink,
          child: Text("Hemu Prajapati",style: TextStyle(fontSize: font_size),),
        ),
        Container(
          height: total/2,
          width: width,
          color: Colors.red,
        ),
      ]),
    );
  }
}

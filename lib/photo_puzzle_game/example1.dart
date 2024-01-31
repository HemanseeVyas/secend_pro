import 'package:flutter/material.dart';

void main()
{
      runApp(MaterialApp(debugShowCheckedModeBanner: false,home: exa(),));
}
class exa extends StatefulWidget {
  const exa({super.key});

  @override
  State<exa> createState() => _exaState();
}

class _exaState extends State<exa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dragable"),),
      body: Column(children: [
        Draggable(data: "c",
          child: Container(
          height: 100,
          width: 100,
          color: Colors.pink,
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Text("A",style: TextStyle(color: Colors.white,fontSize: 20),),
        ), feedback: Container(
          height: 100,
          width: 100,
          color: Colors.pink,
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Text("A",style: TextStyle(color: Colors.white,fontSize: 20),),
        ),),
        SizedBox(height: 40,),
        Draggable(child: Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.all(20),
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text("B",style: TextStyle(color: Colors.white,fontSize: 20),),
        ), feedback: Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.all(20),
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text("B",style: TextStyle(color: Colors.white,fontSize: 20),),
        ),),
        SizedBox(height: 40,),
       DragTarget(onAccept: (data) {
         Text("A");
       },
         builder: (context, candidateData, rejectedData) {
         return Container(
           height: 100,
           width: 100,
           margin: EdgeInsets.all(20),
           color: Colors.teal,
           alignment: Alignment.center,
           child: Text("c",style: TextStyle(color: Colors.white,fontSize: 20),),
         );
       },)
      ]),
    );
  }
}

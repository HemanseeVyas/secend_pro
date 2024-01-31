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
  double h=100;
  double w=100;
  bool t=false;
  double op=0.8;
  Color c= Colors.indigo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Animation"),),
      body: Column(children: [
        AnimatedOpacity(opacity: op,
          duration: Duration(seconds: 1),
          child: AnimatedContainer(duration: Duration(seconds: 5),
          height: h,
            width: w,
            color: c,
          ),
        ),
        SizedBox(height: 40,),
        ElevatedButton(onPressed: () {
          if(t)
            {
              h=100;
              w=100;
              c=Colors.purple;
            }else
            {
              h=200;
              w=200;
              c=Colors.pink;
            }

          t=!t;
          setState(() {

          });
        }, child: Text("Submit"))
      ]),
    );
  }
}

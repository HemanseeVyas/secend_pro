import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: ori(),));
}
class ori extends StatefulWidget {
  const ori({super.key});

  @override
  State<ori> createState() => _oriState();
}

class _oriState extends State<ori> {
  bool t=false;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if(Orientation.portrait==orientation)
        {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
            t=true;
        }else
        {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
            SystemUiOverlay.bottom
          ]);  // to only hide the status bar
            t=false;
        }
      return Scaffold(
        appBar: (t)?AppBar():null,
        body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (t)?3:5,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ), itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 100,
                color: Colors.teal,
              );
        },),
      );
    },);
  }
}

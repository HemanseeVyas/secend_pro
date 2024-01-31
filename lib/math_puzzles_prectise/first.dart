import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: front(),));
}
class front extends StatefulWidget {
  const front({super.key});

  @override
  State<front> createState() => _frontState();
}

class _frontState extends State<front> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("myassets/mathapp/background.jpg"))),
          child: Column(children: [
            Expanded(child: Text("MATH PUZZLES"))
          ]),
        ),
      ),
    );
  }
}

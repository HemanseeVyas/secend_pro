import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: ist(),));
}
class ist extends StatefulWidget {
  const ist({super.key});

  @override
  State<ist> createState() => _istState();
}

class _istState extends State<ist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add DAta"),),
      body: Column(children: [
        TextField(

        ),
        TextField(
          
        )
      ]),
    );
  }
}

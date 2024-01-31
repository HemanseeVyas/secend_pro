import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: sld(),));
}
class sld extends StatefulWidget {
  const sld({super.key});

  @override
  State<sld> createState() => _sldState();
}

class _sldState extends State<sld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (context, index) {
        return Dismissible(key: UniqueKey(), child: Card(
          child: ListTile(
            title: Text("HELLO"),
          ),
        ));
      },),
    );
  }
}

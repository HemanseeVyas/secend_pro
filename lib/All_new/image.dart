import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p2/All_new/stop_watch.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: first(),));
}
class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  List pic=[];
  List pic1=[];
  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('myassets/mtchpic/'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() {
      pic = imagePaths;
      pic.shuffle();
      for(int i=0; i<6; i++)
      {
        pic1.add(pic[i]);
        pic1.add(pic[i]);
      }
      pic1.shuffle();
      print(pic);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initImages();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Time :"),),

      body: GridView.builder(itemCount: pic1.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ), itemBuilder: (context, index) {
        return
          // Visibility(child:
          Container(
            height: 100,
            width: 100,
            child: Image.asset("${pic1[index]}"),
          );
          // );
      },),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2/All_new/shreadplugin1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../match_picture/no_limit.dart';

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
  int a=0;
  SharedPreferences ? prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  async {
    prefs=await SharedPreferences.getInstance();
    a=prefs!.getInt("number") ?? 0;
    setState(() {

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo"),),

      body: Column(children: [
        Text("A:$a",style: TextStyle(fontSize: 30),),
        ElevatedButton(onPressed: () {
          a++;
          prefs!.setInt("number", a);
          setState(() {

          });
        }, child: Text("Submit")),
        InkWell(
          child: Row(children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context,  MaterialPageRoute(builder: (context) {
                return s();
              },));
            },child: Text("Next"))
          ],),
        )
      ]),
    );
  }
}

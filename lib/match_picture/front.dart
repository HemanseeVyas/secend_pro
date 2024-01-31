import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2/match_picture/hard.dart';
import 'package:p2/match_picture/no_limit.dart';
import 'package:p2/match_picture/normal.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: firsts(),));
}
class firsts extends StatefulWidget {
  static SharedPreferences ? prefs;

  const firsts({super.key});

  @override
  State<firsts> createState() => _firstsState();
}

class _firstsState extends State<firsts> {

  List im=["myassets/mtchpic/aguacate.png","myassets/mtchpic/ajo.png","myassets/mtchpic/ardilla.png",
    "myassets/mtchpic/bellota.png","myassets/mtchpic/bombon.png","myassets/mtchpic/caballo.png",
    "myassets/mtchpic/campana.png","myassets/mtchpic/aguacate.png","myassets/mtchpic/ajo.png",
    "myassets/mtchpic/ardilla.png",];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gets();
  }
  gets()
  async {
    firsts.prefs= await SharedPreferences.getInstance();
    int level_no = firsts.prefs!.getInt("sec") ?? 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select mode"),
      actions: [Icon(Icons.volume_up_sharp),
      Icon(Icons.more_vert)],),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.teal.shade50,
        child: Stack(children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 60, 20, 30),
            child: GridView.builder(itemCount: im.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
            ), itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage("${im[index]}"))),
              );
            },),
          ),
          Container(
            margin: EdgeInsets.only(top: 120),
            child:  Expanded(flex: 3,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(120, 0, 120, 240),
                  decoration: BoxDecoration(color: Colors.lightBlue.shade100,
                      borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade600,width: 5)),
                  child: Column(children: [
                    Expanded(child: InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return second();
                      },));
                    },
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.teal.shade600,
                        margin: EdgeInsets.fromLTRB(10,10,10,5),
                        child: Text("NO TIME LIMIT",style: TextStyle(fontSize: 20,color: Colors.white),),
                        alignment: Alignment.center,
                      ),
                    )),
                    Expanded(child: InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return normals();
                      },));
                    },
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.teal.shade600,
                        margin: EdgeInsets.fromLTRB(10,10,10,5),
                        child: Text("NORMAL",style: TextStyle(fontSize: 20,color: Colors.white),),
                        alignment: Alignment.center,
                      ),
                    )),
                    Expanded(child: InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return hards();
                      },));
                    },
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.teal.shade600,
                        margin: EdgeInsets.fromLTRB(10,10,10,10),
                        child: Text("HARD",style: TextStyle(fontSize: 20,color: Colors.white),),
                        alignment: Alignment.center,
                      ),
                    )),
                  ]),
                )),
          ),
          Container(
            child: Expanded(child: Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(160, 360, 160, 140),
              decoration: BoxDecoration(color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade600,width: 5)),
              child:  Expanded(child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.teal.shade600,
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: Text("REMOVE ADS",style: TextStyle(fontSize: 15,color: Colors.white),),
                alignment: Alignment.center,
              )),
            )),
          ),
          Container(
            child: Expanded(child: Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(80, 440, 80, 60),
              decoration: BoxDecoration(color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade600,width: 5)),
              child:
              // Expanded(
              //   child:
                Row(children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.teal.shade600,
                      margin: EdgeInsets.all(10),
                      child: Text("SHARE",style: TextStyle(fontSize: 15,color: Colors.white),),
                      alignment: Alignment.center,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.teal.shade600,
                      margin: EdgeInsets.all(10),
                      child: Text("MORE GAMES",style: TextStyle(fontSize: 15,color: Colors.white),),
                      alignment: Alignment.center,
                    ),
                  ),
                ]),
              // ),
            )),
          ),
          Expanded(child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.teal.shade600,
            margin: EdgeInsets.only(top: 510),
          )),
        ],)
      ),
    );
  }
}

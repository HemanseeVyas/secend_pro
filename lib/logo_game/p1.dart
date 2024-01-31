import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'p2.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: logos1(),));
}
class logos1 extends StatefulWidget {
  static SharedPreferences ? prefs;
  const logos1({super.key});

  @override
  State<logos1> createState() => _logos1State();
}

class _logos1State extends State<logos1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  async {
    logos1.prefs = await SharedPreferences.getInstance();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(children: [
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 20,top: 20),
                    child: Text("LOGO GAME",style: TextStyle(fontSize: 30),),
                    // decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                    //   image: AssetImage("myassets/img/main_background_top_logos.png"),
                    // )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    child: Text("Quiz your brands knowledge",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
              ]),
            ),
          ),
          Expanded(flex: 2,
            child: Stack(
                children: [
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return grid1();
                    },));
                  },
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text("PLAY",style: TextStyle(color: Colors.white,fontSize: 35),),
                      decoration: BoxDecoration(image: DecorationImage(
                        image: AssetImage("myassets/img/main_button_play.png"),
                      )),
                    ),
                  ),
                  // Container(
                  //   height: 100,
                  //   width: 100,
                  //   margin: EdgeInsets.only(left: 200),
                  //   alignment: Alignment.center,
                  //   child: Text("LOGOS\n0/2626",style: TextStyle(color: Colors.white),),
                  //   decoration: BoxDecoration(image: DecorationImage(
                  //     image: AssetImage("myassets/img/level_button_red_circle.png"),
                  //   )),
                  // )
                ]
            ),
          ),
          Expanded(flex: 2,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(children: [
                Container(
                  height: 800,
                  width: 80,
                  margin: EdgeInsets.only(left: 40),
                  decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage("myassets/img/main_button_ranking.png"),
                  )),
                ),
                Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage("myassets/img/main_button_stats.png"),
                  )),
                ),
                Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.only(right: 40,left: 20),
                  decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage("myassets/img/main_button_achievements.png"),
                  )),
                ),
              ]),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.fill,
                    image: AssetImage("myassets/img/main_background_bottom_logos.png"),
                  )),
            ),
          ),
        ]),
      ),
    ),);
  }
}

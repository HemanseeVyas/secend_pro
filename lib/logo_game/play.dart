import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2/logo_game/gridview.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: logos(),));
}
class logos extends StatefulWidget {
  const logos({super.key});

  @override
  State<logos> createState() => _logosState();
}

class _logosState extends State<logos> {
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
                    return grid();
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
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(left: 280),
                  alignment: Alignment.center,
                  child: Text("LOGOS\n0/2626",style: TextStyle(color: Colors.white),),
                  decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage("myassets/img/level_button_red_circle.png"),
                  )),
                )
              ]
            ),
          ),
          Expanded(flex: 2,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(left: 60),
                  decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage("myassets/img/main_button_ranking.png"),
                  )),
                ),
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(left: 40),
                  decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage("myassets/img/main_button_stats.png"),
                  )),
                ),
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(right: 60,left: 40),
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

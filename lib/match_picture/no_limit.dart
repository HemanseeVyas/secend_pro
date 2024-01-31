import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p2/match_picture/front.dart';
import 'package:timer_count_down/timer_count_down.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  List im = ["myassets/mtchpic/aguacate.png","myassets/mtchpic/ajo.png","myassets/mtchpic/ardilla.png",
    "myassets/mtchpic/bellota.png","myassets/mtchpic/bombon.png","myassets/mtchpic/caballo.png",
    "myassets/mtchpic/campana.png","myassets/mtchpic/aguacate.png","myassets/mtchpic/ajo.png",
    "myassets/mtchpic/ardilla.png",];

  // int index;
  List m = ["MATCH 2", "MATCH 3", "MATCH 4", "MATCH 5", "MATCH 6"];
  List<bool> temp = [];
  List col = [Colors.teal];
  int level_no=0;
  int level=0;
  int cur=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp = List.filled(12, false);
    get();
  }
  get()
  {
    // level_no = firsts.prefs!.getInt("sec") ?? 0;
     level = firsts.prefs!.getInt("level1") ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select mode"),
        actions: [Text("NO TIME LIMIT"), Icon(Icons.more_vert)],
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.teal.shade50,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 60, 20, 30),
                child: GridView.builder(
                  itemCount: im.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 40,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("${im[index]}"))),
                    );
                  },
                ),
              ),
              Container(
                height: double.infinity,
                // width: double.infinity,
                margin: EdgeInsets.fromLTRB(120, 100, 0, 120),
                child: ListView.builder(
                  itemCount: m.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, myindex) {
                    return Container(
                        margin: EdgeInsets.all(10),
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.teal.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.teal.shade600, width: 5)),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "${m[myindex]}",
                                style: TextStyle(
                                    color: Colors.teal.shade800,
                                    fontWeight: FontWeight.bold),
                              ),
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.teal,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return match();
                                    },
                                  ));
                                },
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      cur=(myindex * 10) + index + 1;
                                      // return Card(
                                      return Container(
                                        color: (cur<=level) ? Colors.teal : Colors.teal.shade100,
                                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Level ${cur} ${(cur<=level)?"-":""} ${(cur<=level)? firsts.prefs!.getInt("sec${index}") ?? "":""}${(cur<=level)?"s":""}",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        // if((temp[index]==true) ?  col[0] : col[1]);
                                      );
                                      // ListTile(title: Text("Level ${index+1}")),
                                      // );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              )
            ],
          )),
    );
  }
}

class match extends StatefulWidget {
  int ? l_no;
  match([this.l_no]);

  @override
  State<match> createState() => _matchState();
}

class _matchState extends State<match> {
  List pic = [];
  List pic1 = [];
  double a = 5;
  int x = 1;
  int pos1 = 0, pos2 = 0;
  List<bool> temp = [];
  List l = [];
  bool is_win = false;
  int index = 0;
  int a1 = 0;
  int j = 0;
  int level_no=0;
  int level=0;
  int cur=0;

  // how to get all images in flutter
  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('mtchpic/'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() {
      pic = imagePaths;
      pic.shuffle();
      for (int i = 0; i < 6; i++) {
        pic1.add(pic[i]);
        pic1.add(pic[i]);
      }
      pic1.shuffle();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.l_no== null)
      {
        level = firsts.prefs!.getInt("level1") ?? 0;
      }
    else
      {
        level=widget.l_no!;
      }
    new Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("you have a only 5 seconds...!"),
              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                  get();
                  setState(() {

                  });
                }, child: Text("OK"))
              ],
            );
          });
    });
    temp = List.filled(12, true);
    _initImages();
    // get();
  }

  get() async {
    level_no = firsts.prefs!.getInt("sec") ?? 0;
    level = firsts.prefs!.getInt("level1") ?? 0;
    for (int i = 5; i >= 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      a = i as double;

      if (i == 0) temp = List.filled(12, false);
      setState(() {});
    }
    int i = 1;
    while (true) {
      // a1 = j;
      // i++;
      if (temp[0] == true &&
          temp[1] == true &&
          temp[2] == true &&
          temp[3] == true &&
          temp[4] == true &&
          temp[5] == true &&
          temp[6] == true &&
          temp[7] == true &&
          temp[8] == true &&
          temp[9] == true &&
          temp[10] == true &&
          temp[11] == true) {
        j=i;
        break;
      }
      a1=j;
      j++;
      await Future.delayed(Duration(seconds: 1));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //timer count down gs
          title: (a != 0) ? Text("Time : $a") : Text("Time : $a1"),
        ),
        body:
            //hide slider in flutter
            Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: SliderTheme(
                  child: Slider(
                    value: a,
                    max: 5,
                    min: 0,
                    activeColor: Colors.teal,
                    inactiveColor: Colors.grey,
                    onChanged: (double value) {},
                  ),
                  data: SliderTheme.of(context).copyWith(
                      trackHeight: 5,
                      thumbColor: Colors.transparent,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 0.0)),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: pic1.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 2
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        if (!temp[index] && x == 1) {
                          temp[index] = true;
                          x = 3;
                          pos1 = index;
                          Future.delayed(Duration(milliseconds: 200)).then((value) {
                            x=2;
                            setState(() {
                            });
                          });
                        }
                        if (!temp[index] && x == 2) {
                          temp[index] = true;
                          // x = 1;
                          pos2 = index;
                          x=3;
                          // Future.delayed(Duration(seconds: 1));
                          // temp[index]=true;

                          if (pic1[pos1] == pic1[pos2]) {
                            x=1;
                            print("Image is match");
                          } else {
                            Future.delayed(Duration(seconds: 1)).then((value) {
                              x=1;
                              temp[pos1] = false;
                              temp[pos2] = false;
                              setState(() {});
                            });
                          }

                          if (temp[0] == true &&
                              temp[1] == true &&
                              temp[2] == true &&
                              temp[3] == true &&
                              temp[4] == true &&
                              temp[5] == true &&
                              temp[6] == true &&
                              temp[7] == true &&
                              temp[8] == true &&
                              temp[9] == true &&
                              temp[10] == true &&
                              temp[11] == true) {
                            // firsts.prefs!.setInt("sec$level", a1);
                            // level++;
                            // firsts.prefs!.setInt("level1",level);

                            // print("you are win...");
                            int temp_sec=firsts.prefs!.getInt("sec${level}") ?? 0;
                            print("temp_sec$temp_sec");
                            if(a1<temp_sec)
                              {
                                firsts.prefs!.setInt("sec${level}", a1);
                              }
                            if(widget.l_no==null)
                              {
                                level_no++;
                                firsts.prefs!.setInt("level1", level);
                                firsts.prefs!.setInt("sec${level}", a1);
                              }
                            showDialog(
                              barrierColor: Colors.transparent,
                              // barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Container(
                                    height: 40,
                                    width: 60,
                                    color: Colors.teal,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "New Record!",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                  content: Text("\t\t\t\t\t\t\t\t\t\t$a1 SECONDS\n\t\t\t\t\t\t\t\t\tNO TIME LIMIT\n\t\t\t\t\t\t\t\t\t\tLEVEL(Level ${cur})\n\t\t\t\t\t\t\t\t\t\tWELL DONE!"),
                                  actions: [
                                      TextButton(onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return second();
                                        },));
                                      }, child: Text("OK"))
                                  ],
                                );
                              },
                            );
                            setState(() {});
                          }
                        }
                        setState(() {});
                      },
                      child: Visibility(
                        visible: temp[index],
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image.asset("${pic1[index]}"),
                        ),
                        replacement: Container(
                          width: 100,
                          height: 100,
                          color: Colors.teal,
                        ),
                      ));
                },
              ),
            ),
          ],
        ));
  }
}

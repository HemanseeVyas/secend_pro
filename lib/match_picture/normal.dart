import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timer_count_down/timer_count_down.dart';

class normals extends StatefulWidget {
  const normals({super.key});

  @override
  State<normals> createState() => _normalsState();
}

class _normalsState extends State<normals> {
  List im = [
    "myassets/img/gato.png",
    "myassets/img/perro.png",
    "myassets/img/paloma.png",
    "myassets/img/cerezas.png",
    "myassets/img/platano.png",
    "myassets/img/cono.png",
    "myassets/img/hoja_otoño.png",
    "myassets/img/aguacate.png",
    "myassets/img/loro.png",
    "myassets/img/cerezas.png",
    "myassets/img/perro.png",
    "myassets/img/campana.png"
  ];
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select mode"),
        actions: [Text("NORMAL"), Icon(Icons.more_vert)],
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
                margin: EdgeInsets.fromLTRB(100, 100, 0, 80),
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(10),
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.teal.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.teal.shade600, width: 5)),
                        child: Column(children: [
                          Container(
                            child: Text("MATCH ${index+1}",style: TextStyle(color: Colors.teal.shade800,fontWeight: FontWeight.bold),),
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 10),
                          ),
                          Divider(thickness: 2,color: Colors.teal,),
                          Expanded(
                            child: InkWell(onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return match1();
                              },));
                            },
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                child: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
                                  // return Card(
                                  return Container(
                                    color: Colors.teal,
                                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    alignment: Alignment.center,
                                    child: Text("Level ${index+1}",style: TextStyle(
                                      fontSize: 20
                                    ),),
                                  );
                                  // ListTile(title: Text("Level ${index+1}")),
                                  // );
                                },),
                              ),
                            ),
                          ),
                        ],)
                    );
                  },
                ),
              )
            ],
          )),

    );
  }
}

class match1 extends StatefulWidget {
  const match1({super.key});

  @override
  State<match1> createState() => _match1State();
}

class _match1State extends State<match1> {
  List pic = [];
  List pic1 = [];
  List a=List.filled(12, true);
  List<bool>temp1=[];
  int j=0;
  String temp='';
  int a1=5;
  int a2=30;
  int x=1;
  int x2=5;
  int pos1=0,pos2=0;
  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('img/'))
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
    temp1=List.filled(12, true);
    _initImages();
    gets();
  }
  gets()
  async{
    for(int i=5; i>=0; i--)
    {
      await Future.delayed(Duration(seconds: 1));
      a1=i;

      if(i==0) temp1=List.filled(12, false);
      setState(() {

      });
    }
    int i=1;
    while(true)
    {
      a1=i;
      // i++;
      if(a1==a2)
      {
        print("alert dialogue box");
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Container(
              height: 40,
              width: 60,
              color: Colors.teal,
              alignment: Alignment.center,
              child: Text(
                "Time Over",
                style: TextStyle(
                    color: Colors.white, fontSize: 20),
              ),
            ),
            content: Text("Try Again ?"),
            actions: [
              Row(children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return normals();
                  },));
                },
                  child: Container(
                    height: 40,
                    width: 60,
                    color: Colors.teal,
                    alignment: Alignment.center,
                    child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 15)),
                  ),
                ),
                SizedBox(width: 10,),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return match1();
                  },));
                },
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.teal,
                    alignment: Alignment.center,
                    child: Text("ok",style: TextStyle(color: Colors.white,fontSize: 15)),
                  ),
                )
              ],)
            ],
          );
        },);
        // showDialog(context: context, builder: (context) {
        //  return AlertDialog(
        //    title:  Container(
        //      height: double.infinity,
        //      width: double.infinity,
        //      color: Colors.teal,
        //      alignment: Alignment.center,
        //      child: Text("TIME OUT",style: TextStyle(color: Colors.white,fontSize: 15),),
        //    ),
        //    content: Text("TRY AGAIN ?"),
        //    actions: [
        //      Row(children: [
        //        InkWell(onTap: () {
        //          Navigator.push(context, MaterialPageRoute(builder: (context) {
        //            return normals();
        //          },));
        //        },
        //          child: Container(
        //            height: 40,
        //            width: 40,
        //            color: Colors.teal,
        //            alignment: Alignment.center,
        //            child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 15),),
        //          ),
        //        ),
        //        SizedBox(width: 10,),
        //        InkWell(onTap: () {
        //          Navigator.push(context, MaterialPageRoute(builder: (context) {
        //            return match1();
        //          },));
        //        },
        //          child: Container(
        //            height: 40,
        //            width: 40,
        //            color: Colors.teal,
        //            alignment: Alignment.center,
        //            child: Text("ok",style: TextStyle(color: Colors.white,fontSize: 15),),
        //          ),
        //        ),
        //      ],)
        //    ],
        //  );
        // },);
        break;
      }
      if(temp1[0]==true && temp1[1]==true && temp1[2]==true
          && temp1[3]==true && temp1[4]==true && temp1[5]==true &&
          temp1[6]==true && temp1[7]==true  && temp1[8]==true  &&
          temp1[9]==true && temp1[10]==true && temp1[11]==true)
      {
        break;
      }
      else
      {
        i++;
      }
      await Future.delayed(Duration(seconds: 1));
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time : $a1 / $a2"),
      ),
      body: GridView.builder(
        itemCount: pic1.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          // childAspectRatio: 2
        ),
        itemBuilder: (context, index) {
          return InkWell(onTap: () {
            if(!temp1[index] && x==1)
            {
              temp1[index]=true;
              x=2;
              pos1=index;
            }
            if(!temp1[index] && x==2)
            {
              temp1[index]=true;
              x=1;
              pos2=index;
              // Future.delayed(Duration(seconds: 1));
              // temp[index]=true;
              if(pic1[pos1]==pic1[pos2])
              {
                a2=a2+5;
                print("Image is match");
              }else
              {
                Future.delayed(Duration(seconds: 1)).then((value) {

                  temp1[pos1]=false;
                  temp1[pos2]=false;
                  setState(() {

                  });
                });
              }

              if(temp1[0]==true && temp1[1]==true && temp1[2]==true
                  && temp1[3]==true && temp1[4]==true && temp1[5]==true &&
                  temp1[6]==true && temp1[7]==true  && temp1[8]==true  &&
                  temp1[9]==true && temp1[10]==true && temp1[11]==true)
              {
                print("you are win...");

                showDialog(
                  barrierColor: Colors.transparent,
                  // barrierDismissible: false,
                  context: context, builder: (context) {
                  return AlertDialog(
                    title: Container(
                      height: 40,
                      width: 60,
                      color: Colors.teal,
                      alignment: Alignment.center,
                      child: Text("New Record",style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),
                    alignment: Alignment.center,
                    content: Text("Congratulations"),
                    actions: [
                      InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return normals();
                        },));
                      },
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(right: 120),
                          color: Colors.teal,
                          alignment: Alignment.center,
                          child: Text("OK",style: TextStyle(color: Colors.white),),
                        ),
                      )
                    ],

                  );
                },);
                setState(() {

                });
              }
              // if(pic1[pos1]!=pic1[pos2])
              //   {
              //     print("image is not match");
              //     temp[index]=false;
              //     temp[pos1]=false;
              //     temp[pos2]=false;
              //     // pos1=0;
              //     // pos2=0;
              //     Future.delayed(Duration(seconds: 1)).then((value) {
              //       temp[index]=true;
              //       pos1=index;
              //       pos2=index;
              //       x=1;
              //       x=2;
              //       setState(() {
              //
              //       });
              //     });
              //   }
            }
            setState(() {});

          },
              child: Visibility(
                visible: temp1[index],
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.asset("${pic1[index]}"),
                ),replacement:
              Container(
                width: 100,
                height: 100,
                color: Colors.teal,
              ),
              )
          );
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timer_count_down/timer_count_down.dart';

class hards extends StatefulWidget {
  const hards({super.key});

  @override
  State<hards> createState() => _hardsState();
}

class _hardsState extends State<hards> {
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
                                return match2();
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
                                    child: Text("Level ${index+1}"),
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

class match2 extends StatefulWidget {
  const match2({super.key});

  @override
  State<match2> createState() => _match2State();
}

class _match2State extends State<match2> {
  List pic = [];
  List pic1 = [];
  List a=List.filled(12, true);
  int j=0;
  String temp='';
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
    _initImages();
  }
  // Stream get()
  // async* {
  //   for(int i=1; i<=5; i++)
  //    {
  //      a=i;
  //      await Future.delayed(Duration(seconds: 1));
  //      yield a;
  //    //  return ni jgyaye yield no use thy because return
  //    //  lakhvathi 1 j var run thy ne bar nikli jase ex.a=1
  //    }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //timer count down gs
        title: Countdown(seconds: 5, build: (BuildContext context, double time)=>Text(time.toString()),
          interval: Duration(seconds: 1),
          onFinished: (){
            for(int i=0; i<a.length;i++)
            {
              a[i]=false;
            }
            setState(() {

            });
          },
        ),
        backgroundColor: Colors.teal,
        // StreamBuilder(
        //   stream: get(),
        //   builder: (context, snapshot) {
        //     // print(snapshot.connectionState);
        //     // print(snapshot.data);
        //     if((snapshot.connectionState==ConnectionState.active)||(snapshot.connectionState==ConnectionState.done))
        //     {
        //       int x=snapshot.data;
        //       return Container(
        //         child: Text("Tme : $x",style: TextStyle(fontSize: 30),),
        //       );
        //     }
        //     else
        //     {
        //       return Container(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },),
        // Text("Time :$a"),
      ),
      body: GridView.builder(
        itemCount: pic1.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return Visibility(
            // visible: false,
              visible: a[index],
              child: Container(
                height: 100,
                width: 100,
                child: Image.asset("${pic1[index]}"),
              ),replacement: InkWell(onTap: () {
            a[index]=true;
            setState(() {

            });
          },
            child: Container(
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

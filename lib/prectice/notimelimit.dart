// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:p2/prectice/uipage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'level.dart';
//
// class timelimit extends StatefulWidget {
//   int ? l_no=0;
//   timelimit([this.l_no]);
//
//   @override
//   State<timelimit> createState() => _timelimitState();
// }
//
// class _timelimitState extends State<timelimit> {
//   List im=["myassets/img/aguacate.png","myassets/img/ajo.png","myassets/img/ardilla.png",
//     "myassets/img/barco.png","myassets/img/bellota.png","myassets/img/caballo.png","myassets/img/calabaza.png",
//     "myassets/img/campana.png","myassets/img/caracol.png","myassets/img/cerezas.png","myassets/img/ciruela.png","myassets/img/coche.png",
//     "myassets/img/coco.png","myassets/img/cono.png","myassets/img/copa.png","myassets/img/cubo.png","myassets/img/delfin.png",
//   ];
//   double a=5;
//   List pic=[];
//   List pic1=[];
//   List<bool>temp=[];
//   int a1=0;
//   int j=0;
//   int x=1;
//   int pos1=0;
//   int pos2=0;
//   int level_no=0;
//   int level=0;
//
//   Future _initImages() async {
//     // >> To get paths you need these 2 lines
//     final manifestContent = await rootBundle.loadString('AssetManifest.json');
//
//     final Map<String, dynamic> manifestMap = json.decode(manifestContent);
//     // >> To get paths you need these 2 lines
//
//     final imagePaths = manifestMap.keys
//         .where((String key) => key.contains('img/'))
//         .where((String key) => key.contains('.png'))
//         .toList();
//
//     setState(() {
//       pic = imagePaths;
//       pic.shuffle();
//       for(int i=0; i<6; i++)
//       {
//         pic1.add(pic[i]);
//         pic1.add(pic[i]);
//       }
//       pic1.shuffle();
//     });
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // if(widget.l_no==null)
//     //   {
//     //     level=game.prefs!.getInt("level1$level") ?? 0;
//     //   }else
//     //     {
//     //       widget.l_no!=null;
//     //     }
//     new Future.delayed(Duration.zero, () {
//       showDialog(context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Column(children: [
//                 Text("you have a only 5 secfonds"),
//                 InkWell(onTap: () {
//                   Navigator.pop(context);
//                   get();
//                   setState(() {
//
//                   });
//                 },
//                   child: Container(
//                     height: 40,
//                     width: 40,
//                     color: Colors.teal,
//                     alignment: Alignment.center,
//                     child: Text("GO",style: TextStyle(fontSize: 15,color: Colors.white),),
//                   ),
//                 ),
//               ]),
//             );
//           });
//     });
//     _initImages();
//     temp=List.filled(12, true);
//     get2();
//     // get();
//   }
//   get2()
//   async {
//     level_no=game.prefs!.getInt("sec$level") ?? 0;
//     level=game.prefs!.getInt("level1") ?? 0;
//
//   }
//   get()
//   async {
//     for(int i=5; i>=0; i--)
//     {
//       await Future.delayed(Duration(seconds: 1));
//       a=i as double;
//
//       if(i==0) temp=List.filled(12, false);
//       setState(() {
//
//       });
//     }
//
//     while(true)
//     {
//       if(temp[0]==true && temp[1]==true && temp[2]==true && temp[3]==true &&
//           temp[4]==true && temp[5]==true &&temp[6]==true && temp[7]==true &&
//           temp[8]==true && temp[9]==true &&temp[10]==true && temp[11]==true)
//       {
//         break;
//       }
//       a1=j;
//       j++;
//       await Future.delayed(Duration(seconds: 1));
//       setState(() {
//
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: (a!=0) ? Text("TIME : $a / 0"):Text("TIME : $a1 / 0"),),
//       body: Column(children: [
//         Expanded(
//           child: Container(
//               height: double.infinity,
//               width: double.infinity,
//               child:SliderTheme(
//                 child:  Slider(
//                   value: a,
//                   min: 0,
//                   max: 5,
//                   activeColor: Colors.teal,
//                   inactiveColor: Colors.grey,
//                   onChanged: (value) {},
//                 ),
//                 data: SliderTheme.of(context).copyWith(
//                   thumbColor: Colors.transparent,
//                   trackHeight: 5,
//                   thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
//                   // disabledActiveTrackColor: Colors.red[700],
//                   // disabledInactiveTrackColor: Colors.red[100],
//                   // disabledThumbColor: Colors.redAccent,
//                 ),
//               )
//           ),
//         ),
//         Expanded(flex: 4,
//           child: Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: GridView.builder(itemCount: pic1.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//                 crossAxisSpacing: 5,
//                 mainAxisSpacing: 5,
//                 childAspectRatio: 2,
//               ), itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () async {
//
//                     if(!temp[index] && x==1)
//                     {
//                       temp[index]=true;
//                       x=3;
//                       pos1=index;
//                        Future.delayed(Duration(milliseconds: 200)).then((value) {
//                         x=2;
//                         setState(() {
//
//                         });
//                       });
//                     }
//                     if(!temp[index] && x==2)
//                     {
//                       temp[index]=true;
//                       pos2=index;
//                       x=3;
//
//                       if(pic1[pos1]==pic1[pos2])
//                       {
//                         x=1;
//                         print("image is match");
//                       }
//                       else
//                       {
//                         Future.delayed(Duration(milliseconds: 1)).then((value) {
//                           x=1;
//                           temp[pos1]=false;
//                           temp[pos2]=false;
//                           setState(() {
//
//                           });
//                         });
//                       }
//                       if(temp[0]==true && temp[1]==true && temp[2]==true && temp[3]==true &&
//                           temp[4]==true && temp[5]==true &&temp[6]==true && temp[7]==true &&
//                           temp[8]==true && temp[9]==true &&temp[10]==true && temp[11]==true)
//                       {
//
//                         showDialog(context: context, builder: (context) {
//                           return AlertDialog(
//                               title: Column(children: [
//                                 Container(
//                                   height: 20,
//                                   width: 160,
//                                   color: Colors.teal,
//                                   alignment: Alignment.center,
//                                   child: Text("NEW RECORDS!",style: TextStyle(fontSize: 15,color: Colors.white),),
//                                 ),
//                                 Text("NO TIME LIMIT"),
//                                 Text("SECONDS $a1"),
//                                 Text("WELL DONE"),
//                                 InkWell(onTap: () {
//                                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                                     return notime();
//                                   },));
//                                   setState(() {});
//                                 },
//                                   child: Container(
//                                     height: 40,
//                                     width: 40,
//                                     alignment: Alignment.center,
//                                     child: Text("OK",style: TextStyle(fontSize: 15,color: Colors.white),),
//                                     color: Colors.teal,
//                                   ),
//                                 )
//                               ],)
//                           );
//                         },);
//                         setState(() {
//
//                         });
//
//                         game.prefs!.setInt("sec$level", a1);
//                         level++;
//                         game.prefs!.setInt("level1", level);
//                         // int temp_sec=game.prefs!.getInt("sec$level") ?? 0;
//                         // if(a1<temp_sec)
//                         //   {
//                         //     game.prefs!.setInt("sec$level",a1);
//                         //   }
//                         // if(widget.l_no==null)
//                         //   {
//                         //     level_no++;
//                         //     game.prefs!.setInt("level1", level);
//                         //     game.prefs!.setInt("sec$level", a1);
//                         //   }
//                         // setState(() {
//                         //
//                         // });
//                       }
//                       setState(() {
//
//                       });
//                     }
//                   },
//                   child: Visibility(visible: temp[index],
//                     child: Container(
//                       height: 200,
//                       width: 200,
//                       child: Image.asset("${pic1[index]}"),
//                     ),replacement: Container(
//                       height: 200,
//                       width: 200,
//                       color: Colors.teal,
//                     ),
//                   ),
//                 );
//               },),
//           ),
//         )
//       ]),
//     );
//   }
// }

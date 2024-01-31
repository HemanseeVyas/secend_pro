// import 'package:flutter/material.dart';
// import 'package:p2/prectice/uipage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'notimelimit.dart';
//
// class notime extends StatefulWidget {
//   const notime({Key? key}) : super(key: key);
//
//   @override
//   State<notime> createState() => _notimeState();
// }
//
// class _notimeState extends State<notime> {
//   int level=0;
//   int cur=0;
//   int level_no=0;
//   List m=["MATCH 2","MATCH 3","MORROR","MTACH 4","MIRROR 4"];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     get1();
//   }
//   get1()
//   async {
//     level_no=game.prefs!.getInt("sec$level") ?? 0;
//     level=game.prefs!.getInt("level1$level") ?? 0;
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("SELECT LEVEL"),),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: Colors.teal.shade100,
//         child: ListView.builder(scrollDirection: Axis.horizontal,
//           itemCount: m.length,
//           itemBuilder: (context, myindex) {
//             return Container(
//               margin: EdgeInsets.only(left: 20,right: 20,top: 60,bottom: 60),
//               height: 500,
//               width: 300,
//               decoration: BoxDecoration(color: Colors.teal.shade100,border: Border.all(width: 5,color: Colors.teal),
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(children: [
//                 Container(
//                   // height: 100,
//                   // width: 200,
//                   margin: EdgeInsets.all(30),
//                   child: Text("${m[myindex]}"),
//                 ),
//                 SizedBox(height: 20,),
//                 Divider(height: 2,color: Colors.teal,thickness: 3,),
//                 SizedBox(height: 20,),
//                 Expanded(child: Container(
//                   height: 100,
//                   width: 260,
//                   child: ListView.builder(
//                     itemCount: 10,
//                     scrollDirection: Axis.vertical,
//                     itemBuilder: (context, index) {
//                       cur=(myindex*10)+index+1;
//                       return InkWell(onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) {
//                           return timelimit();
//                         },));
//                       },
//                         child: Container(
//                           // height: 60,
//                           // width: 400,
//                           margin: EdgeInsets.only(top: 10,bottom: 10),
//                           color: Colors.teal,
//                           // color: (cur<=level)?  Colors.teal: Colors.teal.shade100,
//                           alignment: Alignment.center,
//                           child: Text("Level ${cur} "
//                               "${(cur<=level)?"-":""} ${(cur<=level)?game.prefs!.getInt("sec$index"):""} ${(cur<=level) ? "s":""}"
//                             ,style: TextStyle(color: Colors.white,fontSize: 25),),
//                         ),
//                       );
//                     },),
//                 ),
//                 )
//               ]),
//             );
//           },),
//       ),
//     );
//   }
// }

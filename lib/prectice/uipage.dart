// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'level.dart';
//
// void main()
// {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false,home: game1(),));
// }
// class game1 extends StatefulWidget {
//   static SharedPreferences ?prefs;
//   const game1(int l_no1,  {Key? key}) : super(key: key);
//
//   @override
//   State<game1> createState() => _game1State();
// }
//
// class _game1State extends State<game1> {
//   int level_no=0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     get();
//   }
//   get()
//   async {
//     game1.prefs = await SharedPreferences.getInstance();
//     level_no=game1.prefs!.getInt("level1") ?? 0;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("SELECT MODE"),),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: Colors.teal.shade100,
//         child: Column(children: [
//           Expanded(
//             child: Container(
//               height: double.infinity,
//               width: double.infinity,
//             ),
//           ),
//           Expanded(flex: 2,
//             child: Container(
//               height: double.infinity,
//               width: double.infinity,
//               margin: EdgeInsets.only(left: 100,right: 100),
//               decoration: BoxDecoration(color: Colors.teal.shade100,border: Border.all(width: 5,color: Colors.teal),
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) {
//                         return notime();
//                       },));
//                     },
//                     child: Container(
//                       height: 40,
//                       width: 260,
//                       color: Colors.teal.shade700,
//                       margin: EdgeInsets.only(top: 10,bottom: 5),
//                       alignment: Alignment.center,
//                       child: Text("NO TIME LIMIT",style: TextStyle(fontSize: 15,color: Colors.white),),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     height: 40,
//                     width: 260,
//                     color: Colors.teal.shade700,
//                     margin: EdgeInsets.only(top: 5,bottom: 5),
//                     alignment: Alignment.center,
//                     child: Text("NORMAL",style: TextStyle(fontSize: 15,color: Colors.white),),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     height: 40,
//                     width: 260,
//                     color: Colors.teal.shade700,
//                     margin: EdgeInsets.only(top: 5,bottom: 10),
//                     alignment: Alignment.center,
//                     child: Text("HARD",style: TextStyle(fontSize: 15,color: Colors.white),),
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//           Expanded(
//             child: Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 margin: EdgeInsets.only(left: 120,right: 120,top: 20,bottom: 20),
//                 decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.teal),
//                     borderRadius: BorderRadius.circular(10)),
//                 alignment: Alignment.center,
//                 child: Container(
//                   height: 100,
//                   width: 200,
//                   color: Colors.teal.shade700,
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.all(10),
//                   child: Text("REMOVE ADDS",style: TextStyle(fontSize: 15,color: Colors.white),),
//                 )
//             ),
//           ),
//           Expanded(
//             child: Container(
//               height: double.infinity,
//               width: double.infinity,
//             ),
//           ),
//           Expanded(
//             child: Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 color: Colors.teal.shade700
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

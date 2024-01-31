import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main()
{
  runApp(
      MaterialApp(
        // them - appbar ma alg alg page ma bdha ma color ne property bdha page ma use krvi pde
        // so theme property one time use in runapp
        theme: ThemeData(
            appBarTheme:AppBarTheme(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.black,
              iconTheme: IconThemeData(
                color: Colors.black,
              )
            )
        ),
        debugShowCheckedModeBanner: false,home: sldbl(),));
}
class sldbl extends StatefulWidget {
  const sldbl({super.key});

  @override
  State<sldbl> createState() => _sldblState();
}

class _sldblState extends State<sldbl> {
  bool temp=false;
  String str="";
  List l=[1,2,3,4,5,6,7,8,9,10];
  int a=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slidable"),
        centerTitle: true,),

      //slidableAutocloseBehavior  -- 2 open thy to 1 close work

      body: SlidableAutoCloseBehavior(child: ListView.builder(itemCount: l.length,
        itemBuilder: (context, index) {
          return Slidable(
            startActionPane: ActionPane(motion: ScrollMotion(), children:[
              SlidableAction(
                label: "Update",
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                onPressed: (context) {

                },),
              SlidableAction(
                label: "Delete",
                backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
                onPressed: (context) {
                    l.removeRange(0,index);
                  // if(temp==true)
                  //   {
                  //         print("hello");
                  //   }
                },)
              // InkWell(onTap: () {
              //   // str=str.substring(0,str.length-1);
              //   // temp=true;
              //   // temp==a;
              //   // a--;
              // },
              // )
            ]),
            endActionPane: ActionPane(motion: ScrollMotion(), children: [
              SlidableAction(
                label: "Update",
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                onPressed: (context) {
                },)
            ]),
            child:ListTile(
              title:
              Text("${l[index]}"),
            ),
          );
        },),)


      //messages removed
      // body: ListView.builder(itemCount: l.length,
      //   itemBuilder: (context, index) {
      //   return Dismissible(key: UniqueKey(), child: Card(
      //     child: ListTile(title: Text("${index+1}")),
      //   )
      //   );
      // },),
    );
  }
}

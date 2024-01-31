import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: ex(),));
}
class ex extends StatefulWidget {
  const ex({super.key});

  @override
  State<ex> createState() => _exState();
}

class _exState extends State<ex> {
  List list=["A","B","C","D","E","F","G","H","I"];
  List list1=[];
  List temp=List.filled(9, true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list1.addAll(list);
    list.shuffle();
  }
  @override
  Widget build(BuildContext context) {
    //container jetli size lvva mte (drag time a)
    double tot_width=MediaQuery.of(context).size.width;
    double con_width=(tot_width-20)/3;

    return Scaffold(
      appBar: AppBar(title: Text("Photo Game"),),
      body: GridView.builder(itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ), itemBuilder: (context, index) {
          return (temp[index]) ? Draggable(onDraggableCanceled: (velocity, offset) {
            temp=List.filled(9, true);
            setState(() {
            });
          },data: index,
            onDragStarted: () {
              temp=List.filled(9, false);
              setState(() {
              });
            },
            child: Container(
              height: con_width,
              width: con_width,
              color: Colors.teal,
              alignment: Alignment.center,
              child: Text("${list[index]}",style: TextStyle(fontSize: 20,color: Colors.white),),
            ),feedback: Container(
            height: con_width,
            width: con_width,
            color: Colors.pink,
            alignment: Alignment.center,
            child: Text("${list[index]}",style: TextStyle(fontSize: 20,color: Colors.white),),
          ),
          ):DragTarget(onAccept: (data) {
            temp=List.filled(9, true);
            var c=list[data as int];  // as like c=a
            list[data as int]=list[index];  //a=b
            list[index]=c;  // b=c

            //win
            if(listEquals(list,list1))
              {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(title: Text("you are win....!"),
                    actions: [
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ex();
                        },));
                      }, child: Text("OK"))
                    ],
                  );
                },);
                print("you are win....!");
              }
            setState(() {
            });
          },
            builder: (context, candidateData, rejectedData) {
            return Container(
              // height: con_width,
              // width: con_width,
              color: Colors.pink,
              alignment: Alignment.center,
              child: Text("${list[index]}",style: TextStyle(fontSize: 20,color: Colors.white),),
            );
          },);
      },),
    );
  }
}

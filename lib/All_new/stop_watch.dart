import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: stop_watch(),
  ));
}

class stop_watch extends StatefulWidget {
  const stop_watch({super.key});

  @override
  State<stop_watch> createState() => _stop_watchState();
}

class _stop_watchState extends State<stop_watch> {
  int i=0;
  int a = 0;
  int b = 0;
  int mini = 0;
  int hours = 0;
  double x = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  int j=0;

  Stream get() async* {

    while(true)
    {
      if(j>=10)j=0;
      int p=j;
      await Future.delayed(Duration(seconds: start?1:p++));
      if(start)j++;
      yield j;

    }

  }
  int t=0;
  List l = ["Start",""];
  bool start = false;

  // Stopwatch stopwatch = new Stopwatch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stop Watch")),
      body: Column(children: [
        StreamBuilder(
          initialData: 0,
          stream: get(),
          builder: (context, snapshot) {
            if (start == true ||snapshot.connectionState==ConnectionState.done ||snapshot.connectionState==ConnectionState.active) {
              int x = snapshot.data;
              if(snapshot.data>=9)
              {
                mini++;
                j=0;
              }
              if(mini>=3)
              {
                hours++;
                j=0;
                mini=0;
                // mini=0;
              }
              return Center(
                child: Text("$hours:$mini:$x", style: TextStyle(fontSize: 30)),);
            } else {
              // stopwatch.stop();
              return Center(
                child: Text("$hours:$mini:$x", style: TextStyle(fontSize: 30)),);
            }
          },),
        Row(
          children: [
            InkWell(
              onTap: () {
                // if(t%2==0)
                //   {
                //     l[0]="Stop ";
                //     b=a;
                //     print("b=${b}");
                //     start=true;
                //     t++;
                //   }else
                //     {
                //       l[0]="Start";
                //       stopwatch.stop();
                //       start=false;
                //       t++;
                //     }
                start=start?false:true;
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 100,
                color: Colors.blue,
                margin: EdgeInsets.all(10),
                child: start?Text("Stop", style: TextStyle(fontSize: 20)):Text("Start", style: TextStyle(fontSize: 20)),
                // child:Text("${l[0]}",style: TextStyle(fontSize: 20),)
              ),
            ),
            InkWell(
              onTap: () {
                start=false;
                j=0;
                mini=0;
                hours=0;
                l[0]="Start";
                setState(() {

                });
              },
              child: Container(alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  color: Colors.blue,
                  margin: EdgeInsets.all(10),
                  child: Text("Reaset", style: TextStyle(fontSize: 20))),
            )
          ],
        )
      ]),
    );
  }
}
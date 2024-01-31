import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: first(),));
}
class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  int a=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  Stream get()
  async* {
    // for(int i=1; i<=10; i++)
    //  {
    //    a=i;
    //    await Future.delayed(Duration(seconds: 1));
    //    yield a;
    //  //  return ni jgyaye yield no use thy because return
    //  //  lakhvathi 1 j var run thy ne bar nikli jase ex.a=1
    //  }


    //  continue mate
    int i=1;
    while(true)
    {
      a=i;
      i++;
      await Future.delayed(Duration(seconds: 1));
      yield a;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Multiple Data"),),

      body: StreamBuilder(
        stream: get(),
        builder: (context, snapshot) {
          // print(snapshot.connectionState);
          // print(snapshot.data);
          if((snapshot.connectionState==ConnectionState.active)||(snapshot.connectionState==ConnectionState.done))
          {
            int x=snapshot.data;
            return Center(
              child: Text("A : $x",style: TextStyle(fontSize: 30),),
            );
          }else
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },),
    );
  }
}

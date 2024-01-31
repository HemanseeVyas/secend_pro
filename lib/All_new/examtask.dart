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
  List<Map> h=[{
    'email':'vyas@gmail.com','pass':123,
    'email':'vyash@gmail.com','pass':1234,
    'email':'vyashemu@gmail.com','pass':1235,
    'email':'hemu@gmail.com','pass':1236,
  }];
  String e="vays@gmail.com";
  String p="12345";
  String msg="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text("New_Task"),
      ),
      body: Column(children: [
       Container(
         margin: EdgeInsets.all(10),
         child: TextField(
          decoration: InputDecoration(border: OutlineInputBorder(),
            hintText: "Enter your email",
            labelText: "Enter your email"
          ),
         ),
       ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: "Enter your password",
                labelText: "Enter your password"
            ),
          ),
        ),
        ElevatedButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return sec();
        },));
        }, child: Text("Login")),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return third();
          },));
        }, child: Text("Register")),
      ]),
    );
  }
}



class sec extends StatefulWidget {
  const sec({super.key});

  @override
  State<sec> createState() => _secState();
}

class _secState extends State<sec> {
  String e1="vays@gmail.com";
  String p1="12345";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("New_Task"),),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: "Enter your email",
                labelText: "Enter your email"
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: "Enter your password",
                labelText: "Enter your password"
            ),
          ),
        ),
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return first();
          },));
        }, child: Text("Submit")),
      ]),
    );
  }
}

class third extends StatefulWidget {
  const third({super.key});

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  String e="vyas@gmail.com";
  String p="12345";
  String e1="vyas@gmail.com";
  String p1="12345";
  String msg="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("New_task"),),
      body: InkWell(onTap: () {
        if(e==p && e1==p1)
          {
                msg="You are loggined...!";
          }
      },
        child: Container(
          // child: Text("$msg"),
          child: Text("You are loggined...!"),
        ),
      ),
    );
  }
}


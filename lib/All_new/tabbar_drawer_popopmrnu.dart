import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: tab(),));
}
//tababar_drawer_popopmenu1 same as work differnce between dynamic
class tab extends StatefulWidget {
  const tab({super.key});

  @override
  State<tab> createState() => _tabState();
}

class _tabState extends State<tab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 7,
      // initialIndex: 2,
      animationDuration: Duration(seconds: 1),
      child: Scaffold(
        // drawerEnableOpenDragGesture: false,
        drawer: Drawer(
            child: Column(children: [
              UserAccountsDrawerHeader(
                // currentAccountPicture: Image.asset("myassets/img/aguacate.png"),
                  accountName: Text("Hemu Prajapati"),
                  accountEmail: Text("HemuPrajapati@gamil.com")),
              ListTile(onTap: () {
               Navigator.pop(context);
              },title: Text("One"),),
              ListTile(onTap: () {
                Navigator.pop(context);
              },title: Text("Two"),),
              ListTile(onTap: () {
                Navigator.pop(context);
              },title: Text("Three"),)
            ],)),
        appBar: AppBar(title: Text("Tabbar"),
          actions: [
            IconButton(onPressed: () {
              print("Hello");
            }, icon: Icon(Icons.search)),
            PopupMenuButton(
                onCanceled: () {
                  print("Testing");
                },
                onSelected: (value) {
                  if(value==1)
                  {
                    print("one");
                  }else if(value==2)
                  {
                    print("two");
                  }else if(value==3)
                  {
                    print("three");
                  }
                },
                itemBuilder: (context) =>
                [
                  PopupMenuItem(value: 1,child: Text("one")),
                  PopupMenuItem(value: 2,child: Text("two")),
                  PopupMenuItem(value: 3,child: Text("three")),
                ]
            ),
          ],
          bottom: TabBar(
              isScrollable: true,
              // indicatorColor: Colors.yellow,
              dividerColor: Colors.black,
              // indicator: BoxDecoration(color: Colors.blueGrey,
              //     borderRadius: BorderRadius.circular(10)),
              unselectedLabelColor: Colors.black,
              labelColor: Colors.amberAccent,
              tabs: [
                Tab(
                  child: Text("one"),
                ), Tab(
                  child: Text("two"),
                ),Tab(
                  child: Text("three"),
                ),Tab(
                  child: Text("for"),
                ),Tab(
                  child: Text("five"),
                ),Tab(
                  child: Text("six"),
                ),Tab(
                  child: Text("seven"),
                ),
                Tab(
                  child: Text("eight"),
                ),
                Tab(
                  child: Text("nine"),
                )
              ]),
        ),
        body: TabBarView(children: [
          one(),
          two(),
          third(),
          four(),
          five(),
          six(),
          seven()
        ]),
      ),
    );
  }
}


class one extends StatefulWidget {
  const one({super.key});

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Text("This is one",style: TextStyle(color: Colors.white,fontSize: 30),),
    );
  }
}

class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Text("This is two",style: TextStyle(color: Colors.white,fontSize: 30),),
    );
  }
}

class third extends StatefulWidget {
  const third({super.key});

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Text("This is three",style: TextStyle(color: Colors.white,fontSize: 30),),
    );
  }
}

class four extends StatefulWidget {
  const four({super.key});

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Text("This is four",style: TextStyle(color: Colors.white,fontSize: 30),),
    );
  }
}


class five extends StatefulWidget {
  const five({super.key});

  @override
  State<five> createState() => _fiveState();
}

class _fiveState extends State<five> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Text("This is five",style: TextStyle(color: Colors.white,fontSize: 30),),
    );
  }
}

class six extends StatefulWidget {
  const six({super.key});

  @override
  State<six> createState() => _sixState();
}

class _sixState extends State<six> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Text("This is six",style: TextStyle(color: Colors.white,fontSize: 30),),
    );
  }
}


class seven extends StatefulWidget {
  const seven({super.key});

  @override
  State<seven> createState() => _sevenState();
}

class _sevenState extends State<seven> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Text("This is seven",style: TextStyle(color: Colors.white,fontSize: 30),),
    );
  }
}

class eight extends StatefulWidget {
  const eight({super.key});

  @override
  State<eight> createState() => _eightState();
}

class _eightState extends State<eight> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Text("This is seven",style: TextStyle(color: Colors.white,fontSize: 30),),
    );
  }
}

class nine extends StatefulWidget {
  const nine({super.key});

  @override
  State<nine> createState() => _nineState();
}

class _nineState extends State<nine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Text("This is seven",style: TextStyle(color: Colors.white,fontSize: 30),),
    );
  }
}


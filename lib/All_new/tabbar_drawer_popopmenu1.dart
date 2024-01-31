import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: tab(),));
}
class tab extends StatefulWidget {
  const tab({super.key});

  @override
  State<tab> createState() => _tabState();
}

class _tabState extends State<tab> with TickerProviderStateMixin{
  TabController ? tabController;
  int cur_tab=0;
  List str=["one","two","three","four"];
  List<Widget> tab_class=[one(),two(),third(),four()];
  List<Widget> tab_icon=[
    Icon(Icons.home),
    Icon(Icons.add_box_outlined),
    Icon(Icons.backup_sharp),
    Icon(Icons.call_merge_rounded),
    Icon(Icons.home),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(
      initialIndex: cur_tab,
        animationDuration: Duration(seconds: 1),
        length: str.length, vsync: this);
    tabController!.addListener(() {
      cur_tab=tabController!.index;
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawerEnableOpenDragGesture: false,
        drawer: Drawer(
            child: Column(children: [
              UserAccountsDrawerHeader(
                // currentAccountPicture: Image.asset("myassets/img/aguacate.png"),
                  accountName: Text("Hemu Prajapati"),
                  accountEmail: Text("HemuPrajapati@gamil.com")),
              ListTile(
                onTap: () {
                  cur_tab=0;
                  tabController!.animateTo(cur_tab);
                  Navigator.pop(context);
                  str.map((e) {
                    int ind=str.indexOf(e);
                    return Container(
                     child: Text("$e"),
                    );
                  });
                },
              ),
              ListTile(
              title: Text("One"),
                onTap: () {
                  cur_tab=0;
                  tabController!.animateTo(cur_tab);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("two"),
                onTap: () {
                  cur_tab=1;
                  tabController!.animateTo(cur_tab);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("three"),
                onTap: () {
                  cur_tab=2;
                  tabController!.animateTo(cur_tab);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("four"),
                onTap: () {
                  cur_tab=3;
                  tabController!.animateTo(cur_tab);
                  Navigator.pop(context);
                },
              ),
            ],)),
        appBar: AppBar(
          bottom: TabBar(onTap: (value) {
            cur_tab=value;
            setState(() {});
          },
            controller: tabController,
            tabs: str.map((e) {
              int ind=str.indexOf(e);
              return Tab(
                child: Text("${e}"),
                icon: tab_icon[ind],
              );
            }).toList(),
            // isScrollable: true,
            // // indicatorColor: Colors.yellow,
            // dividerColor: Colors.black,
            // // indicator: BoxDecoration(color: Colors.blueGrey,
            // //     borderRadius: BorderRadius.circular(10)),
            // unselectedLabelColor: Colors.black,
            // labelColor: Colors.amberAccent,
          ),
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
                 // PopupMenuItem(value: str.length,
                 //   child: Text("$str"),
                 //   onTap: () {
                 //     cur_tab=0;
                 //     tabController!.animateTo(cur_tab);
                 //     setState(() {});
                 //   },
                 // ),
                  PopupMenuItem(child: Text("one"),
                    onTap: () {
                      cur_tab=1;
                      tabController!.animateTo(cur_tab);
                      setState(() {});
                    },
                  ),
                  PopupMenuItem(child: Text("two"),
                    onTap: () {
                      cur_tab=1;
                      tabController!.animateTo(cur_tab);
                      setState(() {});
                    },
                  ),
                  PopupMenuItem(child: Text("three"),
                    onTap: () {
                      cur_tab=2;
                      tabController!.animateTo(cur_tab);
                      setState(() {});
                    },
                  ),
                  PopupMenuItem(child: Text("four"),
                    onTap: () {
                      cur_tab=3;
                      tabController!.animateTo(cur_tab);
                      setState(() {});
                    },
                  ),
                ]
            ),
          ],
          title: Text("Tabbar"),
        ),
        body: TabBarView(
         controller: tabController,children: tab_class),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cur_tab,
          onTap: (value) {
            cur_tab=value;
            tabController!.animateTo(value);
            setState(() {});
          },
          items: str.map((e) {
            int ind=str.indexOf(e);
            return BottomNavigationBarItem(
                icon: tab_icon[ind],
              backgroundColor: Colors.teal,
              label: "$e");
          }).toList(),
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


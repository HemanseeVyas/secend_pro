
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:p2/logo_game/p1.dart';
import 'package:p2/logo_game/p2.dart';

class hh extends StatefulWidget {
  List logo;
  int index;
  hh(this.index, this.logo);

  @override
  State<hh> createState() => _hhState();
}

class _hhState extends State<hh> {
  PageController ? controller;
  List ans=['facebook','marcidish','adidash','redbull','starbucks','o','mcdonals','google','abc','kitty','honda',
  'amazon','dell','magar','bmw','box','nike','pepsi','visa','apple,','vl','audi','xyz','round','barbie','network',
  'by','twitter','android','instagram','facebook','chrome','ni','facebook','color','dr','panasonic','mobile',
  'netfix','printerest'];
  int levelno=0;
  //u con
  List user_ans=[];
  List random_op=[
    'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
    'o','p','q','r','s','t','u','v','w','x','y','z'
  ];
  //con ma list ans na answer mte
  List option=[];
  //u con
  List temp=[];
  List temp1=[];
  int point=20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    levelno=widget.index;
    controller=PageController(initialPage: levelno);
    // user_ans=List.filled(ans[levelno].toString().length, "");
    // random_op.shuffle();
    // option=List.filled(14, "");
    // temp=List.filled(user_ans.length, "");
    // for(int i=0; i<user_ans.length; i++)
    // {
    //   option[i]=ans[levelno][i];
    //   print("opt=$option");
    // }
    // for(int i=user_ans.length; i<14; i++)
    //   {
    //     option[i]=random_op[i];
    //   }
    // option.shuffle();
    get();
  }

  get()
  {
    user_ans=List.filled(ans[levelno].toString().length, "");
    random_op.shuffle();
    option=List.filled(14, "");
    temp=List.filled(user_ans.length, "");
    temp1=List.filled(user_ans.length, "");
    for(int i=0; i<user_ans.length; i++)
    {
      option[i]=ans[levelno][i];
      print("opt=$option");
    }
    for(int i=user_ans.length; i<14; i++)
    {
      option[i]=random_op[i];
    }
    option.shuffle();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
        body: PageView.builder(
          itemCount: widget.logo.length,
          controller: controller,
          onPageChanged: (value) {
            print(levelno);
            levelno=value;
            get();
            setState(() {
            });
          },
          itemBuilder: (context, index) {
            String wins=logos1.prefs!.getString("win$index") ?? "";
            return (wins=="yes")?Center(child: Text("win")):Column(
              children: [
                Expanded(flex: 2,
                    child: Container(
                      height: double .infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                        image: AssetImage("myassets/img/main_background_header.png"),
                      )),
                      child: Row(children: [
                        Expanded(
                          child: InkWell(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return grid1();
                            },));
                          },
                            child: Container(
                              height: 40,
                              width: 20,
                              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                                image: AssetImage("myassets/img/n_arrow_back.png"),
                              )),
                            ),
                          ),
                        ),
                        Expanded(flex: 6,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text("Level ${levelno+1} / 40",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 60,
                            width: 40,
                            decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                              image: AssetImage("myassets/img/n_bulb_mark.png"),
                            )),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text("hints\n50",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ),
                        ),
                      ]),
                    )
                ),
                Expanded(flex: 6,
                  child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(children: [
                        Expanded(
                          child: Row(children: [
                            InkWell(onTap: () {
                              // (widget.index>0) ? widget.index--:widget.index;
                              levelno--;
                              controller!.jumpToPage(levelno);
                              get();
                              setState(() {
                              });
                            },
                              child: Container(
                                height: 20,
                                width: 20,
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                                  image: AssetImage("myassets/img/game_arrow_left.png"),
                                )),
                              ),
                            ),
                            SizedBox(width: 60),
                            Expanded(
                              child: Container(
                                  margin: EdgeInsets.all(20),
                                  // color: Colors.pink,
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    child: Image.asset("${widget.logo[levelno]}"),
                                  )
                              ),
                            ),
                            SizedBox(width: 60),
                            InkWell(onTap: () {
                              levelno++;
                              // (widget.index+1<widget.logo.length) ? widget.index++ : widget.index;
                              controller!.jumpToPage(levelno);
                              get();
                              setState(() {
                              });
                            },
                              child: Container(
                                height: 20,
                                width: 20,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                                  image: AssetImage("myassets/img/game_arrow_right.png"),
                                )),
                              ),
                            ),
                          ]),
                        ),
                      ],)
                  ),
                ),
                Expanded(flex: 4,
                  child: Wrap(
                      children:List.generate(user_ans.length  , (index) =>  InkWell(onTap: () {
                        //use hint into code
                        if(temp1[index]==false)
                        {
                          option[temp[index]]=user_ans[index];
                          user_ans[index]="";
                        }
                        //user hint before
                        // if(user_ans[index]!="")
                        // {
                        //   option[temp[index]]=user_ans[index];
                        //   user_ans[index]="";
                        // }

                        setState(() {
                        });
                      },
                        child: Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.all(10),
                          color: Colors.black38,
                          // color: (temp1[index]==true) ? Colors.black38:Colors.pink,
                          alignment: Alignment.center,
                          child: Text("${user_ans[index]}"),
                        ),
                      ),)
                  ),
                ),
                Expanded(child: Container(
                  height: 40,
                  width: 40,
                  color: Colors.deepOrange,
                  alignment: Alignment.center,
                  child: Text("${point}"),
                )),
                Expanded(flex: 2,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Row(children: [
                      Expanded(flex: 3,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 10,bottom: 10,left: 30,right: 10),
                          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                            image: AssetImage("myassets/img/n_hints_green.png"),
                          )),
                          child: Row(children: [
                            Expanded(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 10,bottom: 10,left: 30),
                                decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                                  image: AssetImage("myassets/img/n_bulb.png"),
                                )),
                              ),
                            ),
                            Expanded(flex: 3,
                              child: InkWell(onTap: () {
                               showDialog(context: context, builder: (context) {
                                 return AlertDialog(
                                   actions: [
                                     Container(
                                       height: 300,
                                       width: double.infinity,
                                       color: Colors.deepOrange,
                                       child: Column(children: [
                                         Expanded(flex: 1,
                                           child: InkWell(onTap: () {
                                             Navigator.pop(context);
                                             int r=Random().nextInt(user_ans.length);
                                             //list to string convet mate split use thase
                                             List abc=[];
                                             abc=List.filled(user_ans.length, "");
                                             for(int i=0; i<ans[levelno].toString().length; i++)
                                             {
                                               abc[i]=ans[levelno].toString()[i];
                                             }
                                             user_ans[r]=abc[r];
                                             for(int i=0; i<option.length; i++)
                                             {
                                               if(abc[r]==option[i])
                                               {
                                                 point=point-1;
                                                 temp[r]=i;
                                                 temp1[r]=true;
                                                 option[i]="";
                                                 break;
                                               }
                                             }
                                             setState(() {
                                             });
                                           },
                                             child: Container(
                                               alignment: Alignment.center,
                                               color: Colors.white,
                                               margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                                               child: Text("Random Letter 1")
                                             ),
                                           ),
                                         ),
                                         Expanded(
                                           child: InkWell(onTap: () {
                                             int r=Random().nextInt(user_ans.length);
                                             int r1=Random().nextInt(user_ans.length);
                                             //list to string convet mate split use thase
                                             List abc=[];
                                             List abc1=[];
                                             abc=List.filled(user_ans.length, "");
                                             abc1=List.filled(user_ans.length, "");
                                             for(int i=0; i<ans[levelno].toString().length; i++)
                                             {
                                               abc[i]=ans[levelno].toString()[i];
                                               abc1[i]=ans[levelno].toString()[i];
                                             }
                                             user_ans[r]=abc[r];
                                             user_ans[r1]=abc1[r1];
                                             for(int i=0; i<option.length; i++)
                                             {
                                               if(abc[r]==option[i])
                                               {
                                                 point=point-2;
                                                 temp[r]=i;
                                                 temp1[r]=true;
                                                 option[i]="";
                                                 break;
                                               }
                                             }

                                             for(int i=0; i<option.length; i++)
                                             {
                                               if(abc1[r1]==option[i])
                                               {
                                                 temp[r1]=i;
                                                 temp1[r1]=true;
                                                 option[i]="";
                                                 break;
                                               }
                                             }

                                             Navigator.pop(context);
                                             setState(() {
                                             });
                                           },
                                             child: Container(
                                               color: Colors.white,
                                               alignment: Alignment.center,
                                               margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                               child: Text("Random Letter 2"),
                                             ),
                                           ),
                                         ),
                                         Expanded(
                                           child: InkWell(onTap: () {
                                             print("${ans[index]}");
                                             Navigator.pop(context);
                                             // List man=[];
                                             // man=List.filled(user_ans.length, "");
                                             // print("$man");
                                             // for(int i=0; i<ans[index].toString().length; i++)
                                             //   {
                                             //     man[i]=ans[levelno][i];
                                             //   }
                                             // for(int i=0; i<user_ans.length; i++)
                                             // {
                                             //     if(user_ans[i]!=man[i])
                                             //       {
                                             //         option[temp[i]]=user_ans[i];
                                             //         user_ans[i]="";
                                             //       }
                                             // }
                                             for(int i=0; i<option.length; i++)
                                               {
                                                  option[i]="";
                                                  for(int i=0; i<user_ans.length; i++)
                                                    {
                                                      option[i]=ans[levelno][i];
                                                    }
                                               }
                                             option.shuffle();
                                            String user_ans1=user_ans.join();
                                             if(user_ans1==ans[levelno])
                                               {
                                                 print('you are win....!');
                                               }
                                             setState(() {
                                             });
                                           },
                                             child: Container(
                                               color: Colors.white,
                                               alignment: Alignment.center,
                                               margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
                                               child: Text("Remove Extra Character"),
                                             ),
                                           ),
                                         ),
                                         Expanded(
                                           child: InkWell(onTap: () {
                                             Navigator.pop(context);
                                             setState(() {
                                             });
                                           },
                                             child: Container(
                                               color: Colors.white,
                                               alignment: Alignment.center,
                                               margin: EdgeInsets.fromLTRB(40, 5, 40, 10),
                                               child: Text("cancel"),
                                             ),
                                           ),
                                           ),
                                       ]),

                                     )
                                   ],
                                 );
                               },);
                              },
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 40),
                                  child: Text("Use hints",style: TextStyle(color: Colors.white,fontSize: 30),),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Expanded(
                        child: InkWell(onTap: () {
                          for(int i=0; i<user_ans.length; i++)
                          {
                            if(user_ans[i]!="")
                            {
                              option[temp[i]]=user_ans[i];
                              user_ans[i]="";
                            }
                          }
                          setState(() {

                          });
                        },
                          child: Container(
                            height: 60,
                            width: 60,
                            margin: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                            decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                              image: AssetImage("myassets/img/n_delete_all_red.png"),
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(onTap: () {
                          for(int i=temp.length-1; i>=0; i--)
                          {
                            if(temp[i]!="")
                            {
                              option[temp[i]]=user_ans[i];
                              user_ans[i]="";
                              temp[i]="";
                              break;
                            }
                          }
                          setState(() {

                          });
                        },
                          child: Container(
                            height: 60,
                            width: 60,
                            margin: EdgeInsets.only(top: 10,bottom: 10,right: 40),
                            decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                              image: AssetImage("myassets/img/n_delete_one_red.png"),
                            )),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Expanded(flex: 4,
                  child: Container(
                    child: GridView.builder(itemCount: 14,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5
                      ), itemBuilder: (context, index) {
                        return (option[index]!='') ? InkWell(onTap: () {
                          for(int i=0; i<user_ans.length; i++)
                          {
                            if(user_ans[i]=="")
                            {
                              user_ans[i]=option[index];
                              temp[i]=index;
                              temp1[i]=false;
                              option[index]="";
                              break;
                            }
                          }
                          check_win();
                          setState(() {

                          });
                        },
                          child: Container(
                            height: 20,
                            width: 20,
                            color: Colors.black38,
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text("${option[index]}",style: TextStyle(color: Colors.black,fontSize: 20),),
                          ),
                        ):Text("");
                      },),
                  ),
                ),
                Expanded(flex: 2,child: Container(
                  height: double.infinity,
                  width: double.infinity,
                )),
              ],
            );
          },)
    ), onWillPop: () async{

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
       return grid1();
     },));
      return true;
    },);
  }
  check_win()
  {
    String t=user_ans.join("");
    if(t==ans[levelno])
      {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text("you are win"),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
                logos1.prefs!.setString("win$levelno", "yes");
                levelno++;
                controller!.jumpToPage(levelno);
                setState(() {
                });
              }, child: Text("Next"))
            ],
          );
        },);
      }
    setState(() {

    });
  }
}

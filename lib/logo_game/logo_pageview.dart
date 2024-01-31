import 'package:flutter/material.dart';
import 'package:p2/logo_game/gridview.dart';
import 'package:p2/logo_game/play.dart';

class pgview extends StatefulWidget {
  int ind;
  List im;
  pgview(this.ind,this.im);

  @override
  State<pgview> createState() => _pgviewState();
}

class _pgviewState extends State<pgview> {
  PageController ? controller;
  List ans=['ONE','TWO','THREE','FOUR','FIVE'];
  List temp=[];
  List random_op=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
  int levelno=0;
  List user_ans=[];
  List option=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    levelno=widget.ind;
    get();
    controller=PageController(initialPage: levelno);
  }
  get()
  {

    user_ans=List.filled(ans[levelno].toString().length, "");
    random_op.shuffle();
    option=List.filled(14, "");
    temp=List.filled(user_ans.length, "");
    for(int i=0; i<user_ans.length; i++)
    {
      option[i]=ans[levelno][i];
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
    return Scaffold(
      body: PageView.builder(
        itemCount: widget.im.length,
        controller: controller,
        onPageChanged: (value) {
          levelno=value;
          controller!.jumpToPage(levelno);
          get();
          setState(() {
          });
        },
        itemBuilder: (context, index) {
        return Column(children: [
          Expanded(flex: 2,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                  image: AssetImage("myassets/img/main_background_header.png"),
                )),
                child: Row(children: [
                  Expanded(
                    child: InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return grid();
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
              child:Row(children: [
                InkWell(onTap: () {
                  // (levelno > 0) ?levelno--:widget.ind;
                  // // levelno--;
                  if(levelno>0)
                    {
                      levelno--;
                    }
                  controller!.jumpToPage(levelno);
                  // get();
                  setState(() {
                  });
                },
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                      image: AssetImage("myassets/img/game_arrow_left.png"),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.asset("${widget.im[levelno]}"),
                    ),
                  ),
                ),
                InkWell(onTap:() {
                  // 2 condtion true
                  if(levelno<widget.im.length-1)
                  {
                    levelno++;
                  }
                  // (widget.ind<widget.im.length-1) ? widget.ind++ : widget.ind;
                  // (widget.ind+1<widget.im.length)? widget.ind++ : widget.ind;
                  // levelno++;
                  controller!.jumpToPage(levelno);
                  // get();
                  setState(() {
                  });
                },
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                      image: AssetImage("myassets/img/game_arrow_right.png"),
                    )),
                  ),
                ),
              ],)
          ),
          Expanded(flex: 2,
            child: Wrap(
                alignment: WrapAlignment.center,
                children: List.generate(user_ans.length, (index) => InkWell(onTap: () {
                  if(user_ans[index]!="")
                  {
                    option[temp[index]]=user_ans[index];
                    user_ans[index]="";
                  }
                  setState(() {
                  });
                },child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(3),
                  child: Text("${user_ans[index]}"),
                ),))
            ),
          ),
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
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 40),
                          child: Text("Use hints",style: TextStyle(color: Colors.white,fontSize: 30),),
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
                    setState(() { });
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
                    // for(int i=0; i<user_ans.length; i++)
                    //   {
                    //     if(user_ans!="")
                    //       {
                    //         user_ans[i]=user_ans[i].sublist(0,user_ans[i]-1);
                    //       }
                    //   }

                    // for(int i=0; i<user_ans.length; i++)
                    //   {
                    //     if(user_ans!="")
                    //       {
                    //         option[temp[i]]=user_ans[i];
                    //         // user_ans[i]="";
                    //         user_ans[i]--;
                    //       }
                    //   }
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
                height: double.infinity,
                width: double.infinity,
                child: GridView.builder(itemCount: 14,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5
                  ), itemBuilder: (context, index) {
                    return (option[index]!='')? InkWell(
                        onTap: () {
                          for(int i=0; i<user_ans.length; i++)
                          {
                            if(user_ans[i]=="")
                            {
                              user_ans[i]=option[index];
                              temp[i]=index;
                              option[index]="";
                              break;
                            }
                          }
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                          color: Colors.black38,
                          alignment: Alignment.center,
                          child: Text("${option[index]}",style: TextStyle(fontSize: 20),),
                        )
                    ):Text("");
                  },),
              )
          ),
          Expanded(flex: 2,
            child: Container(
              height: double.infinity,
              width: double.infinity,
            ),
          )
        ]);
      },)
    );
  }
}

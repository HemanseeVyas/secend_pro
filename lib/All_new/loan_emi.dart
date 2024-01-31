import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: loan(),));
}
class loan extends StatefulWidget {
  const loan({super.key});

  @override
  State<loan> createState() => _loanState();
}

class _loanState extends State<loan> {
  double a=100000;
  double a1=0;
  double a2=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EMI Calculator for Home Loan, Car Loan & Personal Loan in India"),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey.shade200,
        child: Column(children: [
          Row(children: [
            Container(
              height: 60,
              width: 140,
              alignment: Alignment.center,
              child: Text("Home Loan",style: TextStyle(fontSize: 15,color: Colors.black),),
              decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.blueGrey),),
              margin: EdgeInsets.only(left: 20,top: 20),
            ),
            Container(
              height: 60,
              width: 140,
              alignment: Alignment.center,
              child: Text("Personal Loan",style: TextStyle(fontSize: 15,color: Colors.black),),
              decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.blueGrey),),
              margin: EdgeInsets.only(top: 20),
            ),
            Container(
              height: 60,
              width: 140,
              alignment: Alignment.center,
              child: Text("Car Loan",style: TextStyle(fontSize: 15,color: Colors.black),),
              decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.blueGrey),),
              margin: EdgeInsets.only(top: 20),
            ),
          ],),
          SizedBox(height: 10,),
          Row(children: [
            Container(
              margin: EdgeInsets.only(left: 40),
              child: Text("Home Loan Amount",style: TextStyle(fontSize: 15),),
            ),
            SizedBox(width: 10,),
            Container(
              height: 30,
              width: 200,
              color: Colors.white,
              alignment: Alignment.center ,
              child: Text("$a",style: TextStyle(),),
            ),
            Container(
              height: 30,
              width: 20,
              alignment: Alignment.center,
              color: Colors.blueGrey.shade100,
              child: Text("₹"),
            )
          ],),
          SizedBox(height: 10,),
          Slider(value: a,
            max: 20000000,
            min: 100000,
            activeColor: Colors.orange,
            inactiveColor: Colors.grey,
            onChanged: (value) {
            a=value!;
            setState(() {

            });
          },),

          SizedBox(height: 10,),
          Row(children: [
            Container(
              margin: EdgeInsets.only(left: 40),
              child: Text("Interest Rate",style: TextStyle(fontSize: 15),),
            ),
            SizedBox(width: 10,),
            Container(
              height: 30,
              width: 200,
              color: Colors.white,
              alignment: Alignment.center ,
              child: Text("$a1",style: TextStyle(),),
            ),
            Container(
              height: 30,
              width: 20,
              alignment: Alignment.center,
              color: Colors.blueGrey.shade100,
              child: Text("%"),
            )
          ],),
          SizedBox(height: 10,),
          Slider(value: a1,
            max: 20,
            min: 0,
            activeColor: Colors.orange,
            inactiveColor: Colors.grey,
            onChanged: (value) {
             a1=value!;
             setState(() {

             });
            },),

          SizedBox(height: 10,),
          Row(children: [
            Container(
              margin: EdgeInsets.only(left: 40),
              child: Text("Loan Tenure",style: TextStyle(fontSize: 15),),
            ),
            SizedBox(width: 10,),
            Container(
              height: 30,
              width: 200,
              color: Colors.white,
              alignment: Alignment.center ,
              child: Text("$a2",style: TextStyle(),),
            ),
            Container(
              height: 30,
              width: 20,
              alignment: Alignment.center,
              color: Colors.blueGrey.shade100,
              child: Text("Yr |"),
            ),
            Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              color: Colors.blueGrey.shade100,
              child: Text("Mo"),

            )
          ],),
          SizedBox(height: 10,),
          Slider(value: a2,
            max: 30,
            min: 0,
            activeColor: Colors.orange,
            inactiveColor: Colors.grey,
            onChanged: (value) {
              a2=value!;
              setState(() {

              });
            },),

          SizedBox(height: 10,),
          Expanded(flex: 2,
            child: Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.only(right: 240),
              alignment: Alignment.center,
              child: Text("Loan EMI\n$a"),
            ),
          ),
          Expanded(flex: 2,child: Container(
            height: 200,
            width: 200,
            margin: EdgeInsets.only(right: 240),
            alignment: Alignment.center,
            child: Text("Total Interest Payable\n\t\t\t\t\t\t\t\t\t\t$a"),
          )),
          Expanded(flex: 2,child: Container(
            height: 200,
            width: 200,
            margin: EdgeInsets.only(right: 240),
            alignment: Alignment.center,
            child: Text("\t\t\t\t\tTotal Payment\n(Principal + Interest)\n\t\t\t\t\t\t\t$a"),
          ))
        ]),
      ),
    );
  }
}

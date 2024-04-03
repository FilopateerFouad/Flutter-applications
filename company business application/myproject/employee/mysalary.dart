import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/mydatabase/applogic.dart';
import 'package:flutter_app/myproject/mydatabase/appstate.dart';
import 'package:flutter_app/myproject/repeated.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EmpSalary extends StatelessWidget{
  String name='';
  EmpSalary({required this.name});
  @override
  Widget build(BuildContext context) {
    String salary='0',bonus='0';
    return BlocProvider(create: (context) =>
    AppLogic()..createData(),
    child: BlocConsumer<AppLogic, AppState>(
    listener: (context, state) {},
    builder: (context, state) {
    AppLogic data = BlocProvider.of(context);
    for(int i=0;i<AppLogic.admin_users.length;i++){
      if(name==AppLogic.admin_users[i]["username"]){
        bonus=AppLogic.admin_users[i]["bonus"].toString();
        salary=AppLogic.admin_users[i]["salary"].toString();
      }
    }
    return Scaffold(appBar: AppBar(title: Text("My Salary"),centerTitle: true,backgroundColor: Colors.black54,),
      body: Container(
        width: double.infinity,
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
              children: [Padding(
                padding: const EdgeInsets.only(top:30),
                child: CircleAvatar(radius: 100,backgroundImage: AssetImage("assets/images/salary.png")),
              ),
                Padding(
                    padding: const EdgeInsets.only(top: 60,bottom:20 ),
                    child:Row( children:[Text("My Salary:\t",style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold)),
                      Text("$salary",style: TextStyle(color: Colors.black,fontSize: 30))])
                ),
                Row( children:[Text("My Bonus:\t",style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold)),
                  Text("$bonus",style: TextStyle(color: Colors.black,fontSize: 30))]) ]),
        ),
      )
      ,);
    }));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/employee/mysalary.dart';
import 'package:flutter_app/myproject/mydatabase/applogic.dart';
import 'package:flutter_app/myproject/mydatabase/appstate.dart';
import 'package:flutter_app/myproject/repeated.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AdminMon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController username=TextEditingController();
    TextEditingController salary=TextEditingController();
    TextEditingController bonus=TextEditingController();
    String name='';
    return BlocProvider(create:(context)=>AppLogic()..createData(),
    child: BlocConsumer<AppLogic,AppState>(
    listener: (context,state){},
    builder: (context,state){
      AppLogic data=BlocProvider.of(context);
      return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text("Financial"),centerTitle: true,backgroundColor: Colors.black54,),
        body: ListView(
          children:[ Container(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [Padding(
                  padding: const EdgeInsets.only(top:30,bottom:50),
                  child: Row(children: [Text("Enter username:  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                    Expanded(child:    Row(children:[Expanded(child:TextFormField(controller:username,decoration: InputDecoration(fillColor: Colors.grey,filled:true,
                        border:OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
                        labelText: "Username",suffixIcon: Icon(Icons.account_circle)))),
                      InkWell(onTap: (){
                      for (int i = 0; i < AppLogic.admin_users.length; i++) {
                        if (AppLogic.admin_users[i]["username"].toString() == username.text){
                          salary.text=AppLogic.admin_users[i]["salary"].toString();
                          bonus.text=AppLogic.admin_users[i]["bonus"].toString();
                          name=AppLogic.admin_users[i]["username"].toString();
                        }
                      }},child: CircleAvatar(radius: 25,backgroundColor: Colors.grey,backgroundImage:AssetImage("assets/images/search.png")))]))],),
                ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Row(children: [Text("User's salary: ",style:TextStyle(fontWeight: FontWeight.bold,fontSize:25,color: Colors.black)),
                      Expanded(child:TextFormField(controller:salary,decoration: InputDecoration(fillColor: Colors.grey,filled:true,
                          border:OutlineInputBorder(borderRadius:BorderRadius.circular(40)),
                          labelText: "Salary",suffixIcon: Icon(Icons.money_off_csred_outlined))))],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Row(children: [Text("User's bonus: ",style:TextStyle(fontWeight: FontWeight.bold,fontSize:25,color: Colors.black)),
                      Expanded(child:TextFormField(controller:bonus,decoration: InputDecoration(fillColor: Colors.grey,filled:true,
                          border:OutlineInputBorder(borderRadius:BorderRadius.circular(40)),
                          labelText: "Bonus",suffixIcon: Icon(Icons.arrow_upward))))],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [InkWell(onTap:(){
                        data.updateSalary(int.parse(salary.text), int.parse(bonus.text),name);
                      },child:CircleAvatar(radius: 40,backgroundImage:AssetImage("assets/images/increasesalary.png"),)),
                        InkWell(onTap:(){
                          data.updateSalary(int.parse(salary.text), int.parse(bonus.text),name);
                        },child: CircleAvatar(radius:40,backgroundImage:AssetImage("assets/images/bonus.png"))),
                        InkWell(onTap:(){
                          data.updateSalary(int.parse(salary.text), int.parse(bonus.text),name);
                        },child: CircleAvatar(radius:40,backgroundImage:AssetImage("assets/images/decreasesalary.png")))
                      ],),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children:[Text("Increase Salary",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.brown),),
                    Text("Bonus",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.brown),),
                    Text("Decrease Salary",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.brown),)
                  ])
                  ,],),
            ),
          ),
        ]),
      );
    })
    );
  }
}
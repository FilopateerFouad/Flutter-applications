import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/mydatabase/applogic.dart';
import 'package:flutter_app/myproject/mydatabase/appstate.dart';
import 'package:flutter_app/myproject/repeated.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EmpTasks extends StatelessWidget{
  String name,type;
  EmpTasks({required this.name,required this.type});
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController start = TextEditingController();
    TextEditingController title = TextEditingController();
    TextEditingController body = TextEditingController();
    TextEditingController duration = TextEditingController();
    List <String> tasks = [];
    tasks.add("Select a $type");
    String dropdownValue=tasks[0];
    return BlocProvider(create: (context) =>
    AppLogic()..createData(),
        child: BlocConsumer<AppLogic, AppState>(
            listener: (context, state) {},
            builder: (context, state) {
              AppLogic data = BlocProvider.of(context);
              return Scaffold(
                backgroundColor: Colors.grey,
                  appBar: AppBar(title: Text("$name's $type"),centerTitle: true,backgroundColor: Colors.black54,),
                  body: ListView(
                    children:[ Container(
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                              children: [Padding(
                                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                                child:Column( mainAxisAlignment:MainAxisAlignment.spaceAround,children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [InkWell( onTap:(){
                                      data.Task_insertData(username.text, title.text, start.text,duration.text, body.text,name);
                                    } ,child: CircleAvatar(radius: 25,backgroundImage:AssetImage("assets/images/add.png"),)),
                                      InkWell(onTap: (){
                                        data.Tasks_delete(title.text);
                                      },child: CircleAvatar(radius:25,backgroundImage:AssetImage("assets/images/delete.jpg"))),
                                    ],),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children:[Text("  Add",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.brown),),
                                    Text("   Delete",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.brown),),
                                  ])
                                ],),
                              ),
                                Row(children: [Text("Enter $name's name: ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                                  Expanded(child:  Row(children:[Expanded(child:TextFormField(controller:username,decoration: InputDecoration(fillColor: Colors.grey,filled:true,
                                      border:OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
                                      labelText: "Username",suffixIcon: Icon(Icons.account_circle)))),
                                    InkWell(onTap:(){
                                     tasks=data.showEmployeeTasks(username.text,type);
                                      },child: CircleAvatar(radius: 25,backgroundColor: Colors.grey,backgroundImage:AssetImage("assets/images/search.png")))]))]),
                                Padding(
                                  padding: const EdgeInsets.only(top:20,bottom: 20),
                                  child: Row(children: [Text("Select $name's $type:  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                                    DropdownButton<String>(
                                      value: dropdownValue,
                                      items: tasks
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(fontSize:18),
                                          ),
                                        );
                                      }).toList(),
                                      // Step 5.
                                      onChanged: (String? newValue) {
                                          dropdownValue = newValue!;
                                          for(int i=0;i<AppLogic.tasks_users.length;i++){
                                            if(dropdownValue==AppLogic.tasks_users[i]["title"].toString()){
                                              body.text=AppLogic.tasks_users[i]["body"].toString();
                                              start.text=AppLogic.tasks_users[i]["date"].toString();
                                              duration.text=AppLogic.tasks_users[i]["deadline"].toString();
                                              title.text=AppLogic.tasks_users[i]["title"].toString();
                                          }
                                        };
                                      },iconEnabledColor: Colors.black,
                                    )]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:10),
                                  child: RowAccount(context, "Username", Icons.account_circle, username),
                                ), Padding(
                                  padding: const EdgeInsets.only(bottom:10),
                                  child: RowAccount(context,"Start Date",Icons.calendar_today_sharp, start),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:10),
                                  child: RowAccount(context, "Deadline", Icons.timer_sharp, duration),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:10),
                                  child: RowAccount(context, "Title", Icons.title, title),
                                )
                                ,Container(
                                    height: 180,
                                    color:Colors.white,
                                    child:TextField(controller:body,keyboardType: TextInputType.multiline,maxLines:6,)),
                              ]),
                        )),
                  ]));
            }));
  }
}
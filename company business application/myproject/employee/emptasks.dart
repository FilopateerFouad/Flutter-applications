import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/mydatabase/applogic.dart';
import 'package:flutter_app/myproject/mydatabase/appstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repeated.dart';
class EmpTask1 extends StatelessWidget{
  TextEditingController start=TextEditingController();
  TextEditingController duration=TextEditingController();
  TextEditingController title=TextEditingController();
  TextEditingController body=TextEditingController();
  String name,type;
  EmpTask1({required this.name,required this.type});
  @override
  Widget build(BuildContext context) {
    List <String> tasks = [];
    tasks.add("Select a $type");
    String dropdownValue=tasks[0];
    return BlocProvider(create: (context) =>
    AppLogic()..createData(),
    child: BlocConsumer<AppLogic, AppState>(
    listener: (context, state) {},
    builder: (context, state) {
    AppLogic data = BlocProvider.of(context);
    tasks=data.showEmployeeTasks(name,type);
    return Scaffold(appBar: AppBar(title: Text("My $type"),centerTitle: true,backgroundColor: Colors.black54,),
     backgroundColor: Colors.grey, body: ListView(
       children: [Container(color: Colors.grey,
            child:Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(children:[
                Padding(
                  padding: const EdgeInsets.only(top:40,bottom: 30),
                  child: Row(children: [Text("My current $type ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
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
                      onChanged: (String? newValue) {
                        for(int i=0;i<AppLogic.tasks_users.length;i++){
                          if(dropdownValue==AppLogic.tasks_users[i]["title"].toString()){
                            body.text=AppLogic.tasks_users[i]["body"].toString();
                            start.text=AppLogic.tasks_users[i]["date"].toString();
                            duration.text=AppLogic.tasks_users[i]["deadline"].toString();
                            title.text=AppLogic.tasks_users[i]["title"].toString();
                          }
                        };
                        dropdownValue = newValue!;
                      },iconEnabledColor: Colors.black,
                    )]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:20),
                  child: RowAccount(context,"Start Date",Icons.calendar_today_sharp, start),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:20),
                  child: RowAccount(context, "Deadline", Icons.timer_sharp, duration),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:20),
                  child: RowAccount(context, "Title", Icons.title, title),
                ),
                Container(
                    height: 180,
                    color:Colors.white,
                    child:TextField(controller:body,keyboardType: TextInputType.multiline,maxLines:6,)),
              ],),
            )
        ),
     ]),
    );
    }));

  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mydatabase/applogic.dart';
import 'mydatabase/appstate.dart';
class ShowMessage extends StatelessWidget{
  String username='';
  ShowMessage({required this.username});
  @override
  Widget build(BuildContext context) {
    List <Message>me=[];
    return BlocProvider(create:(context)=>AppLogic()..createData(),
    child: BlocConsumer<AppLogic,AppState>(
    listener: (context,state){},
    builder: (context,state){
      AppLogic data=BlocProvider.of(context);
      for(int i=0;i<AppLogic.messages_users.length;i++){
        if(username==AppLogic.messages_users[i]["receiver"].toString()){
          Message m=Message(AppLogic.messages_users[i]["sender"].toString(),AppLogic.messages_users[i]["receiver"].toString(),AppLogic.messages_users[i]["date"].toString(),AppLogic.messages_users[i]["body"].toString());
          me.add(m);
        }
      }
      return Scaffold(
        appBar: AppBar(title:Text("My Messages"),centerTitle: true,backgroundColor: Colors.black54,),
        body: ListView(children: [
          for(int i=0;i<me.length/2;i++)
            Card(color:Colors.blue,
              shadowColor: Colors.black,
              elevation: 5,
              child: ListTile(
                title: Text(me[i].sender,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                subtitle:Text(me[i].body,style: TextStyle(fontSize: 17),) ,
                trailing: Text(me[i].date,style: TextStyle(fontSize: 15),),
              ),)
        ],),
      );}));
  }

}
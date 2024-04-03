import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/repeated.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mydatabase/applogic.dart';
import 'mydatabase/appstate.dart';
class SendMess extends StatelessWidget{
  String username1='';
  SendMess({required this.username1});
  @override
  Widget build(BuildContext context) {
    TextEditingController username=TextEditingController();
    TextEditingController body=TextEditingController();
    TextEditingController date=TextEditingController();
    return BlocProvider(create: (context) =>
    AppLogic()..createData(),
    child: BlocConsumer<AppLogic, AppState>(
    listener: (context, state) {},
    builder: (context, state) {
      AppLogic data = BlocProvider.of(context);
      return Scaffold(
        backgroundColor: Colors.grey,
        appBar:AppBar(title: Text("Send message"),centerTitle: true,backgroundColor: Colors.black54,),
        body: ListView(
          children: [Container(
            width: double.infinity,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: RowAccount(context, "Username of receiver", Icons.account_circle,username),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 50),
                    child: RowAccount(context, "Date", Icons.account_circle,date),
                  ),
                  Container(
                      height: 200,
                      color:Colors.white,
                      child:TextField(controller:body,keyboardType: TextInputType.multiline,maxLines:null,)),
                  Padding(
                    padding: const EdgeInsets.only(top:30),
                    child: MaterialButton(onPressed:(){
                      data.Messages_insertData(username1, username.text, date.text, body.text);
                    },color: Colors.blueGrey,height:50,child:Text("Send",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),
                  )
                ],
              ),
            ),
          ),
        ]));
      }));
  }

}
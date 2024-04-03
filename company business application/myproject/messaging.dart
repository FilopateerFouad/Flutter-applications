import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/sendmessage.dart';
import 'package:flutter_app/myproject/showMessage.dart';
class Messages extends StatelessWidget{
  String username='';
  Messages({required this.username});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: Text("My Messages"),centerTitle: true,backgroundColor: Colors.black54,),
      body: Container(
        width: double.infinity,
        color: Colors.grey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 130,bottom: 50),
              child: MaterialButton(onPressed:(){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (cp) {
                      return SendMess(username1: username,);
                    })
                );
              },color: Colors.brown,height:100,child:Text("Send a message",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black))),
            ),
            MaterialButton(onPressed:(){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (cp) {
                    return ShowMessage(username: username,);
                  })
              );
            },color: Colors.brown,height:100,child:Text("Received messages",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black)))],
        ),
      ),
    );
  }

}
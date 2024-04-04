import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'chat.dart';
import 'repeated.dart';

class Chatapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Chat name1=new Chat("filo","hi","13:5","assets/images/man1.jpeg");
    Chat name2=new Chat("filo2","hhello","12:9","assets/images/download.jpg");
    Chat name3=new Chat("filo1","how are you","13:4","assets/images/man1.jpeg");
    Chat name4=new Chat("filo3","eh el a5bar","13:23","assets/images/man2.png");
    Chat name5=new Chat("filo4","sads","13:50","assets/images/download.jpg");
    List <Chat> chats=[name1,name2,name3,name4,name5];
    return Scaffold(
        appBar: AppBar(
        actions: [
        Icon(Icons.add_chart_sharp),
    SizedBox(width:15),
    Icon(Icons.add)
    ],
    backgroundColor: Colors.blue,
    title:Text("chatapp"),
    centerTitle:true ,
        ),
      drawer:menu(context),
    body:Container(height:double.infinity,
      width:double.infinity,
      color:Colors.grey,
    child:Column(children: [
      Container(color: Colors.black26,
        child: SingleChildScrollView(
          scrollDirection:Axis.horizontal ,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(children:[Columnapp("Filo"),Columnapp("masd"),Columnapp("asdas"),Columnapp("asdas"),Columnapp("asdas")]
    ),
          ),
        ),
      ),
      for(int i=0;i<chats.length;i++)
      Rowlist(chats[i],context),
       ],
   ),),
    );
  }
}
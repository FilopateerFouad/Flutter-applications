import "package:flutter/material.dart";
import "chat.dart";
class Chatdetails extends StatelessWidget{
  late Chat chat;
  Chatdetails({required this.chat});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(chat.name,style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black)),
      leading: CircleAvatar(
        backgroundImage: AssetImage(chat.image),
      ),
      ),
    );
  }

}
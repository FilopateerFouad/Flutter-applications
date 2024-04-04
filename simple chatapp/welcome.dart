import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_app/chatapp/login.dart';
class Welcome extends StatefulWidget{
  @override
  _WelcomeState createState() => _WelcomeState();
}
class _WelcomeState extends State<Welcome> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (cp){
            return login();
          })
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(decoration:BoxDecoration(image: DecorationImage(image:AssetImage("assets/images/chat.jpg"),fit: BoxFit.cover)),
          width: double.infinity,),
      )
    );
  }
}
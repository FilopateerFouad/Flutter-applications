import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_app/myproject/login.dart';
class Welcome1 extends StatefulWidget{
  @override
  _WelcomeState createState() => _WelcomeState();
}
class _WelcomeState extends State<Welcome1> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (cp){
            return Login();
          })
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: Container(decoration:BoxDecoration(image: DecorationImage(image:AssetImage("assets/images/companylogo.png"),fit: BoxFit.cover)),
            width: double.infinity,),
        )
    );
  }
}
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:flutter_app/chatapp/Chatapp.dart';
import 'package:flutter_app/chatapp/updatePassword.dart';
import 'package:flutter_app/database/apptest.dart';
import 'package:flutter_app/database/userTable.dart';
class login extends StatefulWidget{
  @override
  _loginState createState() => _loginState();
}
class _loginState extends State<login> {
  TextEditingController username=TextEditingController();

  TextEditingController password=TextEditingController();
  late UserTable userTable=UserTable();
  void initState(){
    super.initState();
    userTable.createData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Login"),),
      body:Container(
          decoration:BoxDecoration(image: DecorationImage(image:AssetImage("assets/images/logoback.jpg"),fit: BoxFit.cover),),
          width: double.infinity,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Username:",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black)),
            ),
          TextFormField(controller:username,decoration: InputDecoration(fillColor: Colors.grey,filled:true,
            border:OutlineInputBorder(borderRadius:BorderRadius.circular(40)),
          labelText: "Username",hintText: "enter your username",suffixIcon: Icon(Icons.email)),),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Password:",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black)),
            ),
          TextFormField(obscureText: true,controller: password,decoration: InputDecoration(fillColor: Colors.grey,filled: true,
              border:OutlineInputBorder(borderRadius:BorderRadius.circular(40)),
              labelText: "Password",hintText: "enter your password",suffixIcon: Icon(Icons.remove_red_eye_outlined)))
          ,Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[ MaterialButton(onPressed: (){
              for(int i=0;i<userTable.users.length;i++){
                if(username.text==userTable.users[i]["username"].toString()&&password.text==userTable.users[i]["password"].toString()){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (cp){
                        return Chatapp();
                      }));
                }
              }
    },child: Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),color: Colors.blue,),
         MaterialButton(onPressed:(){
           Navigator.of(context).push(
               MaterialPageRoute(builder: (cp){
                 return Update(userTable:userTable);
               }));
         },child:Text("Forget password",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),color: Colors.blue,)]),
            Row(children: [Text("to create a new account",style: TextStyle(fontSize: 25,color: Colors.black)),
                TextButton(onPressed:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (cp){
                        return Userdata();
                      }));
                }, child: Text("Click here",style: TextStyle(fontSize: 18,color: Colors.red)))],)
          ],),
        )

    );
  }
}
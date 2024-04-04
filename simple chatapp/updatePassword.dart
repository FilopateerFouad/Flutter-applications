import 'package:flutter/material.dart';
import 'package:flutter_app/database/showData.dart';
import 'package:flutter_app/database/userTable.dart';
class Update extends StatelessWidget{
  @override
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  late UserTable userTable=UserTable();
  Update({required this.userTable});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Forget password"),),
      body: Container(
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
    , MaterialButton(onPressed:() async {
      userTable.updateData(password.text, username.text);
      userTable.users=await userTable.showData(userTable.db);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (cp){
            return Show(userTable: userTable);
          }));
      },child:Text("update password",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),color: Colors.blue,)
    ,MaterialButton(onPressed:() async {
        userTable.deleteData(username.text);
        userTable.users=await userTable.showData(userTable.db);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (cp){
              return Show(userTable: userTable);
            }));
      },child:Text("Delete account",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),color: Colors.blue,)
    ])));
  }
}
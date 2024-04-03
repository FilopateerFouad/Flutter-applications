import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'client/client.dart';
import 'employee/employee.dart';
import 'mydatabase/applogic.dart';
import 'mydatabase/appstate.dart';
class Log extends StatelessWidget{
  String name,icon;
  Log({required this.name,required this.icon});
  @override
  Widget build(BuildContext context) {
    TextEditingController username=TextEditingController();
    TextEditingController password=TextEditingController();
    return BlocProvider(create: (context) =>
    AppLogic()..createData(),
    child: BlocConsumer<AppLogic, AppState>(
    listener: (context, state) {},
    builder: (context, state) {
    AppLogic data = BlocProvider.of(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children:[ Container(
            color:Colors.grey,
            width: double.infinity,
            child:Column(
              children: [Padding(
                padding: const EdgeInsets.only(top:100.0,bottom:85,left:20),
                child: Row(children: [Text("Welcome $name ",style: TextStyle(color:Colors.black,fontSize: 32,fontWeight: FontWeight.bold)),
                  CircleAvatar(radius: 30,backgroundImage: AssetImage(icon),)
                ],),
              ),
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
                ,Padding(
                  padding: const EdgeInsets.only(top:40.0,right:15.0),
                  child: Center(
                    child: MaterialButton(onPressed:(){
                       if(name=="Employee") {
                         for (int i = 0; i < AppLogic.admin_users.length; i++) {
          if (password.text ==AppLogic.admin_users[i]["password"].toString() &&AppLogic.admin_users[i]["username"] == username.text&&AppLogic.admin_users[i]["type"].toString()=="employee")
                  Navigator.of(context).push(
                MaterialPageRoute(builder: (cp) {
                return Employee(name:username.text,email:AppLogic.admin_users[i]["email"]);
                })
                );}}
                      if(name=="Client") {
                  for (int i = 0; i < AppLogic.client_users.length; i++) {
                  if(password.text == AppLogic.client_users[i]["password"] &&AppLogic.client_users[i]["username"] == username.text)
                Navigator.of(context).push(
              MaterialPageRoute(builder: (cp) {
                return Client(name: username.text,email:AppLogic.client_users[i]["email"]);
              })
          );
    }}},color: Colors.blueGrey,height:60,child:Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white))),
                  ),
                )],)
        ),
      ]),
    );
    }));
  }

}
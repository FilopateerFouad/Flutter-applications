import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/admin/signup.dart';
import 'package:flutter_app/myproject/mydatabase/applogic.dart';
import 'package:flutter_app/myproject/mydatabase/appstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'admin.dart';
class AdminLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController username=TextEditingController();
    TextEditingController password=TextEditingController();
    return BlocProvider(create:(context)=>AppLogic()..createData(),
    child: BlocConsumer<AppLogic,AppState>(
    listener: (context,state){},
    builder: (context,state){
      AppLogic data=BlocProvider.of(context);
      return Scaffold(
        body: Container(
            color:Colors.grey,
            width: double.infinity,
            child:ListView(
              children:[ Column(
                children: [Padding(
                  padding: const EdgeInsets.only(top:100.0,bottom:85,left:20),
                  child: Row(children: [Text("Welcome Admin ",style: TextStyle(color:Colors.black,fontSize: 32,fontWeight: FontWeight.bold)),
                    CircleAvatar(radius: 30,backgroundImage: AssetImage("assets/images/Admin.jpg"),)
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
                    padding: const EdgeInsets.only(top:40.0,right:15.0,bottom: 20),
                    child: Center(
                      child: MaterialButton(onPressed:(){
                        for(int i=0;i<AppLogic.admin_users.length;i++){
                          if(username.text==AppLogic.admin_users[i]["username"].toString()&&password.text==AppLogic.admin_users[i]["password"].toString()&&AppLogic.admin_users[i]["type"].toString()=="admin"){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (cp) {
                                  return Admin(name:username.text,email:AppLogic.admin_users[i]["email"].toString());
                                })
                            );
                          }
                        }

                      },color: Colors.blueGrey,height:60,child:Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white))),
                    ),
                  ),
                  Row(children: [Text("to create a new account",style: TextStyle(fontSize: 25,color: Colors.black)),
                    TextButton(onPressed:(){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (cp){
                            return Signup();
                          }));
                    }, child: Text("Click here",style: TextStyle(fontSize: 18,color: Colors.red)))],)],),
           ] )
        ),
      );
    },
    ));
  }

}
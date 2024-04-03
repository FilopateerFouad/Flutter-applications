import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/employee/mysalary.dart';
import 'package:flutter_app/myproject/mydatabase/applogic.dart';
import 'package:flutter_app/myproject/mydatabase/appstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'financialAdmin.dart';
class FinancialPass extends StatelessWidget{
  String username='';
  FinancialPass({required this.username});
  @override
  Widget build(BuildContext context) {
    TextEditingController password=TextEditingController();
    return BlocProvider(create:(context)=>AppLogic()..createData(),
        child: BlocConsumer<AppLogic,AppState>(
            listener: (context,state){},
            builder: (context,state){
              AppLogic data=BlocProvider.of(context);
              return Scaffold(
                body: Container(
                  color: Colors.grey,
                  child: Column(
                      children:[ Padding(
                        padding: const EdgeInsets.only(top: 150.0,bottom: 50,left: 20,right: 20),
                        child: Row(children: [Text("enter password ",style:TextStyle(fontWeight: FontWeight.bold,fontSize:25,color: Colors.black)),
                          Expanded(child:TextFormField(obscureText: true,controller:password,decoration: InputDecoration(fillColor: Colors.grey,filled:true,
                              border:OutlineInputBorder(borderRadius:BorderRadius.circular(40)),
                              labelText: "Password",hintText:"enter password" ,suffixIcon: Icon(Icons.remove_red_eye_rounded))))],
                        ),
                      ),
                        MaterialButton(onPressed:() {
                          for (int i = 0; i < AppLogic.admin_users.length; i++) {
                            if (password.text == AppLogic.admin_users[i]["password"] &&
                                AppLogic.admin_users[i]["username"] == "filo")
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (cp) {
                                      return AdminMon();
                                    })
                                );
                              }
                          }
                        ,height: 70,minWidth: 120,color: Colors.blueGrey,child: Text("Enter ",style:TextStyle(fontWeight: FontWeight.bold,fontSize:30,color: Colors.white),))
                        ,Padding(
                          padding: const EdgeInsets.only(top:50),
                          child: MaterialButton(onPressed:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (cp) {
                                  return EmpSalary(name:username);
                                })
                            );
                          },color: Colors.brown,height:50,child:Text("see my salary",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black))),
                        )]),
                ),
              );
            }));
  }

}
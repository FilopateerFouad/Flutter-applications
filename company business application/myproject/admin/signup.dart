import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/mydatabase/applogic.dart';
import 'package:flutter_app/myproject/mydatabase/appstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repeated.dart';
class Signup extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController username=TextEditingController();
    TextEditingController password=TextEditingController();
    TextEditingController fullname=TextEditingController();
    TextEditingController address=TextEditingController();
    TextEditingController age=TextEditingController();
    TextEditingController email=TextEditingController();
    TextEditingController mobile=TextEditingController();
    TextEditingController salary=TextEditingController();
   return BlocProvider(create:(context)=>AppLogic()..createData(),
    child: BlocConsumer<AppLogic,AppState>(
    listener: (context,state){},
    builder: (context,state){
    AppLogic data=BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("New Account"),centerTitle: true,backgroundColor: Colors.black54,),
      backgroundColor: Colors.grey,
      body: ListView(
        children:[
          Padding(
            padding: const EdgeInsets.only(left: 20.0), child:Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 15),
                  child: RowAccount( context, "Username", Icons.account_circle,username),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: RowAccount( context, "Password", Icons.remove_red_eye_rounded,password),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: RowAccount( context, "Full name", Icons.account_box_outlined,fullname),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: RowAccount( context, "Address", Icons.home,address),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: RowAccount( context, "Age", Icons.accessibility_outlined,age),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: RowAccount( context, "Email", Icons.email, email),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: RowAccount( context, "Mobile", Icons.mobile_friendly_outlined,mobile),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: RowAccount( context, "Salary", Icons.money_off_csred_outlined,salary),
                ),
                MaterialButton(onPressed:(){
                  data.Admin_insertData(username.text, password.text, fullname.text, address.text, int.parse(age.text), email.text, mobile.text, int.parse(salary.text),0, "admin");
                },color: Colors.blueGrey,height:60,child:Text("Sign up",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)))
              ],),
            ),
      ]),
    );
    }));
  }

}
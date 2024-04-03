import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/repeated.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'mydatabase/applogic.dart';
import 'mydatabase/appstate.dart';
class Myaccount extends StatelessWidget{
  String username1='';
  Myaccount({required this.username1});
  @override
  Widget build(BuildContext context) {
    TextEditingController password=TextEditingController();
    TextEditingController fullname=TextEditingController();
    TextEditingController address=TextEditingController();
    TextEditingController age=TextEditingController();
    TextEditingController email=TextEditingController();
    TextEditingController telephone=TextEditingController();
    String s1='',s2='',s3='',s4='',s5='',s6='',s7='';
    return BlocProvider(create: (context) =>
    AppLogic()..createData(),
    child: BlocConsumer<AppLogic, AppState>(
    listener: (context, state) {},
    builder: (context, state) {
      AppLogic data = BlocProvider.of(context);
      for(int i=0;i<AppLogic.admin_users.length;i++){
        if(username1==AppLogic.admin_users[i]['username'].toString()){
          password.text=AppLogic.admin_users[i]['password'].toString();
          fullname.text=AppLogic.admin_users[i]['fullname'].toString();
          address.text=AppLogic.admin_users[i]['address'].toString();
          age.text=AppLogic.admin_users[i]['age'].toString();
          email.text=AppLogic.admin_users[i]['email'].toString();
          telephone.text=AppLogic.admin_users[i]['mobile'].toString();
          s2=password.text;
          s3=fullname.text;
          s4=address.text;
          s5=age.text;
          s6=email.text;
          s7=telephone.text;
        }
      }
      return Scaffold(
        appBar:AppBar(
          title: Text("My Account"),
          backgroundColor: Colors.black54,
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body:
           ListView(
             children:[ Padding(
               padding: const EdgeInsets.only(left: 10.0),
               child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  child: Row( children:[Text("Username\t\t\t\t",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                    Text("$username1",style: TextStyle(color: Colors.black,fontSize: 18))]),
                ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: RowAccount( context, "Password", Icons.remove_red_eye_rounded,password),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: RowAccount( context, "Full name", Icons.account_box_outlined,fullname),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: RowAccount( context, "Address", Icons.home,address),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: RowAccount( context, "Age", Icons.accessibility_outlined,age),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: RowAccount( context, "Email", Icons.email, email),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: RowAccount( context, "Mobile", Icons.mobile_friendly_outlined,telephone),
                  ),
                  MaterialButton(onPressed:(){
                    if(s2!=password.text)
                      data.updateAdminData(password.text,username1,"password");
                    if(s3!=fullname.text)
                      data.updateAdminData(fullname.text,username1,"fullname");
                    if(s4!=address.text)
                      data.updateAdminData(address.text,username1,"address");
                    if(s5!=age.text)
                      data.updateAdminData(age.text,username1,"age");
                    if(s6!=email.text)
                      data.updateAdminData(email.text,username1,"email");
                    if(s7!=telephone.text)
                      data.updateAdminData(telephone.text,username1,"mobile");
                  },color: Colors.brown,height:30,child:Text("Update",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black)))
                ],
          ),
             ),
           ]),
        );
  }));
  }

}
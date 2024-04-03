import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/mydatabase/applogic.dart';
import 'package:flutter_app/myproject/mydatabase/appstate.dart';
import 'package:flutter_app/myproject/repeated.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ClientAcc extends StatelessWidget{
  String username1;
  ClientAcc({required this.username1});
  @override
  Widget build(BuildContext context) {
    TextEditingController password=TextEditingController();
    TextEditingController companyname=TextEditingController();
    TextEditingController address=TextEditingController();
    TextEditingController email=TextEditingController();
    TextEditingController telephone=TextEditingController();
    String s1='',s2='',s3='',s4='',s5='',s6='',s7='';
    return BlocProvider(create:(context)=>AppLogic()..createData(),
    child: BlocConsumer<AppLogic,AppState>(
    listener: (context,state){},
    builder: (context,state){
    AppLogic data=BlocProvider.of(context);
    for(int i=0;i<AppLogic.client_users.length;i++){
    if(username1==AppLogic.client_users[i]['username'].toString()) {
      password.text = AppLogic.client_users[i]['password'].toString();
      companyname.text = AppLogic.client_users[i]['companyname'].toString();
      address.text = AppLogic.client_users[i]['address'].toString();
      email.text = AppLogic.client_users[i]['email'].toString();
      telephone.text = AppLogic.client_users[i]['mobile'].toString();
      s2 = password.text;
      s3 = companyname.text;
      s4 = address.text;
      s5 = email.text;
      s6 = telephone.text;
    }
    }
    return Scaffold(
      appBar: AppBar(title: Text("My account"),centerTitle: true,
        backgroundColor: Colors.black54,),
      body: Container(
        width: double.infinity,
        color: Colors.grey,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ Row( children:[Text("Username\t\t\t",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
            Text("$username1",style: TextStyle(color: Colors.black,fontSize: 18))]),
            RowAccount( context, "Password", Icons.remove_red_eye_rounded,password),
            RowAccount( context, "Company's name", Icons.account_circle,companyname),
            RowAccount( context, "Address", Icons.place,address),
            RowAccount( context, "Email", Icons.email, email),
            RowAccount( context, "Mobile", Icons.mobile_friendly_outlined,telephone)
            ,MaterialButton(onPressed:(){
              if(s2!=password.text)
                data.updateClientData(password.text,username1,"password");
              if(s3!=companyname.text)
                data.updateClientData(companyname.text,username1,"companyname");
              if(s4!=address.text)
                data.updateClientData(address.text,username1,"address");
              if(s5!=email.text)
                data.updateClientData(email.text,username1,"email");
              if(s6!=telephone.text)
                data.updateClientData(telephone.text,username1,"mobile");
            },color: Colors.brown,height:30,child:Text("Update",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black)))
          ],
        ),
      ),
    );
    }));
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/mydatabase/applogic.dart';
import 'package:flutter_app/myproject/mydatabase/appstate.dart';
import 'package:flutter_app/myproject/repeated.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EditClient extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController username=TextEditingController();
    TextEditingController password=TextEditingController();
    TextEditingController companyname=TextEditingController();
    TextEditingController address=TextEditingController();
    TextEditingController date=TextEditingController();
    TextEditingController email=TextEditingController();
    TextEditingController mobile=TextEditingController();
    TextEditingController time=TextEditingController();
    return BlocProvider(create:(context)=>AppLogic()..createData(),
    child: BlocConsumer<AppLogic,AppState>(
    listener: (context,state){},
    builder: (context,state){
    AppLogic data=BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(title:Text("edit Client"),
          backgroundColor: Colors.black54,
          centerTitle:true),
      backgroundColor: Colors.grey,
      body: ListView(
        children:[ Padding(
            padding: const EdgeInsets.only(top: 10.0,left: 10),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
              Column( mainAxisAlignment:MainAxisAlignment.spaceAround,children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(onTap:(){
                      data.Client_insertData(username.text, password.text, companyname.text, address.text,date.text,time.text, email.text, mobile.text);
                    },child:CircleAvatar(radius: 25,backgroundImage:AssetImage("assets/images/add.png"),)),
                    InkWell(onTap:(){
                      data.Client_delete(username.text);
                    },child:CircleAvatar(radius:25,backgroundImage:AssetImage("assets/images/delete.jpg"))),
                  ],),
                Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children:[Text("  Add",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.brown),),
                      Text("   Delete",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.brown),),
                    ]),
                  ),
              ],)
              ,Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(children:[Expanded(child:TextFormField(controller:username,decoration: InputDecoration(fillColor: Colors.grey,filled:true,
                    border:OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
                    labelText: "Username",suffixIcon: Icon(Icons.account_circle)))),InkWell(onTap: (){
                  for(int i=0;i<AppLogic.client_users.length;i++){
                    if(username.text==AppLogic.client_users[i]["username"].toString()){
                      password.text=AppLogic.client_users[i]["password"].toString();
                      companyname.text=AppLogic.client_users[i]["companyname"].toString();
                      address.text=AppLogic.client_users[i]["address"].toString();
                      date.text=AppLogic.client_users[i]["date"].toString();
                      time.text=AppLogic.client_users[i]["duration"].toString();
                      email.text=AppLogic.client_users[i]["email"].toString();
                      mobile.text=AppLogic.client_users[i]["mobile"].toString();
                    }
                  }
                },child:CircleAvatar(radius: 25,backgroundColor: Colors.grey,backgroundImage:AssetImage("assets/images/search.png")))]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: RowAccount( context, "Username", Icons.account_circle,username),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: RowAccount( context, "Password", Icons.remove_red_eye_rounded,password),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: RowAccount( context, "Company's name", Icons.account_box_outlined,companyname),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: RowAccount( context, "Address", Icons.place,address),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: RowAccount( context, "Date", Icons.calendar_today_sharp,date),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: RowAccount( context, "Duration", Icons.timer_sharp,time),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: RowAccount( context, "Email", Icons.email, email),
              ),
              RowAccount( context, "Mobile", Icons.mobile_friendly_outlined,mobile)
            ],),
          ),
      ]),
      );}));
  }

}
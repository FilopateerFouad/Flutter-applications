import 'package:flutter/material.dart';
import 'package:flutter_app/chatapp/login.dart';

import 'chat.dart';
import 'chatdetails.dart';
Widget circle()=>CircleAvatar(radius: 20,backgroundColor: Colors.blueAccent,);
Widget circlechat(String s4)=>CircleAvatar(radius: 20,backgroundColor: Colors.blueAccent,backgroundImage: AssetImage( s4),);
Widget Columnapp(String s)
=>Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [circle(),Text(s,style: TextStyle(color:Colors.black,fontSize: 20,))],),
  ),
);
Widget Columnchat(String s1,String s2)=>
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text(s1,style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),Text(s2,style: TextStyle(color:Colors.black,fontSize: 20,))],),
    );
Widget Rowline(Chat c,BuildContext context)
=>InkWell(
  onTap:(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (cp){
        return Chatdetails(chat:c);
    })
    );
  } ,
  child:Row(children: [Expanded(child: Row(children:[circlechat(c.image),

    Columnchat(c.name,c.type)])),

    Text(c.time,textAlign:TextAlign.end,)],),
);
Widget Rowlist(Chat c,BuildContext context)=>
    Card(
      color: Colors.white24,
      shadowColor: Colors.brown,
      elevation: 5,
      child: ListTile(
        onTap:(){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (cp){
                return Chatdetails(chat:c);
              })
          );
        } ,
        title:Text(c.name,style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
        subtitle: Text(c.type,style: TextStyle(color:Colors.black,fontSize: 20,)),
        leading: CircleAvatar(radius: 20,backgroundColor: Colors.blueAccent,backgroundImage: AssetImage(c.image),),
        trailing: Text(c.time,style: TextStyle(color:Colors.black,fontSize: 18,)),
      ),
    );
Widget menu(BuildContext context)=>
    Drawer(child:SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.grey,
        child: Column(
          children: [UserAccountsDrawerHeader(accountName: Text("filo",style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
              accountEmail: Text("filofouad@gmail.com",style: TextStyle(color:Colors.black,fontSize: 20)),currentAccountPicture:CircleAvatar(radius: 20,backgroundColor: Colors.blueAccent,backgroundImage: AssetImage("assets/images/chat.jpg"),) ,)
            ,Card(
            color: Colors.blueGrey,
            child: ListTile(
              title: Text("My account",style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
            ),
          ),Divider(
              color:Colors.black,
              thickness: 3,
            )
            ,Card(
              color: Colors.blueGrey,
              child: ListTile(
                onTap:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (cp){
                        return login();
                      })
                  );
                } ,
                title: Text("Log out",style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
              ),
            )],
        ),
      ),
    ),
    );

import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/employee/emptasks.dart';
import 'package:flutter_app/myproject/messaging.dart';
import 'package:flutter_app/myproject/repeated.dart';
class Client extends StatelessWidget{
  String name='',email;
  Client({required this.name,required this.email});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Client"),
       centerTitle: true,backgroundColor: Colors.black54,
     ),
     drawer: menu(context,"client","client.png",name,email),
     body: Container(
       width: double.infinity,
       color: Colors.grey,
       child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [Card(
         color: Colors.amber,
         shadowColor:Colors.brown,
         elevation: 10,
         child: ListTile(onTap: (){
           Navigator.of(context).push(
               MaterialPageRoute(builder: (cp) {
                 return EmpTask1(name: name, type:"deal");
               })
           );
         },
             title: Text("My Deals",style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
             leading:CircleAvatar(radius: 35,backgroundImage: AssetImage("assets/images/deals.png"),) ),
       ),
         Card(
           color: Colors.amber,
           shadowColor:Colors.brown,
           elevation: 10,
           child: ListTile(onTap: (){
             Navigator.of(context).push(
                 MaterialPageRoute(builder: (cp) {
                   return Messages(username: name);
                 })
             );
           },
               title: Text("Messages",style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
               leading:CircleAvatar(radius: 35,backgroundImage: AssetImage("assets/images/messaging.png"),) ),
         ),
         Card(
           color: Colors.amber,
           shadowColor:Colors.brown,
           elevation: 10,
           child: ListTile(
               title: Text("Contact with us",style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
               leading:CircleAvatar(radius: 35,backgroundImage: AssetImage("assets/images/contact.jpg"),),
           subtitle: Text("Our phone :01245674321",style: TextStyle(fontSize: 18,color: Colors.black),),),
         )],),
     ),
   );
  }
}
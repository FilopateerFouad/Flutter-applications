import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../repeated.dart';
class Admin extends StatelessWidget{
  String name='',email;
  Admin({required this.name,required this.email});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Admin"),
       centerTitle: true,backgroundColor: Colors.black54,
     ),
     drawer: menu(context,"Admin","Admin.jpg",name,email),
     body: Container(
       color: Colors.grey,
       child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         CardAdmin( context,"Admin","assets/images/Admin.jpg",name),
         CardAdmin( context,"Employee","assets/images/employee.jpg",name),
         CardAdmin( context, "Client", "assets/images/client.png",name),
         CardAdmin(context, "Employee's tasks","assets/images/tasks.png",name),
         CardAdmin( context,"Client's deals","assets/images/deals.png",name),
         CardAdmin( context,"Financial","assets/images/money.png",name),
         CardAdmin( context,"Messages","assets/images/messaging.png",name),
       ],),
     ),
   );
  }
}
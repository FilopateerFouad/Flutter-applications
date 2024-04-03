import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/repeated.dart';
class Employee extends StatelessWidget {
  String name='',email;
  Employee({required this.name,required this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee"),
        centerTitle: true,backgroundColor: Colors.black54,
      ),
      drawer: menu(context,"Employee","employee.jpg",name,email),
      body:Container(
          color: Colors.grey,
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CardEmployee( context,"My Tasks","assets/images/tasks.png",name),
            CardEmployee( context,"Messages","assets/images/messaging.png",name),
            CardEmployee( context,"My Salary","assets/images/money.png",name),
            CardEmployee( context,"My Offers","assets/images/offers.png",name),
          ],),
        ),
    );
  }
}

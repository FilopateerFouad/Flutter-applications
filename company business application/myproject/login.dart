import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/admin/adminlogin.dart';
import 'package:flutter_app/myproject/repeated.dart';
import 'package:flutter_app/myproject/signin.dart';
class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.grey,
          child: Column(
            children: [
               Padding(
                 padding: const EdgeInsets.only(top: 100.0),
                 child: Center(child: Text("Welcome to our company",style: TextStyle(color:Colors.black,fontSize: 28,fontWeight: FontWeight.bold))),
               ),
            
                 Padding(
                   padding: const EdgeInsets.only(top:100,left:15),
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                    MaterialButton(onPressed:(){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (cp){
                            return AdminLogin();
                          })
                      );
                    },color: Colors.red,height: 120,child:Text("Admin",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white))),
                       MaterialButton(onPressed:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (cp){
                              return Log(name:"Employee",icon:"assets/images/employee.jpg");
                            })
                        );
                      },color: Colors.blue,height:120 ,child:Text("Employee",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white))),
                ],),
                 ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,right: 25.0),
                child: MaterialButton(onPressed:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (cp){
                        return Log(name:"Client",icon:"assets/images/client.png");
                      })
                  );
                },color: Colors.amberAccent,height:120 ,child:Text("Client",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white))),
              )],
          ),
        ),
      );
      
  }
  
}
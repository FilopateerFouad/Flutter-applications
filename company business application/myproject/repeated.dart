import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/admin/financialpass.dart';
import 'package:flutter_app/myproject/employee/empoffers.dart';
import 'package:flutter_app/myproject/messaging.dart';
import 'client/clientAccount.dart';
import 'admin/editclient.dart';
import 'package:flutter_app/myproject/myaccount.dart';
import 'admin/adminpass.dart';
import 'admin/editempandadm.dart';
import 'admin/employeetasks.dart';
import 'employee/emptasks.dart';
import 'employee/mysalary.dart';
import 'login.dart';
Widget menu(BuildContext context,String name,String icon,String username,String email)=>
    Drawer(child:SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.grey,
        child: Column(
          children: [UserAccountsDrawerHeader(accountName: Text(username,style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
            accountEmail: Text(email,style: TextStyle(color:Colors.black,fontSize: 20)),currentAccountPicture:CircleAvatar(radius: 20,backgroundColor: Colors.blue,backgroundImage: AssetImage("assets/images/$icon"),) ,)
            ,Card(
              color: Colors.blueGrey,
              shadowColor:Colors.black,
              elevation: 5,
              child: ListTile(
                onTap:(){
                  if(name=="Admin"||name=="Employee") {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (cp) {
                          return Myaccount(username1:username);
                        })
                    );
                  }
                  else
                    {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (cp) {
                            return ClientAcc(username1:username);
                          })
                      );
                    }
                }
                ,title: Text("My account",style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
              ),
            ),Divider(
              color:Colors.black,
              thickness: 3,
            )
            ,Card(
              color: Colors.blueGrey,
              shadowColor:Colors.black,
              elevation: 5,
              child: ListTile(
                onTap:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (cp){
                        return Login();
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
Widget RowAccount(BuildContext context,String name,IconData icon,TextEditingController control)=>
    Row(children: [Text("$name:  ",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.black)),
      Expanded(child:TextFormField(controller:control,decoration: InputDecoration(fillColor: Colors.grey,filled:true,
          border:OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
          labelText: "$name",suffixIcon: Icon(icon))))],
    );
Widget CardAdmin (BuildContext context,String title,String icon,String username)=>
    Card(
      color: Colors.teal,
      shadowColor:Colors.red,
      elevation: 10,
      child: ListTile(
        onTap:(){
          if(title=="Admin"){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (cp) {
                  return Adminpass(username: username);
                })
            );
          }
          if(title=="Employee") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (cp) {
                  return EditAdminandEmp(name:"employee");
                })
            );
          }
          if(title=="Employee's tasks") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (cp) {
                  return EmpTasks(name: "Employee",type: "task");
                })
            );
          }
          if(title=="Client") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (cp) {
                  return EditClient();
                })
            );
          }
          if(title=="Client's deals") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (cp) {
                  return EmpTasks(name: "Client",type: "deal");
                })
            );
          }
          if(title=="Financial") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (cp) {
                  return FinancialPass(username:username);
                })
            );
          }
          if(title=="Messages"){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (cp) {
                  return Messages(username:username);
                })
            );
          }
        }
        ,title: Text("$title",style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
      leading:CircleAvatar(radius: 35,backgroundImage: AssetImage(icon),) ),
    );
Widget AddandDelete()=>Column( mainAxisAlignment:MainAxisAlignment.spaceAround,children: [
  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [CircleAvatar(radius: 25,backgroundImage:AssetImage("assets/images/add.png"),),
      CircleAvatar(radius:25,backgroundImage:AssetImage("assets/images/delete.jpg")),
    ],),
  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children:[Text("  Add",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.brown),),
    Text("   Delete",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.brown),),
  ])
],);
Widget Search(TextEditingController control)=>
    Row(children:[Expanded(child:TextFormField(controller:control,decoration: InputDecoration(fillColor: Colors.grey,filled:true,
      border:OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
      labelText: "Username",suffixIcon: Icon(Icons.account_circle)))),CircleAvatar(radius: 25,backgroundColor: Colors.grey,backgroundImage:AssetImage("assets/images/search.png"))]);
Widget CardEmployee (BuildContext context,String title,String icon,String name)=>
    Card(
      color: Colors.blueAccent,
      shadowColor:Colors.yellowAccent,
      elevation: 10,
      child: ListTile(
          onTap:(){
            if(title=="My Tasks"){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (cp) {
                    return EmpTask1(name:name,type: "task");
                  })
              );
            }
            if(title=="My Salary"){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (cp) {
                    return EmpSalary(name:name,);
                  })
              );
            }
            if(title=="My Offers"){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (cp) {
                    return EmpOffers();
                  })
              );
            }
            if(title=="Messages"){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (cp) {
                    return Messages(username: name);
                  })
              );
            }
          }
          ,title: Text("$title",style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
          leading:CircleAvatar(radius: 35,backgroundImage: AssetImage(icon),) ),
    );
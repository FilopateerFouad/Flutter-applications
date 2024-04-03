import 'package:flutter/material.dart';
import 'package:flutter_app/myproject/mydatabase/applogic.dart';
import 'package:flutter_app/myproject/mydatabase/appstate.dart';
import 'package:flutter_app/myproject/repeated.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EditAdminandEmp extends StatelessWidget{
  String name;
  EditAdminandEmp({required this.name});
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
      backgroundColor: Colors.grey,
      appBar: AppBar(title:Text("edit $name"),
          backgroundColor: Colors.black54,
          centerTitle:true),
      body: ListView(
        children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0,top: 10.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Column( mainAxisAlignment:MainAxisAlignment.spaceAround,children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(onTap:(){
                      data.Admin_insertData(username.text, password.text, fullname.text, address.text, int.parse(age.text), email.text, mobile.text, int.parse(salary.text),0, name);
                      data.db.close();
                    },child:CircleAvatar(radius: 25,backgroundImage:AssetImage("assets/images/add.png"),)),
                    InkWell(onTap:(){
                      data.Admin_delete(username.text);
                      for(int i=0;i<AppLogic.tasks_users.length;i++){
                        if(username.text==AppLogic.tasks_users[i]["username"].toString())
                          data.Tasks_delete(username.text);
                      }
                      data.db.close();
                    },child:CircleAvatar(radius:25,backgroundImage:AssetImage("assets/images/delete.jpg"))),
                  ],),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children:[Text("  Add",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.brown),),
                    Text("   Delete",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.brown),),
                  ]),
                )
              ],),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(children:[Expanded(child:TextFormField(controller:username,decoration: InputDecoration(fillColor: Colors.grey,filled:true,
                      border:OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
                      labelText: "Username",suffixIcon: Icon(Icons.account_circle)))),InkWell(onTap: (){
                          for(int i=0;i<AppLogic.admin_users.length;i++){
                            if(username.text==AppLogic.admin_users[i]["username"].toString()){
                              password.text=AppLogic.admin_users[i]["password"].toString();
                              fullname.text=AppLogic.admin_users[i]["fullname"].toString();
                              address.text=AppLogic.admin_users[i]["address"].toString();
                              age.text=AppLogic.admin_users[i]["age"].toString();
                              email.text=AppLogic.admin_users[i]["email"].toString();
                              mobile.text=AppLogic.admin_users[i]["mobile"].toString();
                              salary.text=AppLogic.admin_users[i]["salary"].toString();
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
                  child: RowAccount( context, "Full name", Icons.account_box_outlined,fullname),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: RowAccount( context, "Address", Icons.home,address),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: RowAccount( context, "Age", Icons.accessibility_outlined,age),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: RowAccount( context, "Email", Icons.email, email),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: RowAccount( context, "Mobile", Icons.mobile_friendly_outlined,mobile),
                ),
                RowAccount( context, "Salary", Icons.money_off_csred_outlined,salary)
              ],),
            ),
      ]),
    );
    }));
  }

}
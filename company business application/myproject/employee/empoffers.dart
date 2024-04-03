import 'package:flutter/material.dart';
class EmpOffers extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Offers"),centerTitle: true,backgroundColor: Colors.black54,),
      body: Container(
        color: Colors.grey,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text("This company provides to our employees these offers:",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.black ),),
            Card(
              color: Colors.deepOrange,
              shadowColor:Colors.blueAccent,
              elevation: 8,
              child: ListTile(
                title: Text("20% for Amazon",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                trailing:CircleAvatar(radius: 35,backgroundImage: AssetImage("assets/images/amazon.jpg")) ,
              ),
            ),
            Card(
              color: Colors.teal,
              shadowColor:Colors.brown,
              elevation: 8,
              child: ListTile(
                title: Text("10% for seoudi",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                  trailing:CircleAvatar(radius: 35,backgroundImage: AssetImage("assets/images/seoudi.png"))
              ),
            ),
            Card(
              color: Colors.redAccent,
              shadowColor:Colors.deepPurpleAccent,
              elevation: 8,
              child: ListTile(
                title: Text("15% for any medical treatment",style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                  trailing:CircleAvatar(radius: 35,backgroundImage: AssetImage("assets/images/hospital.jpg"))
              ),
            )],),
        ),
      ),
    );
  }

}
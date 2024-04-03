import 'package:flutter_app/myproject/employee/employee.dart';
import 'package:sqflite/sqflite.dart';
class DataBase {
  late Database db;
  static List admin_users=[],client_users=[],tasks_users=[],messages_users=[],meetings_users=[];
  createData() async {
    db=(await openDatabase("project.db",
        version: 1,
        onCreate: (d,v) {
          print("database created");
          d.execute('create table admin(id integer primary key,'
              'username text,password text,fullname text,address text,age integer,email text,'
              'mobile text,salary integer,bonus integer,type text)');
          print("admin created");
          d.execute('create table client(id integer primary key,'
              'username text,password text,companyname text,address text,date text,duration text,email text,mobile text)');
          print("client created");
          d.execute('create table tasks(id integer primary key,'
              'username text,title text, body text,date text,deadline text,type text)');
          print("tasks created");
          d.execute('create table messages(id integer primary key,'
              'sender text,receiver text, body text,date text)');
          print("messages created");
          d.execute('create table meetings(id integer primary key,'
              'username text,title text,date text,time text,place text)');
          print("meeting created");
        },
      onOpen: (d)async {
        print("database opened");
        Admin_showData(d).then((value){
          admin_users=value;
        });
        Client_showData(d).then((value){
          client_users=value;
        });
        Tasks_showData(d).then((value){
          tasks_users=value;
        });
        Messages_showData(d).then((value){
          messages_users=value;
        });
        Meeting_showData(d).then((value){
          meetings_users=value;
        });
      }
    ));
  }
  Admin_insertData(String username,String pass,String fullname,String address,int age,String email,String mobile,int salary,int bonus,String type){
    db.transaction((txn)async{
      await txn.rawInsert('insert into admin(username,password,fullname,address,age,email,mobile,salary,bonus,type)'
          'values("$username","$pass","$fullname","$address","$age","$email","$mobile","$salary","$bonus","$type")').then((value){
        print("row inserted $value");
      }).onError((error, stackTrace) {
        print("error $error");
      });
    });
  }
  Client_insertData(String username,String pass,String companyname,String address,String date ,String duration,String email,String mobile){
    db.transaction((txn)async{
      await txn.rawInsert('insert into client(username,password,companyname,address,date,duration,email,mobile)'
          'values("$username","$pass","$companyname","$address","$date","$duration","$email","$mobile")').then((value){
        print("row inserted $value");
      }).onError((error, stackTrace) {
        print("error $error");
      });
    });
  }
  Task_insertData(String username,String title,String date,String deadline,String body){
    db.transaction((txn)async{
      await txn.rawInsert('insert into tasks(username,title,date,deadline,body)'
          'values("$username","$title","$date","$deadline","$body")').then((value){
        print("row inserted $value");
      }).onError((error, stackTrace) {
        print("error $error");
      });
    });
  }
  Messages_insertData(String sender,String receiver,String date,String body){
    db.transaction((txn)async{
      await txn.rawInsert('insert into tasks(sender,receiver,date,body)'
          'values("$sender","$receiver","$date","$body")').then((value){
        print("row inserted $value");
      }).onError((error, stackTrace) {
        print("error $error");
      });
    });
  }
  Meetings_insertData(String username,String title,String date,String time,String place){
    db.transaction((txn)async{
      await txn.rawInsert('insert into tasks(username,title,date,time,place)'
          'values("$username","$title","$date","$time","$place")').then((value){
        print("row inserted $value");
      }).onError((error, stackTrace) {
        print("error $error");
      });
    });
  }
  Admin_delete(String username) async {
    await db
        .rawDelete('DELETE FROM admin WHERE username = ?', [username]).then((value) {
      print("value=$value");
    });
  }
  Client_delete(String username) async {
    await db
        .rawDelete('DELETE FROM client WHERE username = ?', [username]).then((value) {
      print("value=$value");
    });
  }
  Tasks_delete(String username) async {
    await db
        .rawDelete('DELETE FROM tasks WHERE username = ?', [username]).then((value) {
      print("value=$value");
    });
  }
  Future<List<Map<String, Object?>>> Admin_showData(Database c)async{
    return await c.rawQuery("select * from admin");
  }
  Future<List<Map<String, Object?>>> Client_showData(Database c)async{
    return await c.rawQuery("select * from client");
  }
  Future<List<Map<String, Object?>>> Tasks_showData(Database c)async{
    return await c.rawQuery("select * from tasks");
  }
  Future<List<Map<String, Object?>>> Messages_showData(Database c)async{
    return await c.rawQuery("select * from messages");
  }
  Future<List<Map<String, Object?>>> Meeting_showData(Database c)async{
    return await c.rawQuery("select * from meetings");
  }
}
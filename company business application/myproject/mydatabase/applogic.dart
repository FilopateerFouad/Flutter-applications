import 'package:bloc/bloc.dart';
import 'package:flutter_app/myproject/mydatabase/appstate.dart';
import 'package:sqflite/sqflite.dart';

class AppLogic extends Cubit<AppState> {
  AppLogic() : super(InitState());
  late Database db;
  static List admin_users = [],
      client_users = [],
      tasks_users = [],
      messages_users = [],
      meetings_users = [];

  createData() async {
    openDatabase("project.db",
        version: 1,
        onCreate: (d, v) {
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
        onOpen: (d) async {
          print("database opened");
          Admin_showData(d).then((value) {
            admin_users = value;
            emit(AShowState());
          });
          Client_showData(d).then((value) {
            client_users = value;
            emit(CShowState());
          });
          Tasks_showData(d).then((value) {
            tasks_users = value;
            emit(TShowState());
          });
          Messages_showData(d).then((value) {
            messages_users = value;
            emit(MesShowState());
          });
          Meeting_showData(d).then((value) {
            meetings_users = value;
            emit(MetShowState());
          });
        }
    ).then((value) {
      db = value;
      emit(CreateState());
    });
  }

  Admin_insertData(String username, String pass, String fullname,
      String address, int age, String email, String mobile, int salary,
      int bonus, String type) {
    db.transaction((txn) async {
      await txn.rawInsert(
          'insert into admin(username,password,fullname,address,age,email,mobile,salary,bonus,type)'
              'values("$username","$pass","$fullname","$address","$age","$email","$mobile","$salary","$bonus","$type")')
          .then((value) {
        print("row inserted $value");
        emit(AInsertState());
      }).onError((error, stackTrace) {
        print("error $error");
      });
    });
  }

  Client_insertData(String username, String pass, String companyname,
      String address, String date, String duration, String email,
      String mobile) {
    db.transaction((txn) async {
      await txn.rawInsert(
          'insert into client(username,password,companyname,address,date,duration,email,mobile)'
              'values("$username","$pass","$companyname","$address","$date","$duration","$email","$mobile")')
          .then((value) {
        print("row inserted $value");
        emit(CInsertState());
      }).onError((error, stackTrace) {
        print("error $error");
      });
    });
  }

  Task_insertData(String username, String title, String date, String deadline,
      String body, String type) {
    db.transaction((txn) async {
      await txn.rawInsert(
          'insert into tasks(username,title,date,deadline,body,type)'
              'values("$username","$title","$date","$deadline","$body","$type")')
          .then((value) {
        print("row inserted $value");
        emit(TInsertState());
      }).onError((error, stackTrace) {
        print("error $error");
      });
    });
  }

  Messages_insertData(String sender, String receiver, String date,
      String body) {
    db.transaction((txn) async {
      await txn.rawInsert('insert into messages(sender,receiver,date,body)'
          'values("$sender","$receiver","$date","$body")').then((value) {
        print("row inserted $value");
        emit(MesInsertState());
      }).onError((error, stackTrace) {
        print("error $error");
      });
    });
  }

  Meetings_insertData(String username, String title, String date, String time,
      String place) {
    db.transaction((txn) async {
      await txn.rawInsert('insert into tasks(username,title,date,time,place)'
          'values("$username","$title","$date","$time","$place")').then((
          value) {
        print("row inserted $value");
        emit(MetInsertState());
      }).onError((error, stackTrace) {
        print("error $error");
      });
    });
  }

  Admin_delete(String username) async {
    await db
        .rawDelete('DELETE FROM admin WHERE username = ?', [username]).then((
        value) {
      print("value=$value");
      emit(ADeleteState());
    });
  }

  Client_delete(String username) async {
    await db
        .rawDelete('DELETE FROM client WHERE username = ?', [username]).then((
        value) {
      print("value=$value");
      emit(CDeleteState());
    });
  }

  Tasks_delete(String username) async {
    await db
        .rawDelete('DELETE FROM tasks WHERE title = ?', [username]).then((
        value) {
      print("value=true");
      emit(TDeleteState());
    });
  }
  Future<List<Map<String, Object?>>> Admin_showData(Database c) async {
    return await c.rawQuery("select * from admin");
  }

  Future<List<Map<String, Object?>>> Client_showData(Database c) async {
    return await c.rawQuery("select * from client");
  }

  Future<List<Map<String, Object?>>> Tasks_showData(Database c) async {
    return await c.rawQuery("select * from tasks");
  }

  Future<List<Map<String, Object?>>> Messages_showData(Database c) async {
    return await c.rawQuery("select * from messages");
  }

  Future<List<Map<String, Object?>>> Meeting_showData(Database c) async {
    return await c.rawQuery("select * from meetings");
  }

  List <String> showEmployeeTasks(String username,String type) {
    List <String> tasks = ["Select a $type"];
    for (int i = 0; i < AppLogic.tasks_users.length; i++) {
      if (username == AppLogic.tasks_users[i]["username"].toString()) {
        tasks.add(AppLogic.tasks_users[i]["title"].toString());
      }
    }
    emit(EmployeeTasksState());
    return tasks;
  }

  updateSalary(int s1, int s2, String s3) async {
    await db.rawUpdate(
        'UPDATE admin SET salary = ? ,bonus=? WHERE username = ?',
        [s1, s2, s3]).then((value) {
      print('updated: 1');
      emit(UpdateSalary());
    }).onError((error, stackTrace) {
      print("error,$error");
    });
  }

  updateAdminData(String s1, String s2, String s3) async {
     if (s3 == "password")
          await db.rawUpdate(
        'UPDATE admin SET password = ? WHERE username = ?',
        [s1, s2]).then((value) {
      print('updated: 2');
      emit(UpdateAdminData());
    }).onError((error, stackTrace) {
      print("error,$error");
    });
    else if (s3 == "fullname")
      await db.rawUpdate(
          'UPDATE admin SET fullname = ? WHERE username = ?',
          [s1, s2]).then((value) {
        print('updated: 3');
        emit(UpdateAdminData());
      }).onError((error, stackTrace) {
        print("error,$error");
      });
    else if (s3 == "address")
      await db.rawUpdate(
          'UPDATE admin SET address = ? WHERE username = ?',
          [s1, s2]).then((value) {
        print('updated: 4');
        emit(UpdateAdminData());
      }).onError((error, stackTrace) {
        print("error,$error");
      });
    else if (s3 == "age")
      await db.rawUpdate(
          'UPDATE admin SET age = ? WHERE username = ?',
          [int.parse(s1), s2]).then((value) {
        print('updated: 5');
        emit(UpdateAdminData());
      }).onError((error, stackTrace) {
        print("error,$error");
      });
    else if (s3 == "email")
      await db.rawUpdate(
          'UPDATE admin SET email = ? WHERE username = ?',
          [s1, s2]).then((value) {
        print('updated: 6');
        emit(UpdateAdminData());
      }).onError((error, stackTrace) {
        print("error,$error");
      });
    else if (s3 == "mobile")
      await db.rawUpdate(
          'UPDATE admin SET mobile = ? WHERE username = ?',
          [s1, s2]).then((value) {
        print('updated: 7');
        emit(UpdateAdminData());
      }).onError((error, stackTrace) {
        print("error,$error");
      });
  }
  updateClientData(String s1, String s2, String s3) async {
    if (s3 == "username")
      await db.rawUpdate(
          'UPDATE client SET username = ? WHERE password = ?',
          [s1, s2]).then((value) {
        print('updated: 1');
        emit(UpdateClientData());
      }).onError((error, stackTrace) {
        print("error,$error");
      });
    else if (s3 == "password")
      await db.rawUpdate(
          'UPDATE client SET password = ? WHERE username = ?',
          [s1, s2]).then((value) {
        print('updated: 2');
        emit(UpdateClientData());
      }).onError((error, stackTrace) {
        print("error,$error");
      });
    else if (s3 == "companyname")
      await db.rawUpdate(
          'UPDATE client SET companyname= ? WHERE username = ?',
          [s1, s2]).then((value) {
        print('updated: 3');
        emit(UpdateClientData());
      }).onError((error, stackTrace) {
        print("error,$error");
      });
    else if (s3 == "address")
      await db.rawUpdate(
          'UPDATE client SET address= ? WHERE username = ?',
          [s1, s2]).then((value) {
        print('updated: 4');
        emit(UpdateClientData());
      }).onError((error, stackTrace) {
        print("error,$error");
      });
    else if (s3 == "email")
      await db.rawUpdate(
          'UPDATE client SET email= ? WHERE username = ?',
          [s1, s2]).then((value) {
        print('updated: 5');
        emit(UpdateClientData());
      }).onError((error, stackTrace) {
        print("error,$error");
      });
    else if (s3 == "mobile")
      await db.rawUpdate(
          'UPDATE client SET mobile= ? WHERE username = ?',
          [s1, s2]).then((value) {
        print('updated: 6');
        emit(UpdateClientData());
      }).onError((error, stackTrace) {
        print("error,$error");
      });
  }
}


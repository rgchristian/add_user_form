import 'package:add_user_form/user_dialog.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserList(),
      title: 'Mobile Programming',
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  List<User> userList = [];

  @override
  Widget build(BuildContext context) {

    void addUserData(User user){
      setState(() {
        userList.add(user);
      });
    }

    void showUserDialog() {
      showDialog(context: context, builder: (_){
        return AlertDialog(
          content: AddUserDialog(addUserData),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },);
    }





    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showUserDialog,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: ListView.builder(itemBuilder: (ctx, index){
          return Card(
            margin: const EdgeInsets.all(4),
            elevation: 8,
            child: ListTile(
            title: Text(
              userList[index].username,
              style: const TextStyle(
              fontSize: 22,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w400,
            ),
            ),
            subtitle: Text(userList[index].email,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black12,
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: Text(userList[index].phoneNo,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black26,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          );
        },
          itemCount: userList.length,),
      ),
    );
  }
}


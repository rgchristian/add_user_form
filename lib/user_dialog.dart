import 'package:add_user_form/models/user.dart';
import 'package:flutter/material.dart';

class AddUserDialog extends StatefulWidget {

  final Function(User) addUser;


  const AddUserDialog(this.addUser, {super.key});

  @override
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {

  Widget buildTextField(String hint, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: TextField(
        decoration: InputDecoration(
          labelText: hint,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
        ),
        controller: controller,
      ),
    );
  }
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
      child: Column(
        children: [
          const Text('Add User', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.blueGrey,
          ),
          ),

          buildTextField('Username', usernameController),
          buildTextField('Email', emailController),
          buildTextField('Phone No', phoneNoController),
          ElevatedButton(
              onPressed: () {

                final user = User(usernameController.text, emailController.text, phoneNoController.text);

                widget.addUser(user);
                Navigator.of(context).pop();

              },
              child: const Text('Add User'),
          ),
        ],
      ),
    ));
  }
}



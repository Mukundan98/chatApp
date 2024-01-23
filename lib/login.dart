import 'package:chat_app/ChatPage.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController UsernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color.fromARGB(255, 16, 174, 192),
            Color.fromARGB(255, 230, 158, 197)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _Page(),
      ),
    );
  }

  Widget _Page() {
    return Center(
      child: Padding(
        // mainAxisAlignment: MainAxisAlignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 100,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _icon(),
            const SizedBox(height: 20),
            _inputField("Username", UsernameController),
            const SizedBox(height: 30),
            _inputbutton()
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 130,
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));

    return TextField(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  Widget _inputbutton() {
    return ElevatedButton(
      onPressed: () {
        if (UsernameController.text.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(),
            ),
          );
        } else {
          _showErrorDialog("Username cannot be empty");
        }
      },
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Enter Here",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.white,
          onPrimary: Color.fromARGB(255, 16, 174, 192),
          padding: const EdgeInsets.symmetric(vertical: 10)),
    );
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(errorMessage),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

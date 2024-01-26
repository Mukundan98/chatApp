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
            Color.fromARGB(255, 192, 107, 16),
            Color.fromARGB(255, 8, 190, 240),
             Color.fromARGB(211, 243, 30, 30)
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
          border: Border.all(color: Color.fromARGB(255, 246, 173, 4), width: 5),
          shape: BoxShape.circle),
      child: const Icon(
        Icons.person,
        color: Color.fromARGB(255, 240, 243, 237),
        size: 120,
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Color.fromARGB(255, 11, 7, 248)));

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
          primary: Color.fromARGB(255, 80, 241, 6),
          onPrimary: Color.fromARGB(241, 10, 16, 19),
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
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK",style: TextStyle(color: Colors.white),),
            )
          ],
        );
      },
    );
  }
}

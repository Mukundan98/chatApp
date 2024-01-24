import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 234, 183, 210),
          title: const Text('Chat Page'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  if (index%2==1)
                  return Padding(
  padding: EdgeInsets.all(10),
  child: Align(
    alignment: Alignment.topRight,
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green[400],
      ),
      child: Text(
        messages[index],
        style: TextStyle(),
      ),
    ),
  ),
);
                  else 
                  return Padding(
  padding: EdgeInsets.all(10),
  child: Align(
    alignment: Alignment.topLeft,
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: Text(
        messages[index],
        style: TextStyle(),
      ),
    ),
  ),
);
                  // return Container(
                  //   width: 10,
                  //   margin: EdgeInsets.only(bottom: 10),
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(20),
                  //    color: Colors.green[100],
                  // ),
                  //   alignment: Alignment.bottomLeft,
                  //   child: Text(messages[index]));
                    
                },
              ),
            ),
            Container(
              height: 60,
              color: Colors.grey[100],
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      sendMessage();
                    },
                )
              ],
            ),
          ),
        ]
        )
    );
  }

  void sendMessage() {
    String message = _messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message);
      });
      _messageController.clear();
    }
  }
}

class TextRaw extends StatelessWidget {
  final String message;

  TextRaw({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 23,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

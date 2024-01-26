import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  List<String> messages = [];

   @override
  void initState() {
    super.initState();
    getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 160, 246),
        title: const Text('Chat Page'),
      ),
      body: Container(
        color: Color.fromARGB(255, 187, 143, 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  if (index % 2 == 1)
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
                            color: Color.fromARGB(255, 242, 236, 236),
                          ),
                          child: Text(
                            messages[index],
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    );
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
          ],
        ),
      ),
    );
  }

  Future<void> sendMessage() async {
    String message = _messageController.text;
    if (message.isNotEmpty) {
      final response = await http.post(
        Uri.parse("http://127.0.0.1:8000/api/send-message"),
        body: {'message': message},
      );
  
      if (response.statusCode == 201) {
         getMessages();
      } else {
        // Handle error response
        print("Failed to send message. Status code: ${response.statusCode}");
       
      }
    }
  }


  Future<void> getMessages() async {
    try {
      final response = await http.get(Uri.parse("http://127.0.0.1:8000/api/messages"));

      if (response.statusCode == 200) {
        // If the request is successful, update the UI with the retrieved messages
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey("messages")) {
          final List<dynamic> messagesData = responseData["messages"];
          List<String> retrievedMessages = messagesData.map((item) => item['message'].toString()).toList();

          setState(() {
            messages = retrievedMessages;
            print("Messages updated: $messages");
            _messageController.clear();
          });
        } else {
          print("No messages found in the response.");
        }
      } else {
        // Handle error response
        print("Failed to get messages. Status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle other errors
      print("Error fetching messages: $e");
    }
  }



}

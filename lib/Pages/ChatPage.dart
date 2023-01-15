import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:peer_health_test/main.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  String url = 'http://127.0.0.1:8000/api?query=';
  List<types.Message> _messages = [];
  final _user = const types.User(id: 'User');
  final _server = const types.User(id: 'Server');
  String _initialMessage = "Hi! I am a chatbot that can help you find the mental health resources you need in USask. You can ask me anything. Type 'Mental health roadmap' if you want a list of questions that can point you to the resources based on your situation instead.";

  @override
  Widget build(BuildContext context) {

    _addInitialMessage();

    return Scaffold(
      appBar: AppBar(title: const Text("Mental Health Resources Helper"),),
      body: Chat(theme: MyApp.isDarkMode ? DarkChatTheme() : DefaultChatTheme() ,messages: _messages, onSendPressed: _handleSendPressed, user: _user,),
    );
  }

  Future<void> _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);

    try
    {
      var data = await fetchData(url + message.text);
      final responseMessage = types.TextMessage(
        author: _server,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: data,
      );

      _addMessage(responseMessage);
    }
    catch (e)
    {
      final errorMessage = types.TextMessage(
        author: _server,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: "Server failed to respond.",
      );
      _addMessage(errorMessage);
    }




  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  fetchData(String url) async
  {
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  void _addInitialMessage() {

    final textMessage = types.TextMessage(
      author: _server,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: _initialMessage,
    );

    _addMessage(textMessage);
  }
}

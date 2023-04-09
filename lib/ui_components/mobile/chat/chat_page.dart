import 'package:ace_hack/ui_components/common/constant.dart';
import 'package:ace_hack/ui_components/mobile/chat/threedots.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [
    const ChatMessage(
        sender: "Counsler",
        text: "You can go with some popular tools like \nFlutter\nReact"),
    const ChatMessage(sender: "Sanskar", text: "Suggest me some frontend"),
  ];

  bool _isTyping = false;
  // StreamSubscription? _subscription;

  void sendMessage() async {
    if (_controller.text.isEmpty) return;
    ChatMessage message =
        ChatMessage(sender: "Sanskar", text: _controller.text);
    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    _controller.clear();
  }

  void insertNewData(String response) {
    ChatMessage botMessage = ChatMessage(sender: "Ai", text: response);
    setState(() {
      _messages.insert(0, botMessage);
      _isTyping = false;
    });
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onSubmitted: (value) => sendMessage(),
            controller: _controller,
            decoration: const InputDecoration.collapsed(
              hintText: "Sent a message",
            ),
          ),
        ),
        IconButton(
            onPressed: () => sendMessage(),
            icon: Icon(
              Icons.send,
              color: primaryColor,
            ))
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                reverse: true,
                padding: Vx.m8,
                itemCount: _messages.length,
                itemBuilder: ((context, index) {
                  return _messages[index];
                }),
              ),
            ),
            if (_isTyping) const ThreeDots(),
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: context.cardColor),
              child: _buildTextComposer(),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

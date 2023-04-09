import 'package:ace_hack/ui_components/common/constant.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text, sender;
  const ChatMessage({
    Key? key,
    required this.sender,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: CircleAvatar(child: Text(sender[0])),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              // style: Theme.of(context).textTheme.titleMedium,
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text("$text\n"),
            )
          ],
        ))
      ],
    );
  }
}

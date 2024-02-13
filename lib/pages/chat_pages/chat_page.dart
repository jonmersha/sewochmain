import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:

      CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            title: const Text('Sewoch'),
            backgroundColor: Colors.teal[800],
            flexibleSpace: const FlexibleSpaceBar(title: Text('Sewoch'),),
          ),
          //ChatUserList(),

        ],
      ),
    );
  }
}

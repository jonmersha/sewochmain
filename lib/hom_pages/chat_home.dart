import 'package:flutter/material.dart';
import 'package:sewoch/chat_module/pages/contacts/my_contacts.dart';
import 'package:sewoch/chat_module/widgets/app_bars.dart';
import 'package:sewoch/chat_module/chat_history.dart';

class ChatHomePage extends StatelessWidget {
  const ChatHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            buildSliverAppBarChatPage(),
            const SliverFillRemaining(
              child: TabBarView(
                children: [
                  Contacts(),
                  ChatHistory(),
                  Icon(Icons.directions_bike),
                  Icon(Icons.directions_bike),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

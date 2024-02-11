import 'package:flutter/material.dart';
import 'package:sewoch/pages/chat_pages/friend_chat_screen.dart';
import 'package:sewoch/pages/chat_pages/widgets/chat_item_widget.dart';
import 'package:sewoch/user_modle.dart';

class ChatHistory extends StatefulWidget {
  const ChatHistory({super.key});

  @override
  State<ChatHistory> createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  void gotoPage(){
    setState(() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>FriendChatScreen())
      );

    });
  }
  @override
  Widget build(BuildContext context) {
    List<UserModel> userList = [
      UserModel("Yohannes Mitike", "We Have been the for longer time", false),
      UserModel("Nahome Yohannes", "I will come latter", true),
      UserModel("Abiy Mitike", "Lets go with them", false),
      UserModel("Yoseph Mitike", "prayer always tels some things ", true),
      UserModel(
          "Kefelegn Mitike", "Some of our mangers is not doing wel", false),
      UserModel("Nuhamin yohannes", "We Have been the for longer time", true),
      UserModel("Addis Negga", "We Have been the for longer time", false),
      UserModel("Nardos Yohannes", "We Have been the for longer time", true),
      UserModel("Addis Negga", "We Have been the for longer time", false),
    ];

    return Scaffold(
      body:
      CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: userList.length,
                      (BuildContext context, int index) {
                    return chatItemWidget(
                        onTapFunc: gotoPage,
                        username: userList[index].userName,
                        lastMessage: userList[index].latestChat,
                        isOnline: userList[index].isOnline);
                  }))
        ],
      ),
    );
  }
}

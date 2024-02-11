import 'package:flutter/material.dart';
import 'package:sewoch/pages/chat_pages/widgets/chat_item_widget.dart';
import 'package:sewoch/user_modle.dart';

class FriendChatScreen extends StatefulWidget {
  const FriendChatScreen({super.key});

  @override
  State<FriendChatScreen> createState() => _FriendChatScreenState();
}

class _FriendChatScreenState extends State<FriendChatScreen> {
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.teal[800],
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              title: const Text('Sewoch'),
              background: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: <Color>[
                        Colors.teal[800]!,
                        Colors.transparent
                      ]),),child: Image.asset("asset/back.png",fit: BoxFit.cover,),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(childCount: userList.length,
                  (BuildContext context, int index) {
            return chatItemWidget(
                username: userList[index].userName,
                lastMessage: userList[index].latestChat,
                isOnline: userList[index].isOnline);
          }))
        ],
      ),
    );
  }
}

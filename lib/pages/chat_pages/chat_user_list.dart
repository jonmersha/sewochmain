import 'package:flutter/material.dart';
import 'package:sewoch/pages/chat_pages/widgets/chat_item_widget.dart';
import 'package:sewoch/user_modle.dart';

class ChatUserList extends StatelessWidget {
  const ChatUserList({super.key});

  @override
  Widget build(BuildContext context) {
    List<UserModel> userList = [
      UserModel("Yohannes Mitike", "We Have been the for longer time", false),
      UserModel("Nahome Yohannes", "I will come latter", true),
      UserModel("Abiy Mitike", "Lets go with them", false),
      UserModel("Yoseph Mitike", "prayer always tels some things ", true),
      UserModel(
          "Kefelegn Mitike",
          "Some of our mangers is not doing well for now but we ha some things",
          false),
      UserModel("Nuhamin yohannes", "We Have been the for longer time", true),
      UserModel("Addis Negga", "We Have been the for longer time", false),
      UserModel("Nardos Yohannes", "We Have been the for longer time", true),
      UserModel("Addis Negga", "We Have been the for longer time", false),
    ];

    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: userList.length,
                (BuildContext context, int index) {
                  return chatItemWidget(
          username: userList[index].userName,
          lastMessage: userList[index].latestChat,
          isOnline: userList[index].isOnline);
    }));
  }
}

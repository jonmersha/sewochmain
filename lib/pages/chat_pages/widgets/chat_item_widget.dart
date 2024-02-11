import 'package:flutter/material.dart';

Widget chatItemWidget(
    {Function()? onTapFunc,
    Function()? horizontal,
    String? username,
    String? lastMessage,
    bool isOnline = false}) {
  return GestureDetector(
    onTap: onTapFunc,
    child: Container(
      height: 90,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: !isOnline ? Colors.grey : Colors.green,
            child: const Icon(
              Icons.person,
              size: 35,
            ),
          ),
          const VerticalDivider(
            width: 5,
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$username",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black54),
                  ),
                  Text(
                    "$lastMessage",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black45,fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Icon(
            Icons.call,
            size: 30,
            color: Colors.green,
          )
        ],
      ),
    ),
  );
}

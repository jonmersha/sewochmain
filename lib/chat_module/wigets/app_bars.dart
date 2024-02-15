import 'package:flutter/material.dart';

SliverAppBar buildSliverAppBarChatPage() {
  return SliverAppBar(
    bottom: const TabBar(
      tabs: [
        Text(
          "Contact",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        //Tab(text: "Chats",),
        Text(
          "Chats",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        Tab(
            icon: Icon(
              Icons.call,
              color: Colors.white,
            )),
        Text(
          "New Group",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white),
        ),
      ],
    ),
    pinned: true,
    backgroundColor: Colors.teal[300],
    expandedHeight: 180.0,
    flexibleSpace: FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: <Color>[Colors.teal[800]!, Colors.transparent]),
        ),
        child: Image.asset(
          "asset/back.png",
          fit: BoxFit.cover,
        ),
        //Image.asset("asset/back.png",fit: BoxFit.cover,),
      ),
    ),
  );
}

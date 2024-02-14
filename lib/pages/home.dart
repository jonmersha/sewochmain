import 'package:flutter/material.dart';
import 'package:sewoch/pages/chat_pages/chat_history.dart';
import 'package:sewoch/pages/contacts/my_contacts.dart';

import 'contacts/images.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
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
            ),
            const SliverFillRemaining(
              child: TabBarView(
              children: [
                Contacts(),
                ChatHistory(),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bike),
              ],
            ),)

          
          ],
        ),
      ),
    );
  }
}

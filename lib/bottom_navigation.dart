import 'package:flutter/material.dart';
import 'package:sewoch/hom_pages/chat_home.dart';
import 'package:sewoch/hom_pages/dash.dart';
import 'package:sewoch/hom_pages/landing.dart';
import 'package:sewoch/hom_pages/menu_page.dart';
import 'package:sewoch/hom_pages/my_activity.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

Widget active = const LandingPage();

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> frontPages = [
      const LandingPage(),
      const ChatHomePage(),
      const DashBord(),
      const UserActivity(),
      const MenuPage()
    ];

    return Scaffold(
      body: active,
      bottomNavigationBar: Container(
       // height: 60,
        padding: const EdgeInsets.all(8),
       margin: const EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  active = frontPages[0];
                });
              },
              child: const Icon(
                Icons.home,
                color: Colors.teal,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  active = frontPages[1];
                });
              },
              child: const Icon(
                Icons.group,
                color: Colors.teal,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  active = frontPages[2];
                });
              },
              child: const Icon(
                Icons.dashboard,
                color: Colors.teal,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  active = frontPages[3];
                });
              },
              child: const Icon(
                Icons.my_library_add,
                color: Colors.teal,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  active = frontPages[4];
                });
              },
              child: const Icon(
                Icons.menu,
                color: Colors.teal,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

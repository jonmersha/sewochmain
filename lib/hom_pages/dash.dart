import 'package:flutter/material.dart';

class DashBord extends StatelessWidget {
  const DashBord({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          color: Colors.white,
        ),
        Container(
          height: 90,
          color: Colors.white,
        ),
        Container(
          height: 90,
          color: Colors.white,
        ),
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            ),
          ),
          // height: 60,
        )),
      ],
    );
  }
}

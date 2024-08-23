import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.43,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.black],
            )),
            child: const Column(
              children: [
                Text(
                  "I'm Manoj Kumar GS",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "Full Stack Developer",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.1,
            color: Colors.black,
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.44,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.white],
            )),
          ),
        ],
      ),
    ));
  }
}

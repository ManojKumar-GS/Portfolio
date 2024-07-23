import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/screens/more_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool selected = false;
  Offset offset = Offset.zero;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.3,
              width: MediaQuery.sizeOf(context).width,
              decoration: ShapeDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(150))),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    offset = const Offset(1, 0);
                    selected = !selected;
                  });
                  Future.delayed(
                      const Duration(milliseconds: 600),
                      () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const MoreInfo())));
                },
                child: AnimatedSlide(
                  offset: offset,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.linear,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.42,
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        child: Card(
                          elevation: 15,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.sizeOf(context).height * 0.12)),
                          child: Image.asset("assets/profile.png",
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Manoj Kumar GS",
                                    style: TextStyle(fontSize: 25)),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/phone.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "+91 9481878819",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      child: Image.asset(
                                        "assets/icons/gmail.png",
                                        height: 30,
                                        width: 30,
                                      ),
                                      onTap: () {},
                                    ),
                                    InkWell(
                                      child: Image.asset(
                                        "assets/icons/linkdin.png",
                                        height: 30,
                                        width: 30,
                                      ),
                                      onTap: () {},
                                    ),
                                    InkWell(
                                      child: Image.asset(
                                        "assets/icons/github.png",
                                        height: 30,
                                        width: 30,
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
          child: Drawer(
            elevation: 0,
            backgroundColor: Colors.transparent,
            width: 200,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.2,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  ListTile(
                    minVerticalPadding:
                        MediaQuery.sizeOf(context).height * 0.05,
                    textColor: Colors.black,
                    leading: Image.asset("assets/icons/education.png"),
                    title: const Text(
                      'Education',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontFamily: AutofillHints.birthday),
                    ),
                    onTap: () {
                      _onItemTapped(0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    minVerticalPadding:
                        MediaQuery.sizeOf(context).height * 0.05,
                    leading: Image.asset("assets/icons/exp.png"),
                    title: const Text(
                      'Experience',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontFamily: AutofillHints.birthday),
                    ),
                    onTap: () {
                      _onItemTapped(1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    minVerticalPadding:
                        MediaQuery.sizeOf(context).height * 0.05,
                    leading: Image.asset("assets/icons/skills.png"),
                    title: const Text(
                      'Skills',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontFamily: AutofillHints.birthday),
                    ),
                    onTap: () {
                      _onItemTapped(2);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    minVerticalPadding:
                        MediaQuery.sizeOf(context).height * 0.05,
                    leading: Image.asset("assets/icons/hobby.png"),
                    title: const Text(
                      'Hobbies',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontFamily: AutofillHints.birthday),
                    ),
                    onTap: () {
                      _onItemTapped(2);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

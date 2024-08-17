import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/exp.dart';
import 'package:portfolio/screens/more_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  bool selected = false;
  Offset offset = const Offset(1, 0);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 150),
        () => setState(() {
              offset = const Offset(0, 0);
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Stack(children: [
            IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.isDrawerOpen
                      ? _scaffoldKey.currentState?.closeDrawer()
                      : _scaffoldKey.currentState?.openDrawer();
                  /* Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ExampleStaggeredAnimations(),
                  ));*/
                },
                icon: const Icon(Icons.menu)),
            Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(150))),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        offset = const Offset(1, 0);
                      });
                      Future.delayed(
                          const Duration(milliseconds: 800),
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
                                      MediaQuery.sizeOf(context).height *
                                          0.12)),
                              child: Image.asset("assets/images/profile.png",
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        imageIcons(name: 'gmail', size: 30),
                                        imageIcons(name: 'linkdin', size: 30),
                                        imageIcons(name: 'github', size: 30),
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
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("EXPERIENCE",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w900,
                                  foreground: Paint()
                                    ..shader = const LinearGradient(
                                      colors: <Color>[
                                        Color(0xffDA44bb),
                                        Color(0xff8921aa),
                                        Colors.black54
                                      ],
                                    ).createShader(const Rect.fromLTWH(
                                        0.0, 0.0, 200.0, 70.0)))),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 10),
                            child: Text("SKILLS",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w900,
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: <Color>[
                                          Color(0xffDA44bb),
                                          Color(0xff8921aa),
                                          Colors.black54
                                        ],
                                      ).createShader(const Rect.fromLTWH(
                                          0.0, 0.0, 200.0, 70.0)))),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const Card(
                                color: Colors.purple,
                                child: Row(
                                  children: [
                                    Text("Text"),
                                    Text("Text"),
                                    Text("Text"),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("EDUCATION",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w900,
                                  foreground: Paint()
                                    ..shader = const LinearGradient(
                                      colors: <Color>[
                                        Color(0xffDA44bb),
                                        Color(0xff8921aa),
                                        Colors.black54
                                      ],
                                    ).createShader(const Rect.fromLTWH(
                                        0.0, 0.0, 200.0, 70.0)))),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 10),
                            child: Text("HOBBIES",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w900,
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: <Color>[
                                          Color(0xffDA44bb),
                                          Color(0xff8921aa),
                                          Colors.black54
                                        ],
                                      ).createShader(const Rect.fromLTWH(
                                          0.0, 0.0, 200.0, 70.0)))),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const Card(
                                color: Colors.purple,
                                child: Row(
                                  children: [
                                    Text("Text"),
                                    Text("Text"),
                                    Text("Text"),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.02,
              right: MediaQuery.sizeOf(context).width * 0.25,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.15,
                width: MediaQuery.sizeOf(context).width * 0.5,
                child: Stack(
                  children: [
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      alignment: selected
                          ? Alignment.bottomRight
                          : Alignment.bottomCenter,
                      child: Visibility(
                          visible: selected,
                          child: imageIcons(name: 'gmail', size: 50)),
                    ),
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      alignment: selected
                          ? Alignment.topCenter
                          : Alignment.bottomCenter,
                      child: Visibility(
                          visible: selected,
                          child: imageIcons(name: 'github', size: 50)),
                    ),
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      alignment: selected
                          ? Alignment.bottomLeft
                          : Alignment.bottomCenter,
                      child: Visibility(
                          visible: selected,
                          child: imageIcons(name: 'linkdin', size: 50)),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () {
            setState(() {
              selected = !selected;
            });
          },
          child: selected
              ? const Icon(Icons.close)
              : const Icon(CupertinoIcons.question_circle),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
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
                  AnimatedSlide(
                    offset: offset,
                    duration: const Duration(milliseconds: 5000),
                    child: drawerElements(
                        image: "assets/icons/education.png",
                        name: 'Education',
                        index: 0),
                  ),
                  drawerElements(
                      image: "assets/icons/exp.png",
                      name: 'Experience',
                      index: 1),
                  drawerElements(
                      image: "assets/icons/skills.png",
                      name: 'Skills',
                      index: 2),
                  drawerElements(
                      image: "assets/icons/hobby.png",
                      name: 'Hobbies',
                      index: 3),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: BottomAppBar(
              height: 60,
              color: Theme.of(context).colorScheme.inversePrimary,
              notchMargin: 10,
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: imageIcons(name: 'education', size: 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: imageIcons(name: 'exp', size: 40),
                  ),
                  imageIcons(name: 'skills', size: 40),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: imageIcons(name: 'hobby', size: 40),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageIcons({required String name, required double size}) {
    return InkWell(
      child: Image.asset(
        "assets/icons/$name.png",
        height: size,
        width: size,
      ),
      onTap: () {},
    );
  }

  Widget drawerElements(
      {required String image, required String name, required int index}) {
    return ListTile(
      minVerticalPadding: MediaQuery.sizeOf(context).height * 0.05,
      textColor: Colors.black,
      leading: Image.asset(image),
      title: Text(
        name,
        style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
            fontFamily: AutofillHints.birthday),
      ),
      onTap: () {
        _onItemTapped(index);
        Navigator.pop(context);
      },
    );
  }

  Widget myWidget(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: AnimatedList(
          initialItemCount: 50,
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) {
            return Card(
              color: Colors.amber,
              child: Center(child: Text('$index')),
            );
          }),
    );
  }
}

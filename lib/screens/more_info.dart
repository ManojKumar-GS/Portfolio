import 'package:flutter/material.dart';
import 'package:portfolio/screens/detail_screen.dart';
import 'package:portfolio/screens/home_screen.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> with TickerProviderStateMixin {
  Offset offset = const Offset(-1, 0);
  List projects = [];
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    _controller.forward();
    Future.delayed(
        const Duration(milliseconds: 150),
        () => setState(() {
              offset = const Offset(0, 0);
            }));
    projects = [
      {
        'name': 'Portfolio',
        'image': "assets/images/profile.png",
        'lang': "Dart"
      },
      {
        'name': "Weather App",
        'image': "assets/images/profile.png",
        'lang': "Dart"
      },
      {
        'name': "Instagram Clone",
        'image': "assets/images/profile.png",
        'lang': "Dart"
      },
      {
        'name': "Book store",
        'image': "assets/images/profile.png",
        'lang': "Java"
      },
      {
        'name': "Vehicle store",
        'image': "assets/images/profile.png",
        'lang': "Java"
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        if (!canPop) {
          Future.delayed(
              const Duration(milliseconds: 800),
              () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen())));
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              collapsedHeight: MediaQuery.sizeOf(context).height * 0.2,
              surfaceTintColor: Colors.black,
              backgroundColor: Colors.black87,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(150))),
              expandedHeight: MediaQuery.sizeOf(context).height * 0.3,
              flexibleSpace: GestureDetector(
                onTap: () {
                  setState(() {
                    offset = const Offset(-1, 0);
                  });
                  Future.delayed(
                      const Duration(milliseconds: 600),
                      () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen())));
                },
                child: AnimatedSlide(
                  duration: const Duration(milliseconds: 600),
                  offset: offset,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Flutter Full stack developer",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
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
                      Card(
                        elevation: 15,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.sizeOf(context).height * 0.12)),
                        child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: MediaQuery.sizeOf(context).height * 0.18,
                            child: Image.asset("assets/images/programming.png",
                                fit: BoxFit.fitHeight)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: projects.length,
              itemBuilder: (BuildContext context, int index) {
                return projectList(
                    name: projects[index]['name'],
                    image: projects[index]['image'],
                    lang: projects[index]['lang']);
              },
            ),
          ],
        ),
      ),
    ));
  }

  Widget projectList(
      {required String name, required String image, required String lang}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(name: name, image: image)));
      },
      child: Hero(
        tag: name,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              margin: const EdgeInsets.all(10),
              borderOnForeground: true,
              child: ListTile(
                title: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: AutofillHints.impp),
                ),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: lang == "Dart"
                                  ? Colors.blueAccent
                                  : Colors.purple,
                              shape: BoxShape.circle,
                              border: const Border()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(lang),
                        ),
                        const SizedBox(width: 30),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                              border: Border()),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("Others"),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizeTransition(
                        sizeFactor: _animation,
                        axis: Axis.horizontal,
                        axisAlignment: -1,
                        child: Container(
                          height: 10,
                          width: 150,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                lang == "Dart"
                                    ? Colors.blueAccent
                                    : Colors.purple,
                                lang == "Dart"
                                    ? Colors.blueAccent
                                    : Colors.purple,
                                lang == "Dart"
                                    ? Colors.blueAccent
                                    : Colors.purple,
                                Colors.grey
                              ]),
                              color: Colors.grey,
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: const Border()),
                        ),
                      ),
                    ),
                  ],
                ),
                contentPadding: const EdgeInsets.all(20),
                leading: Image.asset(image, width: 100, height: 100),
              ),
            ),
            /* SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: const Divider())*/
          ],
        ),
      ),
    );
  }
}

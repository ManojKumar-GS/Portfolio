import 'package:flutter/material.dart';
import 'package:portfolio/screens/detail_screen.dart';
import 'package:portfolio/screens/home_screen.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  Offset offset = const Offset(-1, 0);

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
              collapsedHeight: MediaQuery.sizeOf(context).height * 0.18,
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
                      Card(
                        elevation: 15,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.sizeOf(context).height * 0.12)),
                        child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: MediaQuery.sizeOf(context).height * 0.18,
                            child: Image.asset("assets/profile.png",
                                fit: BoxFit.fitHeight)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ListView(
                  padding: const EdgeInsets.all(20),
                  shrinkWrap: true,
                  children: [
                    projectList(name: 'Portfolio', image: "assets/profile.png"),
                    const Divider(),
                    projectList(
                        name: "Weather App",
                        image: "assets/icons/education.png"),
                    const Divider(),
                    projectList(
                        name: "Instagram Clone",
                        image: "assets/icons/education.png")
                  ]),
            )
          ],
        ),
      ),
    ));
  }

  Widget projectList({required String name, required String image}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(name: name, image: image)));
      },
      child: Hero(
        tag: name,
        child: Card(
          child: ListTile(
            title: Text(
              name,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: AutofillHints.impp),
            ),
            subtitle: const Text("Flutter"),
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset(image, width: 100, height: 100),
          ),
        ),
      ),
    );
  }
}

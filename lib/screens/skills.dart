import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SkillsScreen extends StatefulWidget {
  final String title;
  final List? list;
  const SkillsScreen({super.key, required this.title, this.list});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.cyan,
                      )),
                  Text(widget.title,
                      style: TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: <Color>[
                                Color(0xFFFFFFFF),
                                Color(0xFFB7E6F3),
                                Color(0xFF2BC4E3)
                              ],
                            ).createShader(
                                const Rect.fromLTWH(50.0, 50.0, 200.0, 70.0)))),
                  // const Spacer(),
                  Image.asset("assets/icons/${widget.title.toLowerCase()}.png",
                      width: 50, height: 50),
                ],
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.894,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.85,
                      child: GridView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: widget.list?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return cards(
                              name: widget.list?[index]["name"],
                              image: widget.list?[index]["image"],
                              rating: widget.list?[index]["rating"]);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget cards(
      {required String name, required String image, required int rating}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.all(7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/icons/$image.png",
              width: 50,
              height: 50,
            ),
            Text(name),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.star_rate, size: 20),
                  const Icon(Icons.star_rate, size: 20),
                  const Icon(Icons.star_rate, size: 20),
                  rating != 3
                      ? const Icon(Icons.star_rate, size: 20)
                      : const Icon(Icons.star_rate_outlined, size: 20),
                  const Icon(Icons.star_rate_outlined, size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

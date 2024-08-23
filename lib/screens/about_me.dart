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
            child: Column(
              children: [
                const Text(
                  "I'm Manoj Kumar GS",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      height: 4),
                ),
                const Text(
                  "Full Stack Developer",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.1),
                  child: const Text(
                    "It is a ent of a page when looking at its layout. \n The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.\n Many desktop publishing packages , and a search for 'lorem ipsum' will uncover many web sites still in their infancy.\n Various versions have evolved sometimes on purpose (injected humour and the like)..",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text("Resume",
                      style: TextStyle(color: Colors.white)),
                )
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

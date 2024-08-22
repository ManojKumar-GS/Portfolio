import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final String image;
  const DetailScreen({super.key, required this.name, required this.image});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: Icon(
                  isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                  size: 30,
                  color: isLiked ? Colors.red : Colors.black,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.name,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 300,
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: Image.asset(
                        widget.image,
                      ),
                    ),
                  ),
                ),
                const Text("Aug 22, 2024  .  (5 min Read)",
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.w900),
                ),
                const Text(
                  "A flutter mobile application.",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Why do we use it?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                const Text(
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. \n The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.\n Many desktop publishing packages , and a search for 'lorem ipsum' will uncover many web sites still in their infancy.\n Various versions have evolved sometimes on purpose (injected humour and the like)..",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                ElevatedButton(
                  onPressed: () {
                    var snackBar = SnackBar(
                      content: const Text('Visit Github to read more'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.35),
                    backgroundColor: Colors.black,
                  ),
                  child: const Text("READ MORE",
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

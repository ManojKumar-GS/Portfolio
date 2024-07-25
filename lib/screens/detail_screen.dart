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
  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: widget.name,
              child: Image.asset(
                widget.image,
                height: 200,
                width: 200,
              ),
            ),
            Text(widget.name)
          ],
        ),
      ),
    ));
  }
}

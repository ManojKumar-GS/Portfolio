import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: MediaQuery.sizeOf(context).height * 0.18,
            surfaceTintColor: Colors.black,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(150))),
            expandedHeight: MediaQuery.sizeOf(context).height * 0.3,
            flexibleSpace: Row(
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.sizeOf(context).height * 0.12)),
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        height: MediaQuery.sizeOf(context).height * 0.18,
                        child: Image.asset("assets/profile.png",
                            fit: BoxFit.fitHeight)),
                  ),
                ),
              ],
            ),
            // centerTitle: true,
            // title: const Text("Manoj Kumar GS ")
          ),
          SliverList.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  color: Colors.black45,
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}

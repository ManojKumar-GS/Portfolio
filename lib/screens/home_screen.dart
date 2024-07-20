import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            backgroundColor: Colors.transparent,
            width: 200,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 80,
                ),
                ListTile(
                  textColor: Colors.black,
                  leading:
                      const Icon(Icons.school, size: 50, color: Colors.black),
                  title: const Text('Education'),
                  selected: _selectedIndex == 0,
                  onTap: () {
                    _onItemTapped(0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  minVerticalPadding: MediaQuery.sizeOf(context).height * 0.1,
                  leading:
                      const Icon(Icons.school, size: 50, color: Colors.black),
                  title: const Text('Experience'),
                  selected: _selectedIndex == 1,
                  onTap: () {
                    _onItemTapped(1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.school, size: 50, color: Colors.black),
                  title: const Text('Hobbies'),
                  selected: _selectedIndex == 2,
                  onTap: () {
                    _onItemTapped(2);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                collapsedHeight: MediaQuery.sizeOf(context).height * 0.17,
                surfaceTintColor: Colors.black,
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(150))),
                expandedHeight: MediaQuery.sizeOf(context).height * 0.3,
                flexibleSpace: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.sizeOf(context).height * 0.12)),
                      child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).height * 0.18,
                          child: Image.asset("assets/profile.png",
                              fit: BoxFit.fitHeight)),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Manoj Kumar GS",
                                  style: TextStyle(fontSize: 25)),
                            ),
                            Row(
                              children: [
                                Icon(Icons.phone),
                                Padding(
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
                                  Icon(Icons.message),
                                  Icon(Icons.link),
                                  Icon(Icons.mail),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
          )),
    );
  }
}

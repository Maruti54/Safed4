import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';
import 'package:safed/screens/qr_code_scanner.dart';
import 'package:safed/screens/history.dart';
import 'package:safed/screens/side_drawer.dart';
import 'package:safed/screens/statistics_screen.dart';

import 'notification.dart';

class ProducerDashboard extends StatefulWidget {
  const ProducerDashboard({Key? key}) : super(key: key);

  @override
  State<ProducerDashboard> createState() => _ProducerDashboardState();
}

class _ProducerDashboardState extends State<ProducerDashboard> {
  late final TabContainerController _controller;
  late TextTheme textTheme;

  @override
  void initState() {
    _controller = TabContainerController(length: 4);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    textTheme = Theme.of(context).textTheme;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xFF20BCDE),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 15),
                      child: SizedBox(
                        width: 140,
                        child: Text(
                          'Hello,'
                          'Pavan',
                          style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 70),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 35,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 15),
                  child: Text(
                    '+91 1234-5678-90',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'My Profile',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Current/Pending Contract',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Explore New       '
                  'Exporter',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Medical Guide',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen()));
              },
              icon: const Icon(
                Icons.doorbell_outlined,
                color: Colors.black,
              ))
        ],
        title: const Text(
          'Dasboard',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFEEEEEE),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome Pavan',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TabContainer(
                  radius: 20,
                  tabEdge: TabEdge.top,
                  tabCurve: Curves.easeIn,
                  transitionBuilder: (child, animation) {
                    animation = CurvedAnimation(
                        curve: Curves.easeIn, parent: animation);
                    return SlideTransition(
                      position: Tween(
                        begin: const Offset(0.2, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(animation),
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                  colors: const <Color>[
                    Colors.white,
                    Colors.white,
                    Colors.white,
                  ],
                  selectedTextStyle:
                      textTheme.bodyText2?.copyWith(fontSize: 15.0),
                  unselectedTextStyle:
                      textTheme.bodyText2?.copyWith(fontSize: 13.0),
                  tabs: const ['My QR Code', 'History', 'Graph'],
                  children: [
                    Center(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset('assets/img.png')),
                    ),
                    HistoryScreen(),
                    Statistics(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

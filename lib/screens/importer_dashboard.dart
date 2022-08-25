import 'package:flutter/material.dart';
import 'package:safed/screens/best_proceessor.dart';

class ImporterDashboard extends StatefulWidget {
  const ImporterDashboard({Key? key}) : super(key: key);

  @override
  State<ImporterDashboard> createState() => _ImporterDashboardState();
}

class _ImporterDashboardState extends State<ImporterDashboard> {
  String? chosenValue;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: DefaultTabController(
                length: 2,
                child: Scaffold(
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
                                    'Dealer',
                                style: TextStyle(color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                          const ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Text(
                                'List of Farmer',
                                style: TextStyle(color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    appBar: AppBar(

                      actions: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.more_vert))
                      ],

                      backgroundColor: const Color(0xFF20BCDE),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Dashboard',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      bottom: const TabBar(
                        indicatorColor: Colors.white,
                        indicatorWeight: 2,
                        tabs: [
                          Tab(text: 'Tender'),
                          Tab(text: 'Exporters'),
                        ],
                      ),
                    ),

                    body: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Container(),
                          BestProcessorScreen(),
                        ])))));
  }
}

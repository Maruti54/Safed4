import 'package:flutter/material.dart';
import 'package:safed/screens/collector_dashboard.dart';
import 'package:safed/screens/exporter_registration.dart';
import 'package:safed/screens/exporter_tender.dart';
import 'cluster_map.dart';
import 'importers.dart';

class ExporterDashboard1 extends StatefulWidget {
  const ExporterDashboard1({Key? key}) : super(key: key);

  @override
  State<ExporterDashboard1> createState() => _ExporterDashboard1State();
}

class _ExporterDashboard1State extends State<ExporterDashboard1> {
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
                          ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ExporterDashboard()));
                                },
                                child: const Text(
                                  'Monitor Supply Chain',
                                  style: TextStyle(color: Colors.white, fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClusterMapScreen()));
                                },
                                child: const Text(
                                  'Explore New       '
                                      'Dealer',
                                  style: TextStyle(color: Colors.white, fontSize: 25),
                                ),
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
                      title: const Text(
                        'Exporter Dashboard',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      bottom: const TabBar(
                        indicatorColor: Colors.white,
                        indicatorWeight: 2,
                        tabs: [
                          Tab(text: 'Active Shipments'),
                          Tab(text: 'Importers'),
                        ],
                      ),
                    ),
                    floatingActionButton: FloatingActionButton(onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExporterRegistration()));
                    },
                      child: const Icon(Icons.add,color: Colors.white,),
                    ),
                    body: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ExporterTender(),
                          Importers(),
                        ])))));
  }
}
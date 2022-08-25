import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class Tender extends StatefulWidget {
  const Tender({Key? key}) : super(key: key);

  @override
  State<Tender> createState() => _TenderState();
}

class _TenderState extends State<Tender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              child: GFListTile(
                  color: Colors.transparent,
                  title: const Text(
                    'Maruti Patil',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.announcement,
                          color: const Color(0xFF20BCDE),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                title: const Text('MetaData'),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(22.0),
                                    child: Container(
                                      height: 300,
                                      width: 270,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(22),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 3,
                                            blurRadius: 8,
                                            offset: const Offset(5, 5), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                                            child: Text(
                                              'Name: Pavan Bhadane',
                                              style: TextStyle(color: Colors.grey[600], fontSize: 17),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                                            child: Text(
                                              'Phone No: 1234-567-890',
                                              style: TextStyle(color: Colors.grey[600], fontSize: 17),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                                            child: Text(
                                              'Location: Raigad, Maharashtra',
                                              style: TextStyle(color: Colors.grey[600], fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                                            child: Text(
                                              'Farmer: New Sanghvi',
                                              style: TextStyle(color: Colors.grey[600], fontSize: 17),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 22,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius: BorderRadius.circular(22),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black.withOpacity(0.2),
                                                      spreadRadius: 1,
                                                      blurRadius: 2,
                                                      offset:
                                                      const Offset(2, 3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          // Navigator.push(
                                                          //     context,
                                                          //     MaterialPageRoute(
                                                          //         builder: (context) => TimelineScreen()));
                                                        },
                                                        child: Text('Info'))),
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              Container(
                                                height: 22,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF20BCDE),
                                                  borderRadius: BorderRadius.circular(22),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black.withOpacity(0.2),
                                                      spreadRadius: 1,
                                                      blurRadius: 2,
                                                      offset:
                                                      const Offset(2, 3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder: (context) => ()));
                                                      },
                                                      child: Text(
                                                        'Connect',
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    )),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}

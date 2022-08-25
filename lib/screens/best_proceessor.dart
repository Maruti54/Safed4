import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:safed/screens/producer_info.dart';

import 'Timeline.dart';
import 'importer_standards.dart';

class BestProcessorScreen extends StatefulWidget {
  const BestProcessorScreen({Key? key}) : super(key: key);

  @override
  State<BestProcessorScreen> createState() => _BestProcessorScreenState();
}

class _BestProcessorScreenState extends State<BestProcessorScreen> {
  final controller = CarouselController();
  int activeIndex = 0;
  Widget BestFarmerCard() {
    return Padding(
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TimelineScreen()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProducerInfo()));
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
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
                              color: Colors.black,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Best Exporter',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Stack(children: [
            Center(
                child: CarouselSlider.builder(
              carouselController: controller,
              options: CarouselOptions(height: 320),
              itemCount: 6,
              itemBuilder: (context, index, realIndex) {
                return BestFarmerCard();
              },
            )),
            Positioned(
                top: 130,
                left: 25,
                child: GestureDetector(
                  onTap: () {
                    controller.previousPage(duration: Duration(seconds: 1));
                    setState(() {});
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                )),
            Positioned(
              right: 25,
              top: 130,
              child: InkWell(
                onTap: () {
                  controller.nextPage(duration: Duration(seconds: 1));
                  setState(() {});
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

Widget BestFarmerCard() {
  return Padding(
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
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const Center(child: Text('Info')),
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
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const Center(
                    child: Text(
                  'Connect',
                  style: TextStyle(color: Colors.white),
                )),
              )
            ],
          )
        ],
      ),
    ),
  );
}

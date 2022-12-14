import 'dart:ffi';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import 'f_registration2.dart';

List cattleList = [];

class FRegistrationScreen1 extends StatefulWidget {
  const FRegistrationScreen1({Key? key}) : super(key: key);

  @override
  State<FRegistrationScreen1> createState() => _FRegistrationScreen1State();
}

class _FRegistrationScreen1State extends State<FRegistrationScreen1> {
  int _count1 = 1;

  final user = FirebaseAuth.instance.currentUser!;

  Future addFarmerInfo() async {
    print('CATTLELIST: $cattleList, ${user.email}');
    final docUser =
        FirebaseFirestore.instance.collection('farmers').doc(user.email);
    final json = {
      'no-of-cattles': _count1,
      'cattle-list': FieldValue.arrayUnion(cattleList),
    };

    await docUser.set(json, SetOptions(merge: true));
  }

  final controller = CarouselController();
  void increment1() {
    setState(() {
      _count1++;
      AddCard();
    });
  }

  void decrement1() {
    setState(() {
      if (_count1 > 1) {
        _count1--;
        RemoceCard();
      }
    });
  }

  AddCard() {
    setState(() {
      Card.add(MilkCard());
    });
  }

  RemoceCard() {
    setState(() {
      Card.removeLast();
    });
  }

  List<Widget> Card = [MilkCard()];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Skip',
              style: TextStyle(color: Color(0xFF20BCDE), fontSize: 18),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Hello,${user.displayName}!',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter Number of Cattles',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                const SizedBox(
                  width: 25,
                ),
                Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: decrement1,
                          icon: (const Icon(
                            Icons.remove,
                            color: Color(0xFF20BCDE),
                          ))),
                      Text(
                        '$_count1',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      IconButton(
                          onPressed: increment1,
                          icon: (const Icon(
                            Icons.add,
                            color: Color(0xFF20BCDE),
                          ))),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15),
              child: Text(
                'Specify Your Milks',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Stack(children: [
              Center(
                  child: CarouselSlider.builder(
                carouselController: controller,
                options: CarouselOptions(
                    height: 280,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    }),
                itemCount: Card.length,
                itemBuilder: (context, index, realIndex) {
                  final card = Card[index];
                  return MilkCard();
                },
              )),
              Positioned(
                  top: 130,
                  left: 25,
                  child: GestureDetector(
                    onTap: () {
                      controller.previousPage(
                          duration: const Duration(milliseconds: 300));
                      setState(() {});
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                  )),
              Positioned(
                right: 25,
                top: 130,
                child: InkWell(
                  onTap: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 300));
                    setState(() {});
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ]),
            Center(child: buildIndicator()),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Container(
                height: 45,
                width: 170,
                decoration: BoxDecoration(
                    color: Color(0xFF20BCDE),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      await addFarmerInfo();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DealerScreen()));
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                          color: Colors.white, fontSize: 22, letterSpacing: 3),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: Card.length,
    );
  }
}

class MilkCard extends StatefulWidget {
  const MilkCard({Key? key}) : super(key: key);

  @override
  State<MilkCard> createState() => _MilkCardState();
}

class _MilkCardState extends State<MilkCard> {
  TextEditingController avgp = TextEditingController();
  TextEditingController nickname = TextEditingController();

  final List<String> _Milks = [
    'Breed 1',
    'Breed 2',
    'Breed 3',
    'Breed 4',
    'Breed 5',
    'Breed 6',
    'Breed 7',
    'Breed 8'
  ];
  var SelectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
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
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Container(
                  width: 210,
                  height: 35,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.0),
                    color: Colors.grey[350],
                  ),
                  child: DropdownButton(
                    value: SelectedItem,
                    items: _Milks.map((Milk) => DropdownMenuItem(
                          value: Milk,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(Milk),
                          ),
                        )).toList(),
                    onChanged: (Milk) {
                      setState(() {
                        SelectedItem = Milk;
                      });
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.keyboard_arrow_down,
                          size: 30, color: Colors.grey[600]),
                    ),
                    isExpanded: true,
                    hint: const Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('Select Breed'),
                    ),
                    underline: const SizedBox(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 35,
                width: 400,
                child: TextField(
                  controller: avgp,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[350],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Daily Production in ltr',
                    contentPadding: EdgeInsets.only(top: 1.0),
                  ),
                  cursorHeight: 20,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 35,
                width: 400,
                child: TextField(
                  controller: nickname,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[350],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Nickname',
                    contentPadding: EdgeInsets.only(top: 1.0),
                  ),
                  cursorHeight: 20,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                    color: Color(0xFF20BCDE),
                    borderRadius: BorderRadius.circular(100.0)),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      String newString =
                          "Breed: $SelectedItem Avg prod: ${avgp.text.trim()} Nickname: ${nickname.text.trim()}";
                      cattleList.add(newString);
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white, fontSize: 22, letterSpacing: 3),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

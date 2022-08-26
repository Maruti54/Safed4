import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ImporterStandards extends StatefulWidget {
  const ImporterStandards({Key? key}) : super(key: key);

  @override
  State<ImporterStandards> createState() => _ImporterStandardsState();
}

class _ImporterStandardsState extends State<ImporterStandards> {
  TextEditingController fat = TextEditingController();
  TextEditingController snf = TextEditingController();
  TextEditingController protein = TextEditingController();
  TextEditingController water = TextEditingController();
  TextEditingController lactose = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;

  List tenderList = [];

  Future createNewTender() async {
    print("USER INFO: ${user.email}");
    final docUser =
        FirebaseFirestore.instance.collection('importers').doc(user.email);
    final json = {
      'tender list': FieldValue.arrayUnion(tenderList),
    };
    await docUser.set(json, SetOptions(merge: true));
  }

  addToTenderList(String temp) {
    tenderList.add(temp);
    createNewTender();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Text(
                'Milk Requirement Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              height: 35,
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.circular(22.0),
                child: TextField(
                  controller: fat,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    contentPadding: const EdgeInsets.only(top: 5, left: 35),
                    hintText: 'Fat',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                  ),
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              height: 35,
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.circular(22.0),
                child: TextField(
                  controller: snf,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    contentPadding: const EdgeInsets.only(top: 5, left: 35),
                    hintText: 'SNF',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                  ),
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              height: 35,
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.circular(22.0),
                child: TextField(
                  controller: protein,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    contentPadding: const EdgeInsets.only(top: 5, left: 35),
                    hintText: 'Protien',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                  ),
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              height: 35,
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.circular(22.0),
                child: TextField(
                  controller: water,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    contentPadding: const EdgeInsets.only(top: 5, left: 35),
                    hintText: 'Water',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                  ),
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              height: 35,
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.circular(22.0),
                child: TextField(
                  controller: lactose,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    contentPadding: const EdgeInsets.only(top: 5, left: 35),
                    hintText: 'Lactose',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                  ),
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xFF20BCDE),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      addToTenderList(
                          "Fat: ${fat.text.trim()}, SNF: ${snf.text.trim()}, Protein: ${protein.text.trim()}, Water: ${water.text.trim()}, Lactose: ${lactose.text.trim()}");
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

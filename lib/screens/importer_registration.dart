import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safed/screens/importer_standards.dart';

class ImporterRegistration extends StatefulWidget {
  const ImporterRegistration({Key? key}) : super(key: key);

  @override
  State<ImporterRegistration> createState() => _ImporterRegistrationState();
}

class _ImporterRegistrationState extends State<ImporterRegistration> {
  TextEditingController iec = TextEditingController();
  TextEditingController ise = TextEditingController();
  TextEditingController apeda = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;

  Future addImporterInfo() async {
    print("USER INFO: ${user.email}");
    final docUser =
        FirebaseFirestore.instance.collection('importers').doc(user.email);
    final json = {
      'import export code': iec.text.trim(),
      'ISE certificate code': ise.text.trim(),
      'Apeda licence': apeda.text.trim(),
    };
    await docUser.set(json, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
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
                'Registration Details',
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
                  controller: iec,
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
                    hintText: 'IEC No.',
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
                  controller: ise,
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
                    hintText: 'ISE No.',
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
                  controller: apeda,
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
                    hintText: 'APEDA License No.',
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
                      addImporterInfo();
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

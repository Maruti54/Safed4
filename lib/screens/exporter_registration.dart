import 'package:flutter/material.dart';

class ExporterRegistration extends StatefulWidget {
  const ExporterRegistration({Key? key}) : super(key: key);

  @override
  State<ExporterRegistration> createState() => _ExporterRegistrationState();
}

class _ExporterRegistrationState extends State<ExporterRegistration> {
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
                    onTap: () {},
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

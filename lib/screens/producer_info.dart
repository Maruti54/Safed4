import 'dart:convert';

import 'package:flutter/material.dart';
import 'Timeline.dart';
import 'package:http/http.dart' as http;

class ProducerInfo extends StatefulWidget {
  const ProducerInfo({Key? key}) : super(key: key);

  @override
  State<ProducerInfo> createState() => _ProducerInfoState();
}

class _ProducerInfoState extends State<ProducerInfo> {
  @override
  void initState() {
    getAPIData();
  }

  List? body;

  Future getAPIData() async {
    var headers = {
      'Authorization':
          'Basic dTBqd3Yyemw4OTpvZGUxN0tYaXNUWE5qUlFYMWcyM2wyelp5bE5pRmg3SEJvYnhWSE1qVnQw',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://u0uemhojbl-u0gdrqs64a-connect.us0-aws-ws.kaleido.io/blocks/17?fly-channel=default-channel&fly-signer=admin1'));
    request.body = json.encode({
      "headers": {
        "type": "SendTransaction",
        "signer": "admin1",
        "channel": "default-channel",
        "chaincode": "asset_chaincode"
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final data = json.decode(await response.stream.bytesToString());
      body = data['result']['block']['transactions'][0]['actions'][0]['input']
          ['args'];
      setState(() {
        body = body;
      });
      print(
          "RESPONSE API${data['result']['block']['transactions'][0]['actions'][0]['input']['args']}");
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return body != null
        ? Scaffold(
            backgroundColor: const Color(0xFFEEEEEE),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            drawer: const Drawer(),
            body: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Container(
                height: MediaQuery.of(context).size.height * (3 / 4),
                width: MediaQuery.of(context).size.width,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 25.0),
                      child: Text(
                        'Current Milk Analysis',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Fat',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              Text(
                                '${body![7]}%',
                                style: TextStyle(
                                    color: Color(0xFF20BCDE), fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'SNF',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              Text(
                                '${body![8]}%',
                                style: TextStyle(
                                    color: Color(0xFF20BCDE), fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Added water',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              Text(
                                '${body![12]}%',
                                style: TextStyle(
                                    color: Color(0xFF20BCDE), fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Proteins',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              Text(
                                '${body![10]}%',
                                style: TextStyle(
                                    color: Color(0xFF20BCDE), fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Lactose',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              Text(
                                '${body![11]}%',
                                style: TextStyle(
                                    color: Color(0xFF20BCDE), fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Quantity',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              Text(
                                '${body![9]}',
                                style: TextStyle(
                                    color: Color(0xFF20BCDE), fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Temperature',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                              Text(
                                '${body![6]} C',
                                style: TextStyle(
                                    color: Color(0xFF20BCDE), fontSize: 18),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                              Text(
                                '${body![2]}',
                                style: TextStyle(
                                    color: Color(0xFF20BCDE), fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Rate',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 16),
                          ),
                          const Text(
                            'Rs 27.62/Ltr',
                            style: TextStyle(
                                color: Color(0xFF20BCDE), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 25.0),
                      child: Text(
                        'Historical Collection Data',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                          child: Column(
                            children: [
                              Text(
                                'Avg.Fat',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              const Text(
                                '3.8%',
                                style: TextStyle(
                                    color: Color(0xFF20BCDE), fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Avg.SNF',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              const Text(
                                '8.1%',
                                style: TextStyle(
                                    color: Color(0xFF20BCDE), fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Avg. Density',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              const Text(
                                '28.34%',
                                style: TextStyle(
                                    color: Color(0xFF20BCDE), fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                                offset: const Offset(
                                    2, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TimelineScreen()));
                                  },
                                  child: Text('Timeline'))),
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
                                offset: const Offset(
                                    2, 3), // changes position of shadow
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
            ),
          )
        : CircularProgressIndicator();
  }
}

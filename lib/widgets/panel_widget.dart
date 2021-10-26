import 'package:disaster_response/global/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PanelWidget extends StatefulWidget {
  final ScrollController controller;

  const PanelWidget({
    @required this.controller,
  });

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  String stringResponse;
  Map mapResponse;
  List listResponse;
  String imageUrl1;
  String imageUrl2;
  String imageUrl3;
  String status1;
  String status2;
  String status3;

  Future apicall() async {
    http.Response responseWeather = await http.get(Uri.parse(
      'https://weatherapi-com.p.rapidapi.com/forecast.json?q=$city&days=3&rapidapi-key=08fc6b8d24msh0ba2b030e801904p1f5d5fjsn2a16e871987b',
    ));
    if (responseWeather.statusCode == 200) {
      setState(() {
        stringResponse = responseWeather.body;
        mapResponse = json.decode(stringResponse);
        listResponse = mapResponse['forecast']['forecastday'];
        imageUrl1 = listResponse[0]['day']['condition']['icon'];
        imageUrl2 = listResponse[1]['day']['condition']['icon'];
        imageUrl3 = listResponse[2]['day']['condition']['icon'];
        status1 = listResponse[0]['day']['condition']['text'];
        status2 = listResponse[1]['day']['condition']['text'];
        status3 = listResponse[2]['day']['condition']['text'];
        // print('here                       $imageUrl1');
      });
    }
    // ==============================================
  }

  @override
  void initState() {
    super.initState();
    apicall();
  }

  Widget buildAboutText(BuildContext context) => Container(
        color: const Color.fromRGBO(163, 195, 217, 1),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: const Color.fromRGBO(204, 214, 235, 1),
          child: Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              imageUrl1 == null ? Text('') : Image.network('https:$imageUrl1'),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                  status1 == null ? Text('loading ...') : Text(status1),
                ],
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Container(
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          color: Color.fromRGBO(163, 195, 217, 1),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 20),
            listResponse == null ? Container() : buildAboutText(context),
            const SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: const Color.fromRGBO(204, 214, 235, 1),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        imageUrl2 == null
                            ? Text('')
                            : Image.network('https:$imageUrl2'),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Tomorrow',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            status2 == null
                                ? Text('loading ...')
                                : Text(status2)
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: const Color.fromRGBO(204, 214, 235, 1),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        imageUrl3 == null
                            ? Text('')
                            : Image.network('https:$imageUrl3'),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Day After Tomorrow',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            status3 == null
                                ? Text('loading ...')
                                : Text(status3)
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Image.asset(
                    'assets/images/weather-app.png',
                    width: 190,
                  )
                ],
              ),
            )
          ],
        ),
      );
}

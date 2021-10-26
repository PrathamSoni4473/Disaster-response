import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlertsScreen extends StatefulWidget {
  final String name;
  final String location;

  AlertsScreen({
    @required this.name,
    @required this.location,
  });

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  final int alertCount = 1;
  final String city = 'Mumbai';
  final String liveloc = 'Maharashtra';
  final String country = 'India';
  String stringResponseWeather = '';
  List listResponseAlert = [];
  Map mapResponseAlert = {};

  Future apicall() async {
    // ================= Weather and  Air quality ======================
    http.Response responseWeather;
    responseWeather = await http.get(Uri.parse(
        "https://api.reliefweb.int/v1/disasters?appname=rwint-user-0&profile=list&preset=latest"));
    if (responseWeather.statusCode == 200) {
      setState(() {
        stringResponseWeather = responseWeather.body;
        mapResponseAlert = json.decode(responseWeather.body);
        listResponseAlert = mapResponseAlert["data"];
        print(listResponseAlert[0]["fields"]["name"]);
      });
    }
  }

  void initState() {
    super.initState();
    apicall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(153, 57, 85, 1),
        toolbarHeight: 75,
        title: const Text('Latest Alerts'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(174, 118, 166, 1),
              Color.fromRGBO(163, 195, 217, 1),
            ],
          ),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromRGBO(233, 236, 245, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child:
                    Text(listResponseAlert[index]["fields"]["name"].toString()),
              ),
            );
          },
          itemCount: listResponseAlert == null ? 0 : listResponseAlert.length,
        ),
      ),
    );
  }
}

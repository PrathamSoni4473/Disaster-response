import './alerts_screen.dart';
import './map_screen.dart';
import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import './precaution_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../global/globals.dart' as globals;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DisasterHome extends StatefulWidget {
  @override
  State<DisasterHome> createState() => _DisasterHomeState();
}

class _DisasterHomeState extends State<DisasterHome> {
  String userName = 'DazzledSoul';

  String name = 'Pratham';

  void get_location() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lat = double.parse("${position.latitude}");
    var long = double.parse("${position.longitude}");

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark placeMark = placemarks[0];

      globals.state = placeMark.administrativeArea;
      globals.country = placeMark.country;
      globals.city = placeMark.locality;
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    EasyLoading.show(status: 'Getting location...');
    get_location();
  }

  void goToAlerts(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AlertsScreen(
        name: name,
        location: globals.city,
      );
    }));
  }

  void goToweather(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GoogleMapScreen(
                  name: name,
                  city: globals.city,
                  state: globals.state,
                  country: globals.country,
                )));
  }

  void goToPrecautions(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return PrecautionScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(153, 57, 85, 1),
        // toolbarHeight: 75,
        title: Text(
          'Hello, $name',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      drawer: MainDrawer(userName),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => goToAlerts(context),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/1500/1500374.png',
                            width: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Latest Alerts',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => goToweather(context),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/2994/2994319.png',
                            width: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Weather',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Precautions to take:',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Container(
              width: double.infinity,
              height: 325,
              child: Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/4643/4643191.png',
                        fit: BoxFit.contain,
                        width: 200,
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        child: const Text('Precautions'),
                        onPressed: () => goToPrecautions(context),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(153, 57, 85, 1),
                            padding: const EdgeInsets.all(10),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

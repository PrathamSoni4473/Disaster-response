import './precautionScreens/wildfire.dart';
import './precautionScreens/drought.dart';
import './precautionScreens/volcano.dart';
import './precautionScreens/hurricane.dart';
import './precautionScreens/landslides.dart';
import './precautionScreens/earthquake.dart';
import './precautionScreens/floods.dart';
import 'package:flutter/material.dart';

class PrecautionScreen extends StatelessWidget {
  void goToFlood(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Floods();
    }));
  }

  void goToEarthquake(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Earthquake();
    }));
  }

  void goToLandslide(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Landslide();
    }));
  }

  void goToHurricane(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Hurricane();
    }));
  }

  void goToVolcano(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Volcano();
    }));
  }

  void goToDrought(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Drought();
    }));
  }

  void goToWildfire(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Wildfire();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(153, 57, 85, 1),
          toolbarHeight: 75,
          title: Text(
            'Precautions',
            style: Theme.of(context).textTheme.headline1,
          ),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () => goToFlood(context),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Image.asset(
                            'assets/images/flood.png',
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Center(
                          child: Text(
                            'Flood',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => goToEarthquake(context),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Image.asset(
                            'assets/images/earthquake.png',
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Center(
                          child: Text(
                            'Earthquakes',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => goToLandslide(context),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(
                            'assets/images/landslide.png',
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Center(
                          child: Text(
                            'Landslides',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => goToHurricane(context),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(
                            'assets/images/cyclone.png',
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Center(
                          child: Text(
                            'Hurricane',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => goToVolcano(context),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Image.asset(
                            'assets/images/volcano.png',
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Center(
                          child: Text(
                            'Volcano Explosion',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => goToDrought(context),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Image.asset(
                            'assets/images/drought.png',
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Center(
                          child: Text(
                            'Drought',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => goToWildfire(context),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/2321/2321698.png',
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Center(
                          child: Text(
                            'Wildfires',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

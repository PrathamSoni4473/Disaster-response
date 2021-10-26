import 'package:flutter/material.dart';

class Earthquake extends StatelessWidget {
  List beforeSteps = [
    'Make sure you have a fire extinguisher, first aid kit, a battery-powered radio, a flashlight, and extra batteries at home.',
    'Learn first aid.',
    'Learn how to turn off the gas, water, and electricity.',
    'Make up a plan of where to meet your family after an earthquake.',
    "Don't leave heavy objects on shelves (they'll fall during a quake).",
    'Anchor heavy furniture, cupboards, and appliances to the walls or floor.',
    'Learn the earthquake plan at your school or workplace.',
  ];
  List duringSteps = [
    "Stay calm! If you're indoors, stay inside. If you're outside, stay outside.",
    "If you're indoors, stand against a wall near the center of the building, stand in a doorway, or crawl under heavy furniture",
    "If you're outdoors, stay in the open away from power lines or anything that might fall.",
    "Don't use matches, candles, or any flame. Broken gas lines and fire don't mix.",
    "If you're in a car, stop the car and stay inside the car until the earthquake stops.",
    "Don't use elevators (they may shut down).",
  ];
  List supplies = [
    'Water',
    'Food',
    'Flashlight',
    'First aid kit',
    'Medicines',
    'Cash',
    'Cellphone and charger',
  ];

  Widget buildContainer(Widget child) {
    return Container(
      height: 300,
      width: 300,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(20),
      child: child,
    );
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
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Image.asset('assets/images/earthquake.png'),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Before the Earthquake',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                buildContainer(ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text(beforeSteps[index]),
                    );
                  },
                  itemCount: beforeSteps.length,
                )),
                const Divider(
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'During the Earthquake',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                buildContainer(ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text(duringSteps[index]),
                    );
                  },
                  itemCount: duringSteps.length,
                )),
                const Divider(
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Important Supplies',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                buildContainer(ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text(supplies[index]),
                    );
                  },
                  itemCount: supplies.length,
                )),
              ],
            ),
          ),
        ));
  }
}

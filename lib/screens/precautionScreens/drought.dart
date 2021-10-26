import 'package:flutter/material.dart';

class Drought extends StatelessWidget {
  // List beforeSteps = [
  //   'Assembling an emergency preparedness kit.',
  //   'Creating a household evacuation plan that includes your pets.',
  //   'Staying informed about your community’s risk and response plans.',
  //   'Ensuring each family member knows how to get back in touch if you are separated during an emergency.',
  // ];
  List duringSteps = [
    'Avoid flushing the toilet unnecessarily. Dispose of tissues, insects, and other similar waste in the trash rather than the toilet.',
    'Avoid taking baths. Take short showers; turn on water only to get wet and lather and then again to rinse off.',
    'Avoid letting the water run while brushing your teeth, washing your face or shaving.',
    'Place a bucket in the shower to catch excess water for watering plants.',
    'Operate automatic dishwashers only when they are fully loaded. Use the "light wash" feature, if available, to use less water.',
    'Hand wash dishes by filling two containers—one with soapy water and the other with rinse water containing a small amount of chlorine bleach.',
    'Clean vegetables in a pan filled with water rather than running water from the tap.',
    'Store drinking water in the refrigerator. Do not let the tap run while you are waiting for water to cool.',
    'Avoid wasting water waiting for it to get hot. Capture it for other uses such as plant watering or heat it on the stove or in a microwave.',
  ];
  List supplies = [
    'Water (one gallon per person per day for several days, for drinking and sanitation)',
    'Food (at least a three-day supply of non-perishable food)',
    'Battery-powered or hand crank radio and a NOAA Weather Radio with tone alert',
    'Flashlight',
    'First aid kit',
    'Extra batteries',
    'Whistle (to signal for help)',
    'Dust mask (to help filter contaminated air)',
    'Plastic sheeting and duct tape (to shelter in place)',
    'Moist towelettes, garbage bags and plastic ties (for personal sanitation)',
    'Wrench or pliers (to turn off utilities)',
    'Manual can opener (for food)',
    'Local maps',
    'Cell phone with chargers and a backup battery',
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
                  child: Image.asset('assets/images/drought.png'),
                ),
                // Container(
                //   margin: EdgeInsets.all(10),
                //   child: Text(
                //     'Before Drought',
                //     style: Theme.of(context).textTheme.headline2,
                //   ),
                // ),
                // buildContainer(ListView.builder(
                //   itemBuilder: (ctx, index) {
                //     return ListTile(
                //       leading: CircleAvatar(
                //         child: Text('#${(index + 1)}'),
                //       ),
                //       title: Text(beforeSteps[index]),
                //     );
                //   },
                //   itemCount: beforeSteps.length,
                // )),
                // const Divider(
                //   color: Colors.black,
                // ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'During Drought',
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

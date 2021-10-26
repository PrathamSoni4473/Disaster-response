import 'package:flutter/material.dart';

class Volcano extends StatelessWidget {
  List beforeSteps = [
    'Assembling an emergency preparedness kit.',
    'Creating a household evacuation plan that includes your pets.',
    'Staying informed about your community’s risk and response plans.',
    'Ensuring each family member knows how to get back in touch if you are separated during an emergency.',
  ];
  List duringSteps = [
    'Close all windows, doors, and fireplace or woodstove dampers.',
    'Turn off all fans and heating and air conditioning systems.',
    'Bring pets and livestock into closed shelters.',
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
                  child: Image.asset('assets/images/volcano.png'),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Before the Volcano Eruption',
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
                    'During the Volcano eruption',
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

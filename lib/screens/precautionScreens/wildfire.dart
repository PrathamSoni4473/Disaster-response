import 'package:flutter/material.dart';

class Wildfire extends StatelessWidget {
  List beforeSteps = [
    'Create defensible space to separate your home from flammable vegetation and materials (minimum 30 ft)',
    'Adhere to all local fire and building codes and weed abatement ordinances.',
    'Keep all trees and shrub limbs trimmed so they do not come into contact with electrical wires or overhang your chimney (Do not trim around power lines yourself, call a professional).',
    'Prune all lower branches 8 feet from the ground.',
    'Keep trees adjacent to buildings free of dead or dying branches.',
    'Stack firewood away from your home and other buildings (Keep clearance arou,nd your piles).'
        'Keep roof surfaces clear of pine needles, leaves and debris at all ti,mes.'
        'Clean chimneys and check and maintain spark arres,ters twice a year.'
        'Keep rain gutters clear of debris at all times.',
  ];
  List duringSteps = [
    'Turn on a TV or radio to get the latest emergency information.',
    'If you have a ladder, prop it against the house so you and firefighters have access to roof.',
    'If hoses and adequate water are available set them up. Fill buckets with water.',
    'Remove combustible material from the area surrounding the house (lawn chairs, tables, etc.).',
    'Turn a light on in each room for visibility in case of smoke.',
    'Open or take down flammable drapes and curtains.',
    'Close all venetian blinds and non-flammable window coverings.',
  ];
  List supplies = [
    'Face masks or coverings',
    'Three-day supply of non-perishable food and three gallons of water per person',
    'Map marked with at least two evacuation routes',
    'Prescriptions or special medications',
    'Change of clothing',
    'Extra eyeglasses or contact lenses',
    'An extra set of car keys, credit cards, cash or traveler’s checks',
    'First aid kit',
    'Flashlight',
    'Battery-powered radio and extra batteries',
    'Sanitation supplies',
    'Copies of important documents (birth certificates, passports, etc.)',
    'Don’t forget pet food and water!',
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
                  child: Image.asset('assets/images/wildfire.png'),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Before Wildfire (only if you live near lot of trees)',
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
                    'During Wildfire',
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

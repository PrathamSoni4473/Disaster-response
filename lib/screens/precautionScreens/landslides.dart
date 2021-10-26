import 'package:flutter/material.dart';

class Landslide extends StatelessWidget {
  List beforeSteps = [
    'The key to staying safe is to prepare and to have an emergency plan in place.',
    'Find out if you live in an area where landslides could potentially happen. Landslides may also be referred to as mudslides, debris flows, mudflows or debris avalanches.,',
    'Listen to local news and weather reports for any potential landslide watches and warnings in your area.',
    'Talk with your family and neighbours about what you would do during a landslide. Identify a safe place to gather.',
    'Have practice drills with your family, so you know what to do and are prepared.',
  ];
  List duringSteps = [
    'Be prepared to evacuate at a moment’s notice.',
    'If you suspect imminent danger evacuate immediately. Inform affected neighbours if you can, and contact your public works, fire or police department. ',
    'Listen for unusual sounds that might indicate moving debris, such as trees cracking or boulders knocking together. ',
  ];
  List supplies = [
    'Prescription drugs (antibiotics and chronic & long term conditions drugs), 7-day supply',
    'Non-prescription drugs (aspirins, ibuprofen, and paracetamol), 7-day supply',
    'Bandages',
    'Sterilized gauze',
    'Antibiotic ointments',
    'Alcohol swabs',
    'First aid wound disinfectants',
    'Eyewash',
    'Adhesive tape',
    'Safety pins',
    'Scissors',
    'A pair of tweezers',
    'Thermometer',
    'Cold packs',
    'First aid manual',
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
                  child: Image.asset('assets/images/landslide.png'),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Before the Landslide',
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
                    'During the Landslide',
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

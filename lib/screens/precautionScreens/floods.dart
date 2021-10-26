import 'package:flutter/material.dart';

class Floods extends StatelessWidget {
  List beforeSteps = [
    'Do not throw garbage into drains and rivers.',
    'Put sandbags by exposed openings.',
    'Turn off gas and electricity. Unplug electrical appliances.',
    'Put dangerous, flammable or explosive liquids in a safe place and close containers securely.',
    'Seal important personal, legal and business documents in watertight containers and place above flood height.',
    'Take furniture to upper floors or raise on a sturdy table.'
        'Secure vehicles.',
  ];
  List duringSteps = [
    'Turn on a battery-powered radio.',
    'Evacuate and avoid flooded areas.',
    'Do not try to cross water courses.',
    'If your car gets stuck, abandon it immediately.',
  ];
  List supplies = [
    'Food and drinking water.',
    'First-aid equipment and medication.',
    'Bucket, cloth and scrubbers.',
    'Digging tools (spade or shovel).',
    'Flashlights and batteries.',
    'Covers and blankets.',
    'Wooden planks, hammer and nails.',
    'Waterproofing materials: sandbags, plastic sheeting and lumber.',
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
                  child: Image.asset('assets/images/flood.png'),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Before the Flood',
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
                    'During the Flood',
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

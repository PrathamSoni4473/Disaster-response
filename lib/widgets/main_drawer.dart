import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final String userName;

  MainDrawer(this.userName);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromRGBO(204, 214, 235, 1),
        child: Column(
          children: [
            Container(
              color: const Color.fromRGBO(174, 118, 166, 1),
              height: 200,
              width: double.infinity,
              child: Center(
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    userName,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              // alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Name : Pratham Soni',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.mail_outline),
                    title: Text(
                      'sonipratham4473@gmail.com',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_alert),
                    title: Text(
                      '5.5 / 10',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: Text(
                      'Sign out',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

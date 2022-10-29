

import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(


      initialIndex: 1,
      length: 3,


      child: Scaffold(
        backgroundColor: Colors.blueGrey,
            appBar: AppBar(
              title:  Text("Money Hunter", style: TextStyle(

                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.normal,


                letterSpacing: 1,
              )),
              bottom: TabBar(
                tabs: [
                  Tab(text: "Daily"),
                  Tab(text: "Weekly"),
                  Tab(text: "Monthly"),
                ],
              ),
            ),



        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's Daily here"),
            ),
            Center(
              child: Text("It's Weekly here"),
            ),
            Center(
              child: Text("It's Monthly here"),
            ),
          ],
        ),
      ),
    );
  }
}

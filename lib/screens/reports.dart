import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_display_name.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(height: 100),
      CustomDisplayName(userName:"Money Hunter",route: "reports",),
       Expanded(
         child: DefaultTabController(


          initialIndex: 1,
          length: 3,


          child: Scaffold(

            appBar: AppBar(

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
      ),
       )]),
    );
  }
}
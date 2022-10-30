import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/screens/chart.dart';
import 'package:money_manager/screens/splash.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mrx_charts/mrx_charts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MoneyManagerMain());
}
class MoneyManagerMain extends StatefulWidget {
  const MoneyManagerMain({Key? key}) : super(key: key);

  @override
  State<MoneyManagerMain> createState() => _MoneyManagerMainState();
}

class _MoneyManagerMainState extends State<MoneyManagerMain> {

  TextEditingController salaryController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MoneyManagerMain',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Splash(),
      );
  }


}

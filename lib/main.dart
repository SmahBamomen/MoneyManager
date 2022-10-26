import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    return MaterialApp(
      title: 'MoneyManagerMain',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Material(
      child: Container(
      decoration:  BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: CustomColors.colorWhit, // Gradient from https://learnui.design/tools/gradient-generator.html
      tileMode: TileMode.mirror,
    ),))));
  }


}

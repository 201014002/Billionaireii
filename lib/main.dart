import 'package:billionaireii/add_money.dart';
import 'package:billionaireii/balance.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 0;
  void addMoney() async {
    setState(() {
      balance = balance + 500.0;
    });
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('balance', balance);
    print(balance);
  }

  void loadBalance() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      balance = prefs.getDouble('balance')??0;
    });
  }
  @override
  void initState() {
    loadBalance();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Billionaireii'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.grey[800],
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Balance(balance: balance),
              AddMoneyButton(addMoneyFunction: addMoney,),
            ],
          ),
        ),
      ),
    );
  }
}

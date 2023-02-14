import 'package:flutter/material.dart';
import 'package:personal_expense/transaction.dart';
import './user-transaction.dart';
import './chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Personal Expense App',
        theme: ThemeData(primarySwatch: Colors.green),
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expense"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      // for scrolling we can use singleChildScrollView also
      body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Chart(),
            UserTransaction(),
          ]),
    );
  }
}

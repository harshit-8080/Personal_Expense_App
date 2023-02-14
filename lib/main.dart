import 'package:flutter/material.dart';
import 'package:personal_expense/transaction.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Personal Expense App', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction("1001", "new Ball", 1000, DateTime.now()),
    Transaction("1002", "new FootBall", 1000, DateTime.now()),
    Transaction("1003", "new Bat", 1000, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Personal Expense")),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child:
                  Card(color: Colors.blue, child: Text("CHART"), elevation: 5),
            ),
            Column(
              children: transaction.map((tx) {
                return Card(
                  child: Text(tx.title),
                );
              }).toList(),
            )
          ]),
    );
  }
}

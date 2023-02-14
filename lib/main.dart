import 'package:flutter/material.dart';
import 'package:personal_expense/transaction.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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
    Transaction("1001", "Cricket Ball", 1000, DateTime.now()),
    Transaction("1002", "Dinner ", 5000, DateTime.now()),
    Transaction("1003", "JavaScript Book", 4000, DateTime.now()),
    Transaction("1004", "HDFC Credit Card", 3000, DateTime.now()),
    Transaction("1005", "Car EMI", 5000, DateTime.now()),
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
            Card(
                child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(decoration: InputDecoration(labelText: "Title")),
                  TextField(decoration: InputDecoration(labelText: "Amount")),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.purple)),
                    child: Text(
                      "Add Transaction",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: null,
                  )
                ],
              ),
            )),
            Column(
              children: transaction.map((tx) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text("\$${tx.amount.toString()}"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tx.title.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black)),
                        Text(DateFormat.yMMMd().format(tx.date)),
                      ],
                    )
                  ],
                ));
              }).toList(),
            )
          ]),
    );
  }
}

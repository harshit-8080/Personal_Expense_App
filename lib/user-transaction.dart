import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:personal_expense/new-transaction.dart';
import 'package:personal_expense/transaction-list.dart';
import 'package:flutter/material.dart';
import './transaction-list.dart';
import './new-transaction.dart';
import './transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transaction = [
    Transaction("1001", "Cricket Ball", 1000, DateTime.now()),
    Transaction("1001", "Cricket Ball", 1000, DateTime.now()),
    Transaction("1001", "Cricket Ball", 1000, DateTime.now()),
    Transaction("1001", "Cricket Ball", 1000, DateTime.now()),
    Transaction("1001", "Cricket Ball", 1000, DateTime.now()),
  ];

  void startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  void _addTransaction(String title, double amount) {
    if (title.isEmpty || amount < 0) {
      return;
    }
    final newTx = Transaction("1006", title, amount, DateTime.now());

    setState(() {
      transaction.add(newTx);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // NewTransaction(_addTransaction),
        TransactionList(transaction),
        FloatingActionButton(
          onPressed: () {
            startNewTransaction(context);
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}

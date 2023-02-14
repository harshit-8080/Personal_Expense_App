import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function handleAddTransaction;

  NewTransaction(this.handleAddTransaction);

  // String? titleInput;
  // String? amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleController,

            // onChanged: (value) {
            //   titleInput = value;
            // },
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            // onChanged: (value) {
            //   amountInput = value;
            // },
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple)),
            child: Text(
              "Add Transaction",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              handleAddTransaction(
                  titleController.text, double.parse(amountController.text));
            },
          )
        ],
      ),
    ));
  }
}

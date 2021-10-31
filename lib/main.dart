import 'package:flutter/material.dart';

import 'transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'HKS blow off', amount: 80.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'SSR Starshark', amount: 50.99, date: DateTime.now()),
  ];

  // String title = '';
  // String amount = '';

  final title = TextEditingController();
  final amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Expences'),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Container(
                child: Text('1st task'),
                width: double.infinity,
                color: Colors.amber,
                height: 30,
              ),
              elevation: 10,
            ),
            Card(
                child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: title,
                    // onChanged: (value) {
                    //   title = value;
                    // },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amount,
                    // onChanged: (value) {
                    //   amount = value;
                    // },
                  ),
                  FlatButton(
                    onPressed: () {
                      print(title.text);
                      print(amount.text);
                    },
                    child: Text('Add Transaction'),
                    textColor: Colors.blue,
                  )
                ],
              ),
            )),
            Column(
                children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent, width: 2)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      // '$tx'+ tx.amount.toString(),
                      '\$${tx.amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blueAccent),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ));
            }).toList())
          ],
        ));
  }
}

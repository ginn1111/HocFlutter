import 'package:flutter/material.dart';
import 'package:list_tile/TransactionList.dart';
import 'Transaction.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Transaction transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> transactions = List<Transaction>();
  var _contentEditTextController = new TextEditingController();
  var _amountEditTextController = new TextEditingController();

  void _showBottomModalSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: this.context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                TextField(
                  controller: _contentEditTextController,
                  onChanged: (text) {
                    this.setState(() {
                      transaction.content = text;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter content',
                  ),
                ),
                TextField(
                  controller: _amountEditTextController,
                  onChanged: (text) {
                    this.setState(() {
                      transaction.amount = double.tryParse(text) ?? 0.0;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter password',
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: SizedBox(
                        child: RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            'Save',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              transaction.createdDate = DateTime.now();
                              transactions.add(transaction);
                              transaction =
                                  Transaction(content: '', amount: 0.0);
                              _contentEditTextController.text = '';
                              _amountEditTextController.text = '';
                            });
                          },
                        ),
                        height: 40,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: SizedBox(
                        child: RaisedButton(
                          color: Colors.red,
                          child: Text(
                            'Cancel',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        height: 40,
                      ))
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('You press floating button');
        },
      ),
      appBar: AppBar(
        title: Text('Transaction App'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print('You press add');
              })
        ],
      ),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 10)),
                ButtonTheme(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: FlatButton(
                      child: Text(
                        'Tap here',
                        style: TextStyle(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      onPressed: () {
                        _showBottomModalSheet();
                      },
                    )),
                TransactionList(
                  transactions: transactions,
                )
              ],
            ),
          )),
    );
  }
}

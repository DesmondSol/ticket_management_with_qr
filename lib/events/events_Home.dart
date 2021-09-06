import './transaction_list.dart';

import './new_transaction.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

class MyHomePage extends StatefulWidget {

  @override
  MyHomeePage createState() => MyHomeePage();
}

class MyHomeePage extends State<MyHomePage> {
  final List<Transaction> _userTran = [
       Transaction(
           id: '1', title: 'general Gathering', participantAmount: 49, date: DateTime.now()),
    //   Transaction(
    //       id: '2', title: 'New slippers', amount: 9.9, date: DateTime.now()),
    //   Transaction(
    //       id: '3', title: 'New phone', amount: 149.9, date: DateTime.now())
  ];


  void _addNewTransa(String txtitle, int participantAmount, DateTime chosenDate) {
    int b;
    if (_userTran.isEmpty) {
      b = 1;
      //print(b);
    } else {
      b = int.parse(_userTran.last.id) + 1;
    }
    // print('$b $txtitle $txamount');
    final newTx = Transaction(
      id: b.toString(),
      title: txtitle,
      participantAmount: participantAmount,
      date: chosenDate,
    );

    setState(() {
      _userTran.add(newTx);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      _userTran.removeWhere((element) => element.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          //  return NewTransaction(_addNewTransa);
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransa),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(
          //actionsIconTheme: IconThemeData(color: Colors.white10, size: 36),
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Add',
                onPressed: () {
                  _startAddNewTransaction(context);
                }
                //     _startAddNewTransaction(co): Builder(
                // builder: (context) => _startAddNewTransaction(context)
                ),
            IconButton(
              icon: const Icon(Icons.account_box_outlined),
              tooltip: 'About creators',
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text(
                    'made by Solomon T \n contact me: soltig66@gmail.com',
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  //      duration: Duration(milliseconds: 200),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
          leading: Icon(Icons.access_time_sharp),
          leadingWidth: 70,
          title: const Text('Events'),
          //  centerTitle: true,
        ),
        body: SingleChildScrollView(
            //for full screen scroll
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[TransactionList(_userTran,deleteTransaction)],
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => _startAddNewTransaction(context),
            child: Icon(Icons.add),
          ),
        ));
  }
}

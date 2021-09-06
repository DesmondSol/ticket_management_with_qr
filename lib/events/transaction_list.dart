import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';

class TransactionList extends StatelessWidget {
  //
  final List<Transaction> transaction;
  final deleteTx;
  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text('No of'),
                Text(
                  'Participants',
                ),
              ],
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              'Title',
            )
          ],
        ),
        Container(
          height: 500,
          child: transaction.isEmpty
              ? Column(
                  children: <Widget>[
                    Text('No transaction yet',
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 200,
                        child: Image.asset('../assets/images/no_d.png',
                            fit: BoxFit.cover))
                  ],
                )
              : ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                                child: Text(
                                    '${transaction[index].participantAmount.toStringAsFixed(0)}')),
                          ),
                        ),
                        title: Text(transaction[index].title,
                            style: Theme.of(context).textTheme.headline6),
                        subtitle: Text(
                          DateFormat.yMMMd().format(transaction[index]
                              .date), //'yyyy-MM-dd date constructor
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transaction[index].id),
                        ),
                      ),
                    );
                  },
                  itemCount: transaction.length,
                  //  children: transaction.map((tx) {}).toList(),
                ),
        ),
      ],
    );
  }
}

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
              width: 74,
            ),
            Column(
              children: [
                Text(
                  'Name',
                ),
              ],
            ),
            SizedBox(
              width: 140,
            ),
            Text(
              'Phone no',
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
                        leading: Padding(
                          padding: EdgeInsets.all(2),
                          child: FittedBox(
                              child:
                                  Text('${transaction[index].id.toString()}')),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: Column(
                                children: [
                                  Text(transaction[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                  Text(
                                    transaction[index]
                                        .email, //'yyyy-MM-dd date constructor
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   width: 34,
                            // ),
                            FittedBox(
                              child: Text(
                                transaction[index].phoneNo.toString(),
                              ),
                            ),
                            OutlinedButton(
                              child: Text(
                                "Qr code",
                                //           style: TextStyle(fontSize: 20.0),
                              ),
                              // style: Borde,
                              // highlightedBorderColor: Colors.red,
                              // shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(15)),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        // subtitle: Text(
                        //   transaction[index]
                        //       .email, //'yyyy-MM-dd date constructor
                        //   style: TextStyle(color: Colors.blueGrey),
                        //   textAlign: TextAlign.left,
                        // ),
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

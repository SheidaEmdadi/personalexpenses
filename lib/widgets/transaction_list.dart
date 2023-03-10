import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
        children: <Widget>[
          Text(
            'No transactions added yet!',
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 200,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              )),
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
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(
                      child: Text(
                          '\$' + transactions[index].amount.toString())),
                ),
              ),
              title: Text(
                transactions[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteTx(transactions[index].id),
                color: Theme.of(context).errorColor,
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}

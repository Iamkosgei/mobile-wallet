import 'package:flutter/material.dart';

import 'Transaction.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Transaction> transactions = List();
    transactions.addAll([
      Transaction("Airtime", "200", Type.Credit, "20-5-2017", false),
      Transaction("Received", "1000", Type.Debit, "20-5-2017", true),
      Transaction("Water Bill", "200", Type.Credit, "20-5-2017", false),
      Transaction("Buy Goods", "200", Type.Credit, "20-5-2017", false),
      Transaction("Sent", "200", Type.Credit, "20-5-2017", false),
      Transaction("Recived", "200", Type.Credit, "20-5-2017", false),
    ]);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              topSection(context),
              header(),
              accountContainer(context),
            ]),
            recentTransactions(),
            Expanded(child: transactionsListView(context, transactions))
          ],
        ),
        bottomNavigationBar: BottomBar());
  }

  Container topSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      alignment: Alignment.topCenter,
      color: Colors.green,
    );
  }

  Container header() {
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "N-Pesa",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            CircleAvatar(
                backgroundColor: Colors.white54,
                child: Image.network(
                    "https://img.icons8.com/plasticine/2x/user.png"))
          ],
        ));
  }

  Container accountContainer(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: new EdgeInsets.only(
          top: (MediaQuery.of(context).size.height * 0.3) / 2,
          right: 20.0,
          left: 20.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Account Balance',
                        style: TextStyle(
                          color: Colors.grey,
                          // fontSize: 20.0,
                        )),
                    Text("KSH 10,000",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    accountTotal("Received", "6,000"),
                    accountTotal("Sent", "4,000"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container accountTotal(String name, String amount) {
    return Container(
      width: 120,
      height: 60,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'KSH: $amount',
                style: TextStyle(
                  color: name == "Received" ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(name == "Received" ? Icons.arrow_downward : Icons.arrow_upward,
              color: name == "Received" ? Colors.green : Colors.red)
        ],
      ),
    );
  }

  Row recentTransactions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text("Recent Transactions",
              style: TextStyle(color: Colors.black87, fontSize: 17.0)),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("View All",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)),
        )
      ],
    );
  }

  ListView transactionsListView(context, transactions) {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return TransactionItem(
            transaction: transactions[index],
          );
        });
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              color: Colors.green,
              onPressed: () {},
              child: Text(
                "HOME",
                style: TextStyle(color: Colors.white),
              ),
            ),
            OutlineButton(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 28.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              borderSide: BorderSide(color: Colors.green, width: 1.0),
              onPressed: () {},
              child: Text("SEND"),
            ),
            OutlineButton(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 28.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              borderSide: BorderSide(color: Colors.green, width: 1.0),
              onPressed: () {},
              child: Text("STATEMENT"),
            )
          ],
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({Key key, this.transaction}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                spreadRadius: -7,
                offset: Offset(0, 10),
                color: Colors.green.withOpacity(.3),
                blurRadius: 25,
              ),
            ]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transaction.name,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    transaction.date,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text('KSH: ${transaction.amount}'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    transaction.comingIn
                        ? Icons.arrow_downward
                        : Icons.arrow_upward,
                    color: transaction.comingIn ? Colors.green : Colors.red,
                  ),
                  Text(
                    transaction.transactionType.toString().split('.').last,
                    style: TextStyle(
                        color:
                            transaction.comingIn ? Colors.green : Colors.red),
                  )
                ],
              )
            ])

        //  Column(children: <Widget>[
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       Text(transaction.name),
        //       Text(transaction.amount),
        //       Icon(
        //         transaction.comingIn ? Icons.arrow_downward : Icons.arrow_upward,
        //         color: transaction.comingIn ? Colors.green : Colors.red,
        //       )
        //     ],
        //   ),
        //   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //     Text(transaction.date),
        //     Text(
        //       transaction.transactionType.toString().split('.').last,
        //       style: TextStyle(
        //           color: transaction.comingIn ? Colors.green : Colors.red),
        //     )
        //   ])
        // ]
        // ),
        );
  }
}

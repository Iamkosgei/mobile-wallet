enum Type { Credit, Debit }

class Transaction {
  String name;
  String amount;
  Type transactionType;
  String date;
  bool comingIn;

  Transaction(
      this.name, this.amount, this.transactionType, this.date, this.comingIn);
}

class SlaveUsers {
  String? name;
  String? amount;
  String? lastTransactionDate;

  SlaveUsers({this.name, this.amount, this.lastTransactionDate});

  SlaveUsers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    lastTransactionDate = json['lastTransactionDate'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "amount": amount,
      "lastTransactionDate": lastTransactionDate,
    };
  }
}

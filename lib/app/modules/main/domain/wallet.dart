class Wallet {
  String? amount;
  String? lastTransactionDate;

  Wallet({ this.amount, this.lastTransactionDate});

  Wallet.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    lastTransactionDate = json['lastTransactionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['lastTransactionDate'] = lastTransactionDate;
    return data;
  }
}

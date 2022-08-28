class Activity {
  String? amount;
  String? lastTransactionDate;

  Activity({ this.amount, this.lastTransactionDate});

  Activity.fromJson(Map<String, dynamic> json) {
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

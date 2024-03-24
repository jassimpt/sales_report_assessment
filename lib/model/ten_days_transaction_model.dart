class LastTenDaysTransactions {
  String? id;
  String? date;
  int? amount;
  String? type;

  LastTenDaysTransactions(
      {required this.amount,
      required this.date,
      required this.id,
      required this.type});

  factory LastTenDaysTransactions.fromJson(Map<String, dynamic> json) {
    return LastTenDaysTransactions(
      amount: json["amount"],
      date: json["date"],
      id: json["id"],
      type: json["type"],
    );
  }
}

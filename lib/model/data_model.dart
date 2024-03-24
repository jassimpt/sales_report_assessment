import 'package:assessment/model/ten_days_transaction_model.dart';

class DataModel {
  int? totalServiceAmount;
  int? commissionEarned;
  int? totalSalesAmount;
  int? advanceTaken;
  List<LastTenDaysTransactions>? lastTenDaysTransactions;

  DataModel({
    required this.advanceTaken,
    required this.commissionEarned,
    required this.lastTenDaysTransactions,
    required this.totalSalesAmount,
    required this.totalServiceAmount,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<LastTenDaysTransactions> transaction = [];
    if (json["lastTenDaysTransactions"] != null) {
      json['lastTenDaysTransactions'].forEach((v) {
        transaction.add(LastTenDaysTransactions.fromJson(v));
      });
    }
    return DataModel(
      advanceTaken: json["advanceTaken"],
      commissionEarned: json["commissionsEarned"],
      lastTenDaysTransactions: transaction,
      totalSalesAmount: json["totalSalesAmount"],
      totalServiceAmount: json["totalServicesAmount"],
    );
  }
}

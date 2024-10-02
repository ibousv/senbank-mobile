// Customer model

import 'package:senbank/src/models/account_model.dart';
import 'package:senbank/src/models/transaction_model.dart';
import 'package:senbank/src/models/users_model.dart';

class Customer extends UserModel {
  Account? _account;
  List<Transaction> transactions = [];
  Customer(super.name, super.email, super.number, super.pin, super.role,
      Account account) {
    _account = account;
  }


  Account? getAccount() {
    return _account;
  }

  void setAccount(Account account) {
    _account = account;
  }

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  List<Transaction> getTransaction() {
    return transactions;
  }

  Map<Object, Object?> toJson(Customer? c) {
    return {
      "name": c?.getName(),
      "email": c?.getEmail(),
      "phonenumber": c?.getPhoneNumber(),
      "pin": c?.getPin(),
      "role": c?.getRole(),
      "account": {
        "amount": c?.getAccount()?.getAmount(),
        "isSuspended": c?.getAccount()?.getStatus(),
        "card": {
          "expirationDate": c?.getAccount()?.getCard()?.getdate(),
          "number": c?.getAccount()?.getCard()?.getNumber()
        },
        "type": c?.getAccount()?.getType()
      },
      "transactions": c?.getTransaction().map((e) => e.toJson()).toList()
    };
  }
}

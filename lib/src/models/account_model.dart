// Account Model

import 'package:senbank/src/models/bankcard_model.dart';

class Account {
  double? _amount;
  bool? _isSuspended;
  BankCard? _card;
  String? _type;

  Account(double amount, BankCard card, String type) {
    _amount = amount;
    _isSuspended = false;
    _card = card;
    _type = type;
  }

  // Getter & Setter
  void setAmount(amount) {
    _amount = amount;
  }

  void setStatus(bool status) {
    _isSuspended = status;
  }

  double? getAmount() {
    return _amount;
  }

  bool? getStatus() {
    return _isSuspended;
  }

  BankCard? getCard() {
    return _card;
  }

  String? getType() {
    return _type;
  }

  void setType(String type) {
    _type = type;
  }
}

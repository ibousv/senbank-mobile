// Transaction Model

import 'package:senbank/src/models/customer_model.dart';

class Transaction {
  static int _id = 0;
  String? _type;
  Customer? _sender;
  Customer? _receiver;
  double? _amount;
  DateTime? _date;

  Transaction(Customer sender, Customer? receiver, String type, double amount,
      DateTime date) {
    _id = _id + 1;
    _sender = sender;
    _receiver = receiver;
    _type = type;
    _amount = amount;
    _date = date;
  }

  // Getter & Setter

  void setType(type) {
    _type = type;
  }

  void setSender(sender) {
    _sender = sender;
  }

  void setReceiver(receiver) {
    _receiver = receiver;
  }

  void setAmount(amount) {
    _amount = amount;
  }

  void setDate(date) {
    _date = date;
  }

  int? getId() {
    return _id;
  }

  String? getTxType() {
    return _type;
  }

  Customer? getSender() {
    return _sender;
  }

  Customer? getReceiver() {
    return _receiver;
  }

  double? getAmount() {
    return _amount;
  }

  DateTime? getDate() {
    return _date;
  }

  Map<String, dynamic> toJson() {
    return {
      'sender': _sender?.getEmail(),
      'receiver': _receiver?.getEmail(),
      'type': _type,
      'amount': _amount,
      'date': _date?.toLocal(),
    };
  }
}

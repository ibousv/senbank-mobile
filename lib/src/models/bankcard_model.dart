// BankCard Model

class BankCard {
  int? _number;
  String? _expdate;

  BankCard(expdate) {
    _number = 1000000000000000;
    _expdate = expdate;
  }

  // Getters
  int? getNumber() {
    return _number;
  }

  String? getdate() {
    return _expdate;
  }
}

import 'package:senbank/src/config/utils/account_type.dart';
import 'package:senbank/src/config/utils/transaction_type.dart';
import 'package:senbank/src/models/customer_model.dart';
import 'package:senbank/src/models/transaction_model.dart';
import 'package:senbank/src/services/account_services.dart';

class TransactionServices {
  AccountService accountService = AccountService();

  double transactionFee(Customer? customer, amount) {
    if (customer != null && customer.getAccount() != null) {
      String? accountType = customer.getAccount()!.getType(); // Now safe

      if (accountType == AccountType.epargne.toString()) {
        double fee = 1 / 100;
        return amount * fee;
      } else if (accountType == AccountType.courant.toString()) {
        double fee = 1.25 / 100;
        return amount * fee;
      }
    }

    return 0;
  }

  Future<void> deposit(Customer client, double amount) {
    Transaction tx = Transaction(client, null,
        TransactionType.deposit.toString(), amount, DateTime.now());
    client.getAccount()!.setAmount(client.getAccount()!.getAmount()! + amount);
    client.addTransaction(tx);
    return accountService
        .updateAccount(client)
        .then((value) => print("deposit with success"));
  }

  Future<void> withdraw(Customer client, double amount) {
    if (client.getAccount()!.getAmount()! >= amount) {
      Transaction tx = Transaction(client, null,
          TransactionType.withdraw.toString(), amount, DateTime.now());
      client
          .getAccount()!
          .setAmount(client.getAccount()!.getAmount()! - amount);
      client.addTransaction(tx);
      return accountService
          .updateAccount(client)
          .then((value) => print("withdraw with success"));
    }
    return Future.error("Insufficient funds");
  }

  Future<void> transfer(Customer from, Customer to, double amount) {
    double fee = transactionFee(from, amount);
    Transaction tx = Transaction(
        from, to, TransactionType.send.toString(), amount, DateTime.now());
    Transaction tx2 = Transaction(from, to, TransactionType.receive.toString(),
        amount - fee, DateTime.now());
    from.addTransaction(tx);
    to.addTransaction(tx2);
    from
        .getAccount()!
        .setAmount(from.getAccount()!.getAmount()! - (amount - fee));
    to.getAccount()!.setAmount(to.getAccount()!.getAmount()! + amount);
    return accountService
        .updateAccount(from)
        .then((value) => print("transfer with success"))
        .then((value) => accountService.updateAccount(to));
  }
}

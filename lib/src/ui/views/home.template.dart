import 'package:flutter/material.dart';
import 'package:senbank/src/config/utils/account_type.dart';
import 'package:senbank/src/config/utils/role_type.dart';
import 'package:senbank/src/models/account_model.dart';
import 'package:senbank/src/models/admin_model.dart';
import 'package:senbank/src/models/bankcard_model.dart';
import 'package:senbank/src/models/customer_model.dart';
import 'package:senbank/src/services/account_services.dart';
import 'package:senbank/src/services/transaction_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Test -- Adding Users
  static BankCard bankCard = BankCard("03/27");
  static Account account =
      Account(1000, bankCard, AccountType.courant.toString());
  static Account account1 =
      Account(1000, bankCard, AccountType.epargne.toString());
  Customer customer = Customer("Test User", "testuser@gmail.com", 771234567,
      1234, RoleType.customer.toString(), account1);
  Customer customer1 = Customer("Pape Latyr Sene", "ifall0282@gmail.com",
      771234567, 1234, RoleType.customer.toString(), account);
  Admin admin =
      Admin("admin", "admin@gmail.com", 706879924, 1234, RoleType.admin.name);
  AccountService service = AccountService();
  // Transaction Test
  TransactionServices transactionServices = TransactionServices();

  openShowDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          ElevatedButton(
              onPressed: () {
                //service.createAccount(customer);
                //service.updateAccount(customer1);
                //service.suspendAccount(customer1);
                //service.reactivateAccount(customer1);
                //service.deleteAccount(customer1);
                //service.createAccount(admin);
                print(customer.getAccount()!.getAmount());
                //transactionServices.deposit(customer, 500);
                //transactionServices.withdraw(customer, 500);
                transactionServices.transfer(customer, customer1, 500);
                print(customer.getAccount()!.getAmount());
                //transactionServices.transfer(customer, customer1, 100);
                Navigator.pop(context);
              },
              child: const Text("Testing"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TEST"),
        backgroundColor: const Color.fromARGB(108, 135, 36, 155),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openShowDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
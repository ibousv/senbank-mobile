import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:senbank/src/models/customer_model.dart';

class AccountService {
  final FirebaseFirestore database = FirebaseFirestore.instance;

  Future<void> createAccount(Customer customer) {
    return database
        .collection('users')
        .doc(customer.getEmail())
        .set({
          "account": {
            "amount": customer.getAccount()?.getAmount(),
            "isSuspended": customer.getAccount()?.getStatus(),
            "card": {
              "expirationDate": customer.getAccount()?.getCard()?.getdate(),
              "number": customer.getAccount()?.getCard()?.getNumber()
            },
            "type": customer.getAccount()?.getType()
          },
          "name": customer.getName(),
          "email": customer.getEmail(),
          "phonenumber": customer.getPhoneNumber(),
          "pin": customer.getPin(),
          "role": customer.getRole(),
          "transaction": customer.getTransaction()
        })
        // ignore: avoid_print
        .onError((error, stackTrace) => print(error))
        // ignore: avoid_print
        .then((value) => print('customer created successfully'));
  }

  Future<void> updateAccount(Customer customer) {
    return database
        .collection('users')
        .doc(customer.getEmail())
        .update(customer.toJson(customer))
        .onError((error, stackTrace) => print(error))
        .then((value) => print('customer updated successfully'));
  }

  Future<void> deleteAccount(Customer customer) {
    /*  CollectionReference customers =
        FirebaseFirestore.instance.collection('customers');
    await customers.doc(customer.getEmail()).delete(); */
    return database
        .collection('users')
        .doc(customer.getEmail())
        .delete()
        // ignore: avoid_print
        .onError((error, stackTrace) => print(error))
        .then((value) => print('customer deleted successfully'));
  }

  Future<void> suspendAccount(Customer customer) {
    /* CollectionReference customers =
        FirebaseFirestore.instance.collection('customers');
    customers
        .doc(customer.getEmail())
        .update({'account.isSuspended': true}); */
    return database
        .collection('users')
        .doc(customer.getEmail())
        .update({"account.isSuspended": true}).onError(
            (error, stackTrace) => print(error));
  }

  Future<void> reactivateAccount(Customer customer) {
    /* CollectionReference customers =
        FirebaseFirestore.instance.collection('customers');
    await customers
        .doc(customer.getEmail())
        .update({'account.isSuspended': false}); */
    return database
        .collection('users')
        .doc(customer.getEmail())
        .update({"account.isSuspended": false}).onError(
            (error, stackTrace) => print(error));
  }
}

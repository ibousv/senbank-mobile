// User Model

//import 'package:senbank/src/config/utils/role_type.dart';

class UserModel {
  String? _name;
  String? _email;
  int? _phonenumber;
  int? _pin;
  String? _role;

  UserModel(String name, String email, int number, int pin, String role) {
    _name = name;
    _email = email;
    _phonenumber = number;
    _pin = pin;
    _role = role;
  }

  // Getter and Setter
  String? getRole() {
    return _role;
  }

  void setRole(String role) {
    _role = role;
  }

  void setName(name) {
    _name = name;
  }

  void setEmail(email) {
    _email = email;
  }

  void setPhoneNumber(number) {
    _phonenumber = number;
  }

  void setPin(pin) {
    _pin = pin;
  }

  String? getName() {
    return _name;
  }

  String? getEmail() {
    return _email;
  }

  int? getPhoneNumber() {
    return _phonenumber;
  }

  int? getPin() {
    return _pin;
  }
}

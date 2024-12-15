
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  int id;
  String userName;
  String email;
  String phone;
  String address;
  String profileImage;
  String role;
  UserProvider(
      {this.id = 0,
      this.address = "",
      this.email = "",
      this.phone = "",
      this.userName = "",
      this.role = "USER",
      this.profileImage = "assets/logo.png"});

  void changeUserName({required String newUserName}) async {
    userName = newUserName;
    notifyListeners();
  }

  void changeRole({required String role}) async {
    role = role;
    notifyListeners();
  }

  void changeUserId({required int newUserId}) async {
    id = newUserId;
    notifyListeners();
  }

  void changeEamil({required String newEmail}) async {
    email = newEmail;
    notifyListeners();
  }

  void changePhone({required String newPhone}) async {
    phone = newPhone;
    notifyListeners();
  }

  void changeAddress({required String newAddress}) async {
    address = newAddress;
    notifyListeners();
  }

  void changeProfileImage({required String newProfileImage}) async {
    profileImage = newProfileImage;
    notifyListeners();
  }
}

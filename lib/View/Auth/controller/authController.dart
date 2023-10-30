import 'dart:convert';

import 'package:crm_project/Account_Views/bottomBar/BottomBar.dart';
import 'package:crm_project/Constansts/ApiImplementataion.dart';
import 'package:crm_project/Constansts/ApisConstants.dart';
import 'package:crm_project/HR-Views/BottomBar.dart';
import 'package:crm_project/View/BottomBar/BottomBarPage.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  TextEditingController SignUpEmail = new TextEditingController();
  TextEditingController SignUpUserName = new TextEditingController();
  TextEditingController SignUpPassword = new TextEditingController();
  TextEditingController SignUpfullName = new TextEditingController();
  TextEditingController SignInEmail = new TextEditingController();
  TextEditingController SignInPassword = new TextEditingController();
  TextEditingController forgetMAil = new TextEditingController();
  List<String> typeAppartment = ["HR", "Account", "Admin"];
  String SelectedAppartemnt = "HR";
  RxBool login = false.obs;
  final dio = Dio();

  // Obtain shared preferences.
  late SharedPreferences prefs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initShared();
    //UploaddAta();
  }

  initShared() async {
    //late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
  }

  void GetToast(
      String title, String g, Color backgorundColor, Color textColor) {
    Get.snackbar(
      title, g,
      snackPosition: SnackPosition.BOTTOM,
      // position
      duration: Duration(seconds: 2),
      // duration
      backgroundColor: backgorundColor,
      // background color
      colorText: textColor,
      // text color
      borderRadius: 10.0,
      // border radius
      margin: EdgeInsets.all(10.0),
    );
  }

  void PerformSignUp(BuildContext context) async {
    if (SignUpfullName.text.isEmpty) {
      GetToast("Error", "Please enter your login information and try again",
          Colors.red[100]!, Colors.red);
    }
    if (SignUpEmail.text.isEmpty) {
      GetToast("Error", "Please enter your login information and try again",
          Colors.red[100]!, Colors.red);
    } else if (SignUpPassword.text.isEmpty) {
      GetToast("Error", "Please enter your login information and try again",
          Colors.red[100]!, Colors.red);
    } else if (SignUpUserName.text.isEmpty) {
      GetToast("Error", "Please enter your login information and try again",
          Colors.red[100]!, Colors.red);
    } else {
      login.value = true;
      Map<String, dynamic> requestData = {
        "fullName": "${SignUpfullName.text}",
        "userName": "${SignUpUserName.text}",
        "email": "${SignUpEmail.text}",
        "password": "${SignUpPassword.text}",
        "type": "${SelectedAppartemnt}",
      };
      ApiImplementation.SignUpApi(requestData).then((value) => {
            login.value = false,
            SignUpfullName.text == "",
            SignUpUserName.text == "",
            SignUpEmail.text == "",
            SignUpPassword.text = "",
            SelectedAppartemnt == "",
            if (value.email == null)
              {
                GetToast("Error", "SignUp Failed", Colors.red[100]!, Colors.red),
                print("Failed data"),
              }
            else
              {
                prefs.setString("Email", value.email.toString()),
                prefs.setString("UserName", value.fullName.toString()),
                if (value.type == "Account")
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HRNavigationBar()),
                    ),
                  }
                else if (value.type == "Admin")
                  {
                    Navigator.push(
                      context!,
                      MaterialPageRoute(
                          builder: (context) => AdminNavigationBar()),
                    ),
                  }
                else if (value.type == "HR")
                  {
                    Navigator.push(
                      context!,
                      MaterialPageRoute(
                          builder: (context) => MyNavigationBar()),
                    ),
                  },
                GetToast("Congragulations", "SignUp Succesfull",
                    Colors.green[100]!, Colors.green),
              }
          });

      print("We raach here data");
    }
  }

  void PerformSignIn(BuildContext context) async {
    if (SignInEmail.text.isEmpty) {
      GetToast("Error", "Please enter your login information and try again",
          Colors.red[100]!, Colors.red);
    } else if (SignInPassword.text.isEmpty) {
      GetToast("Error", "Please enter your login information and try again",
          Colors.red[100]!, Colors.red);
    } else {
      print("Email: " +
          SignInEmail.text +
          "  Password: " +
          SignInPassword.text +
          "  type: " +
          SelectedAppartemnt);
      // signInWithEmailAndPassword(SignInEmail.text,SignInPassword.text);
      login.value = true;

      Map<String, dynamic> requestData = {
        "email": "${SignInEmail.text}",
        "password": "${SignInPassword.text}",
      };

      ApiImplementation.LoginApi(requestData).then((value) => {
            login.value = false,
            SignInEmail.text == "",
            SignInPassword.text == "",
            if (value.email == null)
              {
                GetToast("Error", "Login Failed", Colors.red[100]!, Colors.red),
                print("Failed data"),
              }
            else
              {
                prefs.setString("Email", value.email.toString()),
                prefs.setString("UserName", value.fullName.toString()),
                if (value.type == "Account")
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HRNavigationBar()),
                    ),
                  }
                else if (value.type == "Admin")
                  {
                    Navigator.push(
                      context!,
                      MaterialPageRoute(
                          builder: (context) => AdminNavigationBar()),
                    ),
                  }
                else if (value.type == "HR")
                  {
                    Navigator.push(
                      context!,
                      MaterialPageRoute(
                          builder: (context) => MyNavigationBar()),
                    ),
                  },
                GetToast("Congragulations", "SignIn Succesfull",
                    Colors.green[100]!, Colors.green),
              }
          });
    }
  }
}

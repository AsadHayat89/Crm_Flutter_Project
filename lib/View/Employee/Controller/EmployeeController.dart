import 'dart:io';
import 'package:crm_project/View/Dashboard/Controller/dashboardController.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:crm_project/Constansts/ApiImplementataion.dart';
import 'package:crm_project/Constansts/ConstantToast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController {
  TextEditingController PropertyName = new TextEditingController();
  TextEditingController PropertyMoney = new TextEditingController();
  TextEditingController EmployeeName = new TextEditingController();
  TextEditingController EmployeeFatherName = new TextEditingController();
  TextEditingController EmployeeCnic = new TextEditingController();
  TextEditingController Employeeemail = new TextEditingController();
  TextEditingController EmployeePhone = new TextEditingController();
  TextEditingController desination = new TextEditingController();

  TextEditingController EmailCity = new TextEditingController();
  TextEditingController EmployeeAddress = new TextEditingController();
  TextEditingController EmployeeSalary = new TextEditingController();
  TextEditingController EmployeeComission = new TextEditingController();

  RxString UserNameText = "Employee Name".obs;

  RxBool login = false.obs;

  RxString ImagePath = "".obs;

  File ImageData = File("");

  void addEmployee() async {
    if (EmployeeName.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (EmployeeFatherName.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (EmployeeCnic.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (Employeeemail.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (EmployeePhone.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (EmailCity.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (EmployeeAddress.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (EmployeeSalary.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (int.parse(EmployeeComission.text) < 0 ||
        int.parse(EmployeeComission.text) > 100) {
      ConstantToast.GetToast(
          "Error",
          "Commission should be smaller then given value",
          Colors.red[100]!,
          Colors.red);
    } else if (EmployeeComission == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (ImagePath.value == "") {
      ConstantToast.GetToast("Error", "Please upload employees Image",
          Colors.red[100]!, Colors.red);
    } else {
      login.value = true;

      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('image', ImageData.path);

      Map<String, dynamic> requestData = {
        "name": "${EmployeeName.text}",
        "fatherName": "${EmployeeFatherName.text}",
        "cnic": "${EmployeeCnic.text}",
        "email": "${Employeeemail.text}",
        "phone": "${EmployeePhone.text}",
        "city": "${EmailCity.text}",
        "address": "${EmployeeAddress.text}",
        "salary": "${EmployeeSalary.text}",
        "commission": "${EmployeeComission.text}",
        "image": multipartFile,
        'designation':desination.text,
      };

      print("Image file data: " + ImageData.path.toString());
      ApiImplementation.AddEmployee(requestData, ImageData).then((value) => {
            login.value = false,
            EmployeeName.text = "",
            EmployeeFatherName.text = "",
            EmployeeCnic.text = "",
            EmployeeSalary.text = "",
            EmployeeAddress.text = "",
            Employeeemail.text = "",
            EmployeePhone.text = "",
        desination.text="",
            EmailCity.text = "",
            ImageData = new File(""),
            EmployeeComission.text = "",
        ImagePath.value="",
            if (value.email == null)
              {
                print("data not enterd"),
                ConstantToast.GetToast("Error", "Data Uploading failed",
                    Colors.red[100]!, Colors.red),
              }
            else
              {
                Get.find<DashBoardController>().allEmployee.add(value),
                ConstantToast.GetToast("Congragulations", "SignIn Succesfull",
                    Colors.green[100]!, Colors.green),
                print("data inserted"),
                print("data inserted"),
              }
          });
    }
  }
}

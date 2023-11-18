import 'dart:io';
import 'package:crm_project/Constansts/ApiImplementataion.dart';
import 'package:http/http.dart' as http;
import 'package:crm_project/Constansts/ConstantToast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminEmployeeControoler extends GetxController {
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
  RxString ImageUrl = "".obs;
  RxString ImagePath = "".obs;

  File ImageData = File("");

  void addEmployee(String Id) async {
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
    } else {
      login.value = true;

      if (ImageData.path != "") {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('image', ImageData.path);
      }

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
        "image": ""
      };

      print("Image file data: " + ImageData.path.toString());
      ApiImplementation.UpdateEmployee(requestData, ImageData, Id)
          .then((value) => {
                login.value = false,
                EmployeeName.text = "",
                EmployeeFatherName.text = "",
                EmployeeCnic.text = "",
                EmployeeSalary.text = "",
                EmployeeAddress.text = "",
                Employeeemail.text = "",
                EmployeePhone.text = "",
                EmailCity.text = "",
                ImageData = new File(""),
                ImageUrl.value = "",
                EmployeeComission.text = "",
                if (value == false)
                  {
                    ConstantToast.GetToast("Error", "Data Updating failed",
                        Colors.red[100]!, Colors.red),
                  }
                else
                  {
                    // Get.find<DashBoardController>().allEmployee.add(value),
                    ConstantToast.GetToast("Congragulations",
                        "UPdated Succesfull", Colors.green[100]!, Colors.green),
                    // print("data inserted"),
                    // print("data inserted"),
                  }
              });
    }
  }
}

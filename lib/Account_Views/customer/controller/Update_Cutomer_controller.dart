import 'dart:io';
import 'package:crm_project/Constansts/ApiImplementataion.dart';
import 'package:http/http.dart' as http;
import 'package:crm_project/Constansts/ConstantToast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateCustomerController extends GetxController{
  TextEditingController PropertyName = new TextEditingController();
  TextEditingController PropertyMoney = new TextEditingController();
  TextEditingController CutomerName = new TextEditingController();
  TextEditingController CutomerFatherName = new TextEditingController();
  TextEditingController CutomerCnic = new TextEditingController();
  TextEditingController Cutomeremail = new TextEditingController();
  TextEditingController CutomerPhone = new TextEditingController();

  TextEditingController EmailCity = new TextEditingController();
  TextEditingController CutomerAddress = new TextEditingController();

  TextEditingController CutomerProperty = new TextEditingController();
  TextEditingController CutomerSoldProperty = new TextEditingController();

  RxString UserNameText = "Employee Name".obs;

  RxBool login = false.obs;

  RxString ImagePath = "".obs;

  File ImageData = File("");
  RxString ImageUrl = "".obs;

  void addEmployee(String ID) async {
    if (CutomerName.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (CutomerCnic.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (CutomerPhone.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (CutomerAddress.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (CutomerProperty.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (CutomerSoldProperty == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else {
      login.value = true;


      Map<String, dynamic> requestData = {
        "name": "${CutomerName.text}",
        "cnic": "${CutomerCnic.text}",
        "email": "${Cutomeremail.text}",
        "phone": "${CutomerPhone.text}",
        "address": "${CutomerAddress.text}",
        "noOfProperty": "${CutomerProperty.text}",
        "noOfSold": "${CutomerSoldProperty.text}",
        "image": ""
      };

      print("Image file data: " + ImageData.path.toString());

      ApiImplementation.UpdateCustomer(requestData, ImageData,ID).then((value) => {
        login.value = false,
        CutomerName.text = "",
        CutomerCnic.text = "",
        Cutomeremail.text = "",
        CutomerProperty.text = "",
        CutomerPhone.text = "",
        CutomerAddress.text = "",
        CutomerSoldProperty.text = "",
        ImageData = new File(""),
        ImageUrl.value="",
        if (value== false)
          {
            ConstantToast.GetToast(
                "Error",
                "Data UPdating Failed",
                Colors.red[100]!,
                Colors.red),
          }
        else
          {
            //Get.find<DashBoardController>().allCustomer.add(value),
            ConstantToast.GetToast("Congragulations", "UPdated Succesfull",
                Colors.green[100]!, Colors.green),
            print("data inserted"),
          }
      });
    }
  }
}
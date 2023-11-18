import 'dart:io';

import 'package:crm_project/Account_Views/controller/accountController.dart';
import 'package:crm_project/Constansts/ApiImplementataion.dart';
import 'package:crm_project/Constansts/ConstantToast.dart';
import 'package:crm_project/Model/Cutomer.dart';
import 'package:crm_project/Model/Employee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DealUpdateController extends GetxController {
  RxString Name = "Property Name".obs;
  RxString Country = "".obs;
  RxString state = "".obs;
  RxString city = "".obs;
  RxList<File> imagesList = <File>[].obs;
  RxString typeAppartment = "Build".obs;
  RxString typeBuilAppartment = "House".obs;
  RxString selectedTypeList = "".obs;
  List<String> TypeList = ["Build", "UnBuild"];
  List<String> BuildList = ["House", "Villa", "Plaza", "Shop"];

  RxBool login = false.obs;

  String employeesProject = "";
  String companyProfit = "";
  RxString UploadedImage = "No Image Selected yet".obs;
  File ImageData = File("");
  RxString ImageUrl="".obs;

  List<Employee> employeessList = [];
  List<String> EmployeesCnic = ["0"];
  List<Cutomer> customersList = [];
  List<String> CutomersCnic = ["0"];
  List<int> EmployeesPercentageList = [0];
  int empoloyeesPercentage = 0;
  String initialEmployeeSlection = "0";
  String initialCustomerSlection = "0";

  TextEditingController PropertyName = TextEditingController();
  TextEditingController PropertySize = TextEditingController();
  TextEditingController PropertyStreetAddress = TextEditingController();
  TextEditingController PropertyPostalCode = TextEditingController();
  TextEditingController PropertyRoom = TextEditingController();
  TextEditingController PropertyBathRoom = TextEditingController();
  TextEditingController PropertyBedRoom = TextEditingController();
  TextEditingController PropertyFileNumbner = TextEditingController();
  TextEditingController PropertyLocation = TextEditingController();
  TextEditingController PropertyEmployeeName = TextEditingController();
  TextEditingController PropertyCustomerName = TextEditingController();
  TextEditingController PropertyMoney = TextEditingController();
  TextEditingController PropertySoldPrice = TextEditingController();
  TextEditingController PropertyDescriptions = TextEditingController();

  RxList<String> ListAmenties = <String>[].obs;
  RxList<String> ListAmentiesAssets = <String>[].obs;
  RxList<String> ListFeatures = <String>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    employeessList = Get.find<AccountController>().allEmployee;
    if (employeessList.length > 0) {
      EmployeesCnic = employeessList.map((e) => e.cnic.toString()).toList();
      // EmployeesPercentageList = employeessList.map((e) => e.commission!).toList();
      customersList = Get.find<AccountController>().allCustomer;
      CutomersCnic = customersList.map((e) => e.cnic.toString()).toList();
      print(EmployeesCnic);
      initialCustomerSlection = CutomersCnic[0]!;
      initialEmployeeSlection = EmployeesCnic[0]!;
    }

    // empoloyeesPercentage = EmployeesPercentageList[0]!;
  }

  //var MainController=Get.find<homeController>();
  void addImage(File image) {
    imagesList.add(image);
    update(); // call update to notify the UI that the images list has changed
  }

  void MovetoImageProperty() {
    if (imagesList.length == 0) {
      GetToast(
          "Error", "Images Should'nt be Null", Colors.red[100]!, Colors.red);
    } else if (imagesList.length < 6) {
      GetToast("Error", "Images Should'nt be less then 6", Colors.red[100]!,
          Colors.red);
    } else {
      print(imagesList);
      //  Navigator.of(Get.context!).push(MaterialPageRoute(builder: (context) => PropertyDetail()));
    }
  }

  void MoveLocationProperty() {
    if (Country == "") {
      GetToast("Error", "TextFields Should'nt be Null", Colors.red[100]!,
          Colors.red);
    } else if (state == "") {
      GetToast("Error", "TextFields Should'nt be Null", Colors.red[100]!,
          Colors.red);
    } else if (city == "") {
      GetToast("Error", "TextFields Should'nt be Null", Colors.red[100]!,
          Colors.red);
    } else if (PropertyStreetAddress.text.isEmpty) {
      GetToast("Error", "TextFields Should'nt be Null", Colors.red[100]!,
          Colors.red);
    } else if (PropertyPostalCode.text.isEmpty) {
      GetToast("Error", "TextFields Should'nt be Null", Colors.red[100]!,
          Colors.red);
    } else {
      //Navigator.of(Get.context!).push(MaterialPageRoute(builder: (context) => ChooseServicePage()));
    }
  }

  Future<bool> SendApi(String ID) async {
    if (PropertyName.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (PropertySoldPrice.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (PropertyMoney.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (PropertyCustomerName.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (PropertyEmployeeName.text == "") {
      ConstantToast.GetToast(
          "Error",
          "Please enter your Complete information and try again",
          Colors.red[100]!,
          Colors.red);
    } else if (ImageData.path == "") {
      ConstantToast.GetToast(
          "Error", "Please Upload Image", Colors.red[100]!, Colors.red);
    } else if (int.parse(PropertySoldPrice.text) <
        int.parse(PropertyMoney.text)) {
      ConstantToast.GetToast(
          "Error",
          "Sold Price should e greater then Actual Price",
          Colors.red[100]!,
          Colors.red);
    } else {
      //print("Total Percentage: " + empoloyeesPercentage.toString());
      int SoldPrice = int.parse(PropertySoldPrice.text);
      int ActualPrice = int.parse(PropertyMoney.text);
      int ProfitPrice = SoldPrice - ActualPrice;
      double employeesData = ProfitPrice * (empoloyeesPercentage / 100);
      print("employees percentage: " + employeesData.toString());
      double companyPercentage = ProfitPrice - employeesData;
      print("Compnies Project: " + companyPercentage.toString());
      login.value = true;

      Map<String, dynamic> requestData = {
        "name": "${PropertyName.text}",
        "employeeProfit": employeesData.toString(),
        "companyProfit": companyPercentage.toString(),
        "propertySize": "${PropertySize.text}",
        "rooms": "${PropertyRoom.text}",
        "propertyType": "${typeAppartment}",
        "property": "${typeBuilAppartment}",
        "bedroom": "${PropertyBedRoom.text}",
        "bathroom": "${PropertyBathRoom.text}",
        "employeeCnic": initialEmployeeSlection,
        "employeeName": "${PropertyEmployeeName.text}",
        "customerCnic": initialCustomerSlection,
        "customerName": "${PropertyCustomerName.text}",
        "actualPrice": "${PropertyMoney.text}",
        "soldPrice": "${PropertySoldPrice.text}",
        "description": "${PropertyDescriptions.text}",
        "fileNumber": "${PropertyFileNumbner.text}",
        "location": "${PropertyLocation.text}",
      };

      ApiImplementation.UpdateDeal(requestData, ImageData,ID).then((value) => {
            login.value = false,
            PropertyName.text = "",
            PropertySize.text = "",
            PropertyRoom.text = "",
            PropertyBedRoom.text = "",
            PropertyBathRoom.text = "",
            PropertyEmployeeName.text = "",
            PropertyCustomerName.text = "",
            PropertyMoney.text = "",
            PropertySoldPrice.text = "",
            PropertyDescriptions.text = "",
            PropertyLocation.text = "",
            if (value== false)
              {
                ConstantToast.GetToast(
                    "Error",
                    "Updation Failed",
                    Colors.red[100]!,
                    Colors.red),
              }
            else
              {
                ConstantToast.GetToast("Success", "Updated SuccessFully",
                    Colors.green[100]!, Colors.green),
              }
          });
    }
    // Property res= await ApiServices.addPropertyService(imagesList,data);
    // MainController.PropertyList.value.responce!.add(res.responce!.first);
    return true;
  }

  void MoveServiceProperty() {
    if (ListAmenties.length == 0) {
      GetToast(
          "Error", "Amenties Should'nt be Null", Colors.red[100]!, Colors.red);
    } else if (ListFeatures.length == 0) {
      GetToast(
          "Error", "Features Should'nt be Null", Colors.red[100]!, Colors.red);
    } else {
      print(ListAmenties);
      print(ListFeatures);
      print(ListAmentiesAssets);
      // Navigator.of(Get.context!).push(MaterialPageRoute(
      //     builder: (context) => PropertyImagesScreen()));
    }
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
}

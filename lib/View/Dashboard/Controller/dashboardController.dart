import 'package:crm_project/Constansts/ApiImplementataion.dart';
import 'package:crm_project/Model/Cutomer.dart';
import 'package:crm_project/Model/DealModel.dart';
import 'package:crm_project/Model/Employee.dart';
import 'package:crm_project/View/Auth/AuthPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardController extends GetxController{
  RxList<Employee> allEmployee=<Employee>[].obs;
  RxList<Cutomer> allCustomer=<Cutomer>[].obs;
  RxList<DealModel> DealList=<DealModel>[].obs;

  late SharedPreferences prefs;
  String Email="";
  String UserName="";


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllEmployess();
    getAllCustomer();
    getAllDeals();
    initShared();

  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushAndRemoveUntil(Get.context!,
        MaterialPageRoute(builder: (context) => AuthPage()), (_) => false);
  }

  initShared() async {
    //late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    Email=prefs.getString("Email").toString();
    UserName=prefs.getString("UserName").toString();
  }
  void getAllEmployess(){
    ApiImplementation.getAllEmployees().then((value) => {
      if(value.length>0){
        allEmployee.value=value,
        print("Total Employees getL :"+allEmployee.value.length.toString()),
      }
      else{

      }
    });
  }

  void getAllDeals(){
    ApiImplementation.getAllDeals().then((value) => {
      if(value.length>0){
        DealList.value=value,
        print("Total Deals getL :"+allEmployee.value.length.toString()),
      }
      else{

      }
    });
  }

  void getAllCustomer(){
    ApiImplementation.getAllCustomers().then((value) => {
      if(value.length>0){
        allCustomer.value=value,
        print("Total Cutomer getL :"+allCustomer.value.length.toString()),
      }
      else{

      }
    });
  }
}
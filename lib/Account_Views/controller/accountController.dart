import 'package:crm_project/Constansts/ApiImplementataion.dart';
import 'package:crm_project/Constansts/ConstantToast.dart';
import 'package:crm_project/Model/Cutomer.dart';
import 'package:crm_project/Model/DealModel.dart';
import 'package:crm_project/Model/Employee.dart';
import 'package:crm_project/Model/Expenses.dart';
import 'package:crm_project/Model/Inventry.dart';
import 'package:crm_project/View/Auth/AuthPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController {
  RxList<Employee> allEmployee = <Employee>[].obs;
  RxList<Cutomer> allCustomer = <Cutomer>[].obs;
  RxList<DealModel> DealList = <DealModel>[].obs;
  RxList<Inventry> InventryList = <Inventry>[].obs;
  RxList<Expenses> ExpensesList = <Expenses>[].obs;

  RxMap<String, double> myMap = <String, double>{
    "Profit": 5,
    "Loss": 3,
  }.obs;

  late SharedPreferences prefs;
  String Email = "";
  String UserName = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    DateTime currentDate = DateTime.now();

    // Get current month and year
    String currentMonth = DateFormat('MM').format(currentDate);
    String currentYear = DateFormat('yyyy').format(currentDate);
    getProfitDetail();
    getAllEmployess();
    getAllInventryies();
    getAllLoss();
    getAllExpense(currentMonth, currentYear);
    //getProfitDetail();
    getAllCustomer();
    getAllDeals();
    getAllLoss();
    initShared();
  }

  getAllExpense(String month, String year) async {
    Map<String, dynamic> requestData = {"month": "${month}", "year": "${year}"};
    ExpensesList.clear();
    ExpensesList.refresh();

    print("datae we send :+ " + requestData.toString());
    ApiImplementation.getTotalExpense(requestData).then((value) => {
          print("Value we recived: " + value.length.toString()),
          if (value.length > 0)
            {
              ExpensesList.value = value,
            }
        });
  }

  getProfitDetail() async {
    ApiImplementation.getProfitDetail().then((value) => {
          print("Value Profit reciuved: " + value.toString()),
          myMap['Profit'] = double.parse(value),
        });
  }

  void getAllInventryies() {
    ApiImplementation.getInventry().then((value) => {
          if (value.length > 0)
            {
              InventryList.value = value,
            }
          else
            {}
        });
  }

  getAllLoss() async {
    ApiImplementation.getLossamount().then((value) => {
          print("Value reciuved on All Expnses :  " + value.toString()),
          myMap['Loss'] = double.parse(value),
          //ExpensesList.value=value,
        });
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushAndRemoveUntil(Get.context!,
        MaterialPageRoute(builder: (context) => AuthPage()), (_) => false);
  }

  deleteEmployee(String id) async {
    ApiImplementation.DeleteEmployee(id).then((value) => {
          if (value == "success")
            {
              ConstantToast.GetToast("Congragulations", "Employee Deleted",
                  Colors.green[100]!, Colors.green),
              //allEmployee.where((employee) => employee.sId != id).toList(),
              for (int i = 0; i < allEmployee.length; i++)
                {
                  if (allEmployee[i].sId == id)
                    {
                      allEmployee.removeAt(i),
                    }
                },
              update(),
              allEmployee.refresh(),
              print("empllyees lenght now: " + allEmployee.length.toString()),
              update(),
            }
          else
            {
              ConstantToast.GetToast(
                  "Error", value.toString(), Colors.red[100]!, Colors.red),
            }
        });
  }

  deleteCutomer(String id) async {
    ApiImplementation.DeleteCustomer(id).then((value) => {
          if (value == "success")
            {
              ConstantToast.GetToast("Congragulations", "Cutomer Deleted",
                  Colors.green[100]!, Colors.green),
              //allEmployee.where((employee) => employee.sId != id).toList(),
              for (int i = 0; i < allCustomer.length; i++)
                {
                  if (allCustomer[i].sId == id)
                    {
                      allCustomer.removeAt(i),
                    }
                },
              update(),
              allCustomer.refresh(),
              print("empllyees lenght now: " + allCustomer.length.toString()),
              update(),
            }
          else
            {
              ConstantToast.GetToast(
                  "Error", value.toString(), Colors.red[100]!, Colors.red),
            }
        });
  }

  //

  deleteDeal(String id) async {
    ApiImplementation.DeleteDeal(id).then((value) => {
          if (value == "success")
            {
              ConstantToast.GetToast("Congragulations", "Deal Deleted",
                  Colors.green[100]!, Colors.green),
              //allEmployee.where((employee) => employee.sId != id).toList(),
              for (int i = 0; i < DealList.length; i++)
                {
                  if (DealList[i].sId == id)
                    {
                      DealList.removeAt(i),
                    }
                },
              update(),
              DealList.refresh(),
              print("empllyees lenght now: " + DealList.length.toString()),
              update(),
            }
          else
            {
              ConstantToast.GetToast(
                  "Error", value.toString(), Colors.red[100]!, Colors.red),
            }
        });
  }

  initShared() async {
    //late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    Email = prefs.getString("Email").toString();
    UserName = prefs.getString("UserName").toString();
  }

  void getAllEmployess() {
    ApiImplementation.getAllEmployees().then((value) => {
          if (value.length > 0)
            {
              allEmployee.value = value,
              print("Total Employees getL :" +
                  allEmployee.value.length.toString()),
            }
          else
            {}
        });
  }

  void getAllDeals() {
    ApiImplementation.getAllDeals().then((value) => {
          if (value.length > 0)
            {
              DealList.value = value,
              //       print("Total Deals getL :"+allEmployee.value.length.toString()),
            }
          else
            {}
        });
  }

  void getAllCustomer() {
    ApiImplementation.getAllCustomers().then((value) => {
          if (value.length > 0)
            {
              allCustomer.value = value,
              print(
                  "Total Cutomer getL :" + allCustomer.value.length.toString()),
            }
          else
            {}
        });
  }
}

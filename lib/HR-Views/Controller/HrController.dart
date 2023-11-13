import 'dart:io';

import 'package:crm_project/Constansts/ApiImplementataion.dart';
import 'package:crm_project/Constansts/ConstantToast.dart';
import 'package:crm_project/Model/Cutomer.dart';
import 'package:crm_project/Model/DealModel.dart';
import 'package:crm_project/Model/Employee.dart';
import 'package:crm_project/Model/Expenses.dart';
import 'package:crm_project/Model/Profit.dart';
import 'package:crm_project/View/Auth/AuthPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HRCController extends GetxController {
  RxList<Employee> allEmployee = <Employee>[].obs;

  RxList<DealModel> DealList = <DealModel>[].obs;

  RxList<Expenses> ExpensesList = <Expenses>[].obs;

  RxList<Profit> profitList = <Profit>[].obs;

  File ImageData=new File("");
  RxString UploadedImage="".obs;
  TextEditingController expenseDescription = new TextEditingController();
  TextEditingController expenseMoney = new TextEditingController();

  RxBool Loading = false.obs;

  List<String> typeList = ['other', 'pay'];
  RxString selectedtype = 'other'.obs;
  List<String> EmployeesCnic = ["0"];
  RxString selectedEmployee = "0".obs;

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

    getProfitDetail();
    getAllEmployess();
    getAllExpensse();
    getAllProfitList();
    getAllDeals();
    getAllLoss();
    initShared();
  }

  bool checkEmployeeGetPaid(String Cnic) {
    for (int i = 0; i < ExpensesList.length; i++) {
      print("Selected:1 " + ExpensesList[i].employeeIds.toString());
      print("Selected:2 " + Cnic.toString());
      if (ExpensesList[i].employeeIds == Cnic) {
        return true;
      }
    }
    return false;
  }

  AddExpense() {
    if (expenseDescription.text == "") {
      ConstantToast.GetToast("Error", "Please Fiil the remanings TextsFields",
          Colors.red[100]!, Colors.red);
    } else if (expenseMoney.text == "") {
      ConstantToast.GetToast("Error", "Please Fiil the remanings TextsFields",
          Colors.red[100]!, Colors.red);
    } else {
      Map<String, dynamic> requestData;
      if (selectedEmployee != "0") {
        requestData = {
          "expenseType": "${selectedtype}",
          "expenseAmount": expenseMoney.text,
          "description": expenseDescription.text,
          "employeeIds": "${selectedEmployee}",
        };
      } else {
        requestData = {
          "expenseType": "${selectedtype}",
          "expenseAmount": expenseMoney.text,
          "description": expenseDescription.text,
        };
      }

      ApiImplementation.AddExpenses(requestData,ImageData).then((value) => {
            if (value.sId == null || value.sId == "")
              {
                ConstantToast.GetToast("Error", "Expenses Added Failed",
                    Colors.red[100]!, Colors.red),
              }
            else
              {
                ConstantToast.GetToast("Congragulations", "Expenses Added",
                    Colors.green[100]!, Colors.green),
              }
          });
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushAndRemoveUntil(Get.context!,
        MaterialPageRoute(builder: (context) => AuthPage()), (_) => false);
  }

  PayEmployee(Employee e) {
    Map<String, dynamic> requestData;
    requestData = {
      "expenseType": "pay",
      "expenseAmount": e.salary,
      "description": "Pay to employee",
      "employeeIds": e.cnic.toString(),
    };

    ApiImplementation.AddExpenses(requestData,ImageData).then((value) => {
          if (value.sId == null || value.sId == "")
            {
              ConstantToast.GetToast("Error", "Expenses Added Failed",
                  Colors.red[100]!, Colors.red),
            }
          else
            {
              ConstantToast.GetToast("Congragulations", "Pay to Employee",
                  Colors.green[100]!, Colors.green),
              for (int i = 0; i < allEmployee.length; i++)
                {
                  if (allEmployee[i].sId == e.sId)
                    {
                      allEmployee.removeAt(i),
                    }
                },
              allEmployee.refresh(),
              update(),
            }
        });
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

  // deleteCutomer(String id) async {
  //   ApiImplementation.DeleteCustomer(id).then((value) => {
  //     if (value == "success")
  //       {
  //         ConstantToast.GetToast("Congragulations", "Cutomer Deleted",
  //             Colors.green[100]!, Colors.green),
  //         //allEmployee.where((employee) => employee.sId != id).toList(),
  //         for (int i = 0; i < allCustomer.length; i++)
  //           {
  //             if (allCustomer[i].sId == id)
  //               {
  //                 allCustomer.removeAt(i),
  //               }
  //           },
  //         update(),
  //         allCustomer.refresh(),
  //         print("empllyees lenght now: " + allCustomer.length.toString()),
  //         update(),
  //       }
  //     else
  //       {
  //         ConstantToast.GetToast(
  //             "Error", value.toString(), Colors.red[100]!, Colors.red),
  //       }
  //   });
  // }

  getProfitDetail() async {
    ApiImplementation.getProfitDetail().then((value) => {
          print("Value reciuved: " + value.toString()),
          myMap['Profit'] = double.parse(value),
        });
  }

  getAllExpensse() async {
    ApiImplementation.getAllExpenses().then((value) => {
          print("Value reciuved on All Expnses :  " + value.toString()),
          //myMap['Profit'] = double.parse(value),
          ExpensesList.value = value,
        });
  }

  getAllLoss() async {
    ApiImplementation.getLossamount().then((value) => {
          print("Value reciuved on All Expnses :  " + value.toString()),
          myMap['Loss'] = double.parse(value),
          //ExpensesList.value=value,
        });
  }

  getAllProfitList() async {
    ApiImplementation.getProfitList().then((value) => {
          profitList.value = value,
        });
  }

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
              EmployeesCnic =
                  allEmployee.map((e) => e.cnic.toString()).toList(),
              selectedEmployee.value = EmployeesCnic[0],
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
//
// void getAllCustomer() {
//   ApiImplementation.getAllCustomers().then((value) => {
//     if (value.length > 0)
//       {
//         allCustomer.value = value,
//         print(
//             "Total Cutomer getL :" + allCustomer.value.length.toString()),
//       }
//     else
//       {}
//   });
// }
}

import 'dart:io';

import 'package:crm_project/Account_Views/Employee/Employee_update.dart';
import 'package:crm_project/Constansts/ConstantToast.dart';
import 'package:crm_project/Model/AuthDetail.dart';
import 'package:crm_project/Model/Cutomer.dart';
import 'package:crm_project/Model/DealModel.dart';
import 'package:crm_project/Model/Employee.dart';
import 'package:crm_project/Model/Expenses.dart';
import 'package:crm_project/Model/Inventry.dart';
import 'package:crm_project/Model/Profit.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'ApisConstants.dart';

class ApiImplementation {
  static Dio dio = Dio();

  static Future<Auth> LoginApi(Map<String, dynamic> data) async {
    FormData formData = FormData.fromMap({
      'email': '${data['email']}',
      'password': '${data['password']}',
      // Add more fields as needed
    });

    try {
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.LoginUrl,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        Auth authData = Auth();
        return authData;
      } else if (response.data['status'] == "success") {
        Auth authData = Auth.fromJson(response.data['responce']);
        print("Auth REsponce dataL " + authData.email.toString());
        return authData;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return Auth();
    }
    return Auth();
  }

  static Future<Auth> SignUpApi(Map<String, dynamic> data) async {
    FormData formData = FormData.fromMap(data);

    try {
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.SignUpUrl,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        Auth authData = Auth();
        ConstantToast.GetToast(
            "Error", "${response.data['error']}", Colors.red[100]!, Colors.red);
        return authData;
      } else if (response.data['status'] == "success") {
        Auth authData = Auth.fromJson(response.data['responce']);
        print("Auth REsponce dataL " + authData.email.toString());
        return authData;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return Auth();
    }
    return Auth();
  }

  static Future<Employee> AddEmployee(
      Map<String, dynamic> data, File imageFile) async {
    //await MultipartFile.fromFile(file.path, filename:fileName),
    //print("Image that we recive : " + data['image']);
    FormData formData = FormData.fromMap(data);

    // http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
    //     'image', imageFile.path);
    // formData.files.add( MapEntry(
    //   'image', // The key you want to use for the image
    //     multipartFile
    // ),);
//    request.files.add(multipartFile);\

    if (imageFile.existsSync()) {
      print("data added1");
      formData.files.add(
        MapEntry(
          'image', // The key you want to use for the image
          await MultipartFile.fromFile(
            imageFile.path, // Replace with the actual path to your image file
          ),
        ),
      );
      print("data added2");
    }

    print(ApiConstans.BaseUrl + ApiConstans.addEmployeeUrl);
    try {
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.addEmployeeUrl,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        Employee authData = Employee();
        return authData;
      } else if (response.data['status'] == "success") {
        Employee authData = Employee.fromJson(response.data['responce']);
        print("Auth REsponce dataL " + authData.email.toString());
        return authData;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return Employee();
    }
    return Employee();
  }

  static Future<bool> UpdateEmployee(
      Map<String, dynamic> data, File imageFile,String ID) async {
    //await MultipartFile.fromFile(file.path, filename:fileName),
    //print("Image that we recive : " + data['image']);
    FormData formData = FormData.fromMap(data);

    if (imageFile.path!="") {
      print("data added1");
      formData.files.add(
        MapEntry(
          'image', // The key you want to use for the image
          await MultipartFile.fromFile(
            imageFile.path, // Replace with the actual path to your image file
          ),
        ),
      );
      print("data added2");
    }

    print(ApiConstans.BaseUrl + ApiConstans.deleteEmployee+"/"+ID);
    try {
      Response response = await dio.put(
        ApiConstans.BaseUrl + ApiConstans.deleteEmployee+"/"+ID,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.statusCode.toString());
      if (response.statusCode != 200) {
        Employee authData = Employee();
        return false;
      } else if (response.statusCode == 200) {
        Employee authData = Employee.fromJson(response.data['responce']);
        print("Auth REsponce dataL " + authData.email.toString());
        return true;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return false;
    }
    return true;
  }
  static Future<bool> UpdateDeal(
      Map<String, dynamic> data, File imageFile,String ID) async {
    //await MultipartFile.fromFile(file.path, filename:fileName),
    //print("Image that we recive : " + data['image']);
    FormData formData = FormData.fromMap(data);

    if (imageFile.path!="") {
      print("data added1");
      formData.files.add(
        MapEntry(
          'image', // The key you want to use for the image
          await MultipartFile.fromFile(
            imageFile.path, // Replace with the actual path to your image file
          ),
        ),
      );
      print("data added2");
    }

    print(ApiConstans.BaseUrl + ApiConstans.addDeal+"/"+ID);
    try {
      Response response = await dio.put(
        ApiConstans.BaseUrl + ApiConstans.addDeal+"/"+ID,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.statusCode.toString());
      if (response.statusCode != 200) {
        return false;
      } else if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return false;
    }
    return true;
  }

  static Future<List<Inventry>> getInventry() async {
    List<Inventry> employessLsit = [];
    try {
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.getInventry,
        //headers: {"Content-Type": "multipart/form-data"},
      );
      if (response.data['status'] == 'error') {
        // Employee authData = Employee();
        return employessLsit;
      } else if (response.data['status'] == "success") {
        //Employee authData = Employee.fromJson(response.data['responce']);

        for (var employeeData in response.data['responce']) {
          print(employeeData.toString());
          employessLsit.add(Inventry.fromJson(employeeData));
          //employees.add(Employee.fromJson(employeeData));
        }

        return employessLsit;
      }
    } catch (e) {
      return employessLsit;
    }
    return employessLsit;
  }

  static Future<Expenses> AddExpenses(
      Map<String, dynamic> data, File imageFile) async {
    FormData formData = FormData.fromMap(data);


    if(imageFile.path!=""){
      formData.files.add(
        MapEntry(
          'image', // The key you want to use for the image
          await MultipartFile.fromFile(
            imageFile.path, // Replace with the actual path to your image file
          ),
        ),
      );
    }


    try {
      print(ApiConstans.BaseUrl + ApiConstans.addExpenses);
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.addExpenses,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.data.toString());
      if (response.data['status'] == 'error') {
        Expenses authData = Expenses();
        return authData;
      } else if (response.data['status'] == "success") {
        Expenses authData = Expenses.fromJson(response.data['responce']);
        //print("Auth REsponce dataL " + authData.email.toString());
        return authData;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return Expenses();
    }
    return Expenses();
  }

  static Future<String> DeleteEmployee(String Id) async {
    //await MultipartFile.fromFile(file.path, filename:fileName),
    //print("Image that we recive : " + data['image']);

    try {
      print(ApiConstans.BaseUrl + ApiConstans.deleteEmployee + '/' + Id);
      Response response = await dio.delete(
        ApiConstans.BaseUrl + ApiConstans.deleteEmployee + '/' + Id,
        //headers: {"Content-Type": "multipart/form-data"},
        //data: formData,
      );
      //print("responce receive: "+response.data);
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        return response.data['error'];
      } else if (response.data['status'] == "success") {
        return response.data['responce'];
      }
    } catch (e) {
      print("failed: " + e.toString());
      return e.toString();
    }
    return "";
  }

  static Future<String> DeleteCustomer(String Id) async {
    //await MultipartFile.fromFile(file.path, filename:fileName),
    //print("Image that we recive : " + data['image']);

    try {
      print(ApiConstans.BaseUrl + ApiConstans.getAllCutomer + '/' + Id);
      Response response = await dio.delete(
        ApiConstans.BaseUrl + ApiConstans.getAllCutomer + '/' + Id,
        //headers: {"Content-Type": "multipart/form-data"},
        //data: formData,
      );
      //print("responce receive: "+response.data);
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        return response.data['error'];
      } else if (response.data['status'] == "success") {
        return response.data['responce'];
      }
    } catch (e) {
      print("failed: " + e.toString());
      return e.toString();
    }
    return "";
  }

  static Future<String> DeleteDeal(String Id) async {
    //await MultipartFile.fromFile(file.path, filename:fileName),
    //print("Image that we recive : " + data['image']);

    try {
      print(ApiConstans.BaseUrl + ApiConstans.addDeal + '/' + Id);
      Response response = await dio.delete(
        ApiConstans.BaseUrl + ApiConstans.addDeal + '/' + Id,
        //headers: {"Content-Type": "multipart/form-data"},
        //data: formData,
      );
      //print("responce receive: "+response.data);
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        return response.data['error'];
      } else if (response.data['status'] == "success") {
        return response.data['responce'];
      }
    } catch (e) {
      return e.toString();
    }
    return "";
  }

  static Future<String> getProfitDetail() async {

    try {
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.getProfitDetail,
        //headers: {"Content-Type": "multipart/form-data"},
        //data: formData,
      );
      print("responce receive: " + response.data.toString());
      if (response.data['status'] == 'error') {
        print("faile");
        return response.data['error'];
      } else if (response.data['status'] == "success") {
        print("pass");
        print("Data recived: " +
            response.data['responce']['totalCompanyProfit'].toString());
        return response.data['responce']['totalCompanyProfit'].toString();
      }
    } catch (e) {
      print("failed: " + e.toString());
      return e.toString();
    }
    return "";
  }

  static Future<DealModel> AddDeal(
      Map<String, dynamic> data, File imageFile) async {
    FormData formData = FormData.fromMap(data);

    if (imageFile.existsSync()) {
      formData.files.add(
        MapEntry(
          'image', // The key you want to use for the image
          await MultipartFile.fromFile(
            imageFile.path, // Replace with the actual path to your image file
          ),
        ),
      );
      print("data added2");
    }

    print(ApiConstans.BaseUrl + ApiConstans.addDeal);
    try {
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.addDeal,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        DealModel authData = DealModel();
        return authData;
      } else if (response.data['status'] == "success") {
        DealModel authData = DealModel.fromJson(response.data['responce']);
        // print("Auth REsponce dataL " + authData.email.toString());
        return authData;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return DealModel();
    }
    return DealModel();
  }

  static Future<Cutomer> AddCutomer(
      Map<String, dynamic> data, File imageFile) async {
    //await MultipartFile.fromFile(file.path, filename:fileName),
    //print("Image that we recive : " + data['image']);
    FormData formData = FormData.fromMap(data);

    // http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
    //     'image', imageFile.path);
    // formData.files.add( MapEntry(
    //   'image', // The key you want to use for the image
    //     multipartFile
    // ),);
//    request.files.add(multipartFile);\

    if (imageFile.existsSync()) {
      print("data added1");
      formData.files.add(
        MapEntry(
          'image', // The key you want to use for the image
          await MultipartFile.fromFile(
            imageFile.path, // Replace with the actual path to your image file
          ),
        ),
      );
      print("data added2");
    }

    print(ApiConstans.BaseUrl + ApiConstans.addEmployeeUrl);
    try {
      Response response = await dio.post(
        ApiConstans.BaseUrl + ApiConstans.addCutomer,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        Cutomer authData = Cutomer();
        return authData;
      } else if (response.data['status'] == "success") {
        Cutomer authData = Cutomer.fromJson(response.data['responce']);
        print("Auth REsponce dataL " + authData.email.toString());
        return authData;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return Cutomer();
    }
    return Cutomer();
  }

  static Future<bool> UpdateCustomer(
      Map<String, dynamic> data, File imageFile,String ID) async {
    //await MultipartFile.fromFile(file.path, filename:fileName),
    //print("Image that we recive : " + data['image']);
    FormData formData = FormData.fromMap(data);

    if (imageFile.path!="") {
      print("data added1");
      formData.files.add(
        MapEntry(
          'image', // The key you want to use for the image
          await MultipartFile.fromFile(
            imageFile.path, // Replace with the actual path to your image file
          ),
        ),
      );
      print("data added2");
    }

    print(ApiConstans.BaseUrl + ApiConstans.getAllCutomer+"/"+ID);
    try {
      Response response = await dio.put(
        ApiConstans.BaseUrl + ApiConstans.getAllCutomer+"/"+ID,
        //headers: {"Content-Type": "multipart/form-data"},
        data: formData,
      );
      print("reponce data: " + response.statusCode.toString());
      if (response.statusCode != 200) {
        return false;
      } else if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return false;
    }
    return true;
  }

  static Future<List<Employee>> getAllEmployees() async {
    List<Employee> employessLsit = [];
    try {
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.getAllEmployees,
        //headers: {"Content-Type": "multipart/form-data"},
      );

      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        // Employee authData = Employee();
        return employessLsit;
      } else if (response.data['status'] == "success") {
        //Employee authData = Employee.fromJson(response.data['responce']);
        for (var employeeData in response.data['responce']) {
          employessLsit.add(Employee.fromJson(employeeData));
          //employees.add(Employee.fromJson(employeeData));
        }

        return employessLsit;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return employessLsit;
    }
    return employessLsit;
  }

  static Future<List<Expenses>> getTotalExpense(
      Map<String, dynamic> data
      ) async {
    List<Expenses> employessLsit = [];
    FormData formData = FormData.fromMap(data);

    try {
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.getAllExpense,
        data: formData
        //headers: {"Content-Type": "multipart/form-data"},
      );
      print("reponce for expenses list  data: " + response.data['response'][0]["expenses"].toString());
      if (response.data['status'] == 'error') {
        // Employee authData = Employee();
        return employessLsit;
      } else if (response.data['status'] == "success") {
        //Employee authData = Employee.fromJson(response.data['responce']);
        for (var employeeData in response.data['response'][0]["expenses"]) {
          employessLsit.add(Expenses.fromJson(employeeData));
          //employees.add(Employee.fromJson(employeeData));
        }

        return employessLsit;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return employessLsit;
    }
    return employessLsit;
  }

  static Future<String> getLossamount() async {
    try {
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.getExpensedata,
        //headers: {"Content-Type": "multipart/form-data"},
      );

      print("reponce Expenses data: " + response.data['responce'].toString());
      if (response.data['status'] == 'error') {
        // Employee authData = Employee();
        return response.data['error'];
      } else if (response.data['status'] == "success") {
        //Employee authData = Employee.fromJson(response.data['responce']);
        print("reponce Expenses data: " + response.data['responce'].toString());
        return response.data['responce'].toString();
      }
    } catch (e) {
      print("failed: " + e.toString());
      return e.toString();
    }
    return "";
  }

  static Future<List<Profit>> getProfitList() async {
    List<Profit> employessLsit = [];
    try {
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.getProfit,
        //headers: {"Content-Type": "multipart/form-data"},
      );

      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        Profit authData = Profit();
        return employessLsit;
      } else if (response.data['status'] == "success") {
        Profit authData = Profit.fromJson(response.data['responce']);
        for (var employeeData in response.data['responce']) {
          employessLsit.add(Profit.fromJson(employeeData));
          //employees.add(Employee.fromJson(employeeData));
        }
        return employessLsit;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return employessLsit;
    }
    return employessLsit;
  }

  static Future<List<Expenses>> getAllExpenses() async {
    List<Expenses> employessLsit = [];
    try {
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.getAllExpense,
        //headers: {"Content-Type": "multipart/form-data"},
      );

      print("reponce data: " + response.data['status'].toString());
      if (response.data['status'] == 'error') {
        // Employee authData = Employee();
        return employessLsit;
      } else if (response.data['status'] == "success") {
        //Employee authData = Employee.fromJson(response.data['responce']);
        for (var employeeData in response.data['responce']) {
          employessLsit.add(Expenses.fromJson(employeeData));
          //employees.add(Employee.fromJson(employeeData));
        }

        return employessLsit;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return employessLsit;
    }
    return employessLsit;
  }

  static Future<List<DealModel>> getAllDeals() async {
    List<DealModel> employessLsit = [];
    try {
      print("reache ere");
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.addDeal,
        //headers: {"Content-Type": "multipart/form-data"},
      );
      if (response.data['status'] == 'error') {
        // Employee authData = Employee();
        return employessLsit;
      } else if (response.data['status'] == "success") {
        //Employee authData = Employee.fromJson(response.data['responce']);

        for (var employeeData in response.data['responce']) {
          print(employeeData.toString());
          employessLsit.add(DealModel.fromJson(employeeData));
          //employees.add(Employee.fromJson(employeeData));
        }

        return employessLsit;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return employessLsit;
    }
    return employessLsit;
  }

  static Future<List<DealModel>> getDealsByCnic(String Cnic) async {
    List<DealModel> employessLsit = [];
    try {
      print(ApiConstans.BaseUrl + ApiConstans.getDealsbyCnic+Cnic);
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.getDealsbyCnic+Cnic,
        //headers: {"Content-Type": "multipart/form-data"},
      );
      print("reponce by get Emplye by CNinc: "+response.data['status'].toString());
      if (response.data['status'] == 'error') {
        // Employee authData = Employee();
        return employessLsit;
      } else if (response.data['status'] == "success") {
        //Employee authData = Employee.fromJson(response.data['responce']);

        for (var employeeData in response.data['responce']) {
          print(employeeData.toString());
          employessLsit.add(DealModel.fromJson(employeeData));
          //employees.add(Employee.fromJson(employeeData));
        }

        return employessLsit;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return employessLsit;
    }
    return employessLsit;
  }

  static Future<List<Cutomer>> getAllCustomers() async {
    List<Cutomer> employessLsit = [];

    try {
      print("Sending request: " +
          (ApiConstans.BaseUrl + ApiConstans.getAllCutomer));
      Response response = await dio.get(
        ApiConstans.BaseUrl + ApiConstans.getAllCutomer,
        //headers: {"Content-Type": "multipart/form-data"},
      );
      if (response.data['status'] == 'error') {
        // Employee authData = Employee();
        return employessLsit;
      } else if (response.data['status'] == "success") {
        //Employee authData = Employee.fromJson(response.data['responce']);
        for (var employeeData in response.data['responce']) {
          employessLsit.add(Cutomer.fromJson(employeeData));
          //employees.add(Employee.fromJson(employeeData));
        }

        return employessLsit;
      }
    } catch (e) {
      print("failed: " + e.toString());
      return employessLsit;
    }
    return employessLsit;
  }
}

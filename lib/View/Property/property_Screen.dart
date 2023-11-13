
import 'dart:io';

import 'package:crm_project/View/Property/Controller/PropertyController.dart';
import 'package:crm_project/widget/CountryWidget.dart';
import 'package:crm_project/widget/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../Constants/Colors.dart';


class ListYourPropertyScreen extends StatefulWidget  {

  @override
  State<ListYourPropertyScreen> createState() => _ListYourPropertyScreenState();
}

class _ListYourPropertyScreenState extends State<ListYourPropertyScreen> {
  var Controller=Get.put(PropertyController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Obx(
            ()=> Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text(
                    "List Your Deal",
                    style: GoogleFonts.plusJakartaSans(

                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(),

                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Name",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,

                                color: AppColors.AuthTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Textfield(hint: "Property Name",contentPadding:22,Contorller: Controller.PropertyName,),
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container
                      (
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "PropertyType",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,

                                color: AppColors.AuthTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColors.textFieldFillColore,

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        // boxShadow: [
                        //   if(AppConstants.lightVersion==0)
                        //     BoxShadow(
                        //       color: Colors.black12,
                        //       blurRadius: 10,
                        //       offset: const Offset(0, 1),
                        //     ),
                        // ],
                      ),
                      child: DropdownButton(
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                        underline: SizedBox(),
                        isExpanded: true,
                        value: Controller.typeAppartment.value,
                        onChanged: (String? newValue) {
                          Controller.selectedTypeList.value=newValue!;
                            Controller.typeAppartment.value = newValue!;

                        },
                        items: Controller.TypeList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(items),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  //Property Marla
                  if(Controller.selectedTypeList.value=="Build")
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container
                        (
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Property",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  if(Controller.selectedTypeList.value=="Build")
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColors.textFieldFillColore,

                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          // boxShadow: [
                          //   if(AppConstants.lightVersion==0)
                          //     BoxShadow(
                          //       color: Colors.black12,
                          //       blurRadius: 10,
                          //       offset: const Offset(0, 1),
                          //     ),
                          // ],
                        ),
                        child: DropdownButton(
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                          underline: SizedBox(),
                          isExpanded: true,
                          value: Controller.typeBuilAppartment.value,
                          onChanged: (String? newValue) {
                            Controller.typeBuilAppartment.value = newValue!;

                          },
                          items: Controller.BuildList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(items),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                  if(Controller.selectedTypeList.value=="Build")
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container
                        (
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Property Size (marla)",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  if(Controller.selectedTypeList.value=="Build")
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,

                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          // boxShadow: [
                          //   if(AppConstants.lightVersion==0)
                          //     BoxShadow(
                          //       color: Colors.black12,
                          //       blurRadius: 10,
                          //       offset: const Offset(0, 1),
                          //     ),
                          // ],
                        ),
                        child: TextFormField(
                          controller: Controller.PropertySize,
                          style: GoogleFonts.plusJakartaSans(color: Colors.black),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: AppColors.textFieldFillColore,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: '0',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                  if(Controller.selectedTypeList.value=="Build" && Controller.typeBuilAppartment!="Shop" && Controller.typeBuilAppartment!="Plaza")
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Rooms",
                                      style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,

                                          color: AppColors.AuthTextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 20, right: 5),
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,

                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  // boxShadow: [
                                  //   if(AppConstants.lightVersion==0)
                                  //     BoxShadow(
                                  //       color: Colors.black12,
                                  //       blurRadius: 10,
                                  //       offset: const Offset(0, 1),
                                  //     ),
                                  // ],
                                ),
                                child: TextFormField(
                                  controller: Controller.PropertyRoom,
                                  style: GoogleFonts.plusJakartaSans(color: Colors.black),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.transparent, width: 1.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.transparent, width: 1.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    fillColor: AppColors.textFieldFillColore,
                                    filled: true,
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    hintText: '5',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your cninc';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Bedroom",
                                      style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,

                                          color: AppColors.AuthTextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 10, right: 5),
                              child:Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,

                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  // boxShadow: [
                                  //   if(AppConstants.lightVersion==0)
                                  //     BoxShadow(
                                  //       color: Colors.black12,
                                  //       blurRadius: 10,
                                  //       offset: const Offset(0, 1),
                                  //     ),
                                  // ],
                                ),
                                child: TextFormField(
                                  controller: Controller.PropertyBedRoom,
                                  style: GoogleFonts.plusJakartaSans(color: Colors.black),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.transparent, width: 1.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.transparent, width: 1.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    fillColor: AppColors.textFieldFillColore,
                                    filled: true,
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    hintText: '5',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your cninc';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Bathroom",
                                      style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,

                                          color: AppColors.AuthTextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 10, right: 5),
                              child:Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,

                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  // boxShadow: [
                                  //   if(AppConstants.lightVersion==0)
                                  //     BoxShadow(
                                  //       color: Colors.black12,
                                  //       blurRadius: 10,
                                  //       offset: const Offset(0, 1),
                                  //     ),
                                  // ],
                                ),
                                child: TextFormField(
                                  controller: Controller.PropertyBathRoom,
                                  style: GoogleFonts.plusJakartaSans(color: Colors.black),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.transparent, width: 1.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.transparent, width: 1.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    fillColor: AppColors.textFieldFillColore,
                                    filled: true,
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    hintText: '5',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your cninc';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                  if(Controller.selectedTypeList.value=="UnBuild")
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "File Number",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  if(Controller.selectedTypeList.value=="UnBuild")
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,

                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          // boxShadow: [
                          //   if(AppConstants.lightVersion==0)
                          //     BoxShadow(
                          //       color: Colors.black12,
                          //       blurRadius: 10,
                          //       offset: const Offset(0, 1),
                          //     ),
                          // ],
                        ),
                        child: TextFormField(
                          controller: Controller.PropertyFileNumbner,
                          style: GoogleFonts.plusJakartaSans(color: Colors.black),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: AppColors.textFieldFillColore,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: '12312',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                  if(Controller.selectedTypeList.value=="UnBuild")
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Property Location",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  if(Controller.selectedTypeList.value=="UnBuild")
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,

                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          // boxShadow: [
                          //   if(AppConstants.lightVersion==0)
                          //     BoxShadow(
                          //       color: Colors.black12,
                          //       blurRadius: 10,
                          //       offset: const Offset(0, 1),
                          //     ),
                          // ],
                        ),
                        child: TextFormField(
                          controller: Controller.PropertyLocation,
                          style: GoogleFonts.plusJakartaSans(color: Colors.black),

                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: AppColors.textFieldFillColore,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Location',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container
                      (
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Employees CNIC",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,

                                color: AppColors.AuthTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColors.textFieldFillColore,

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        // boxShadow: [
                        //   if(AppConstants.lightVersion==0)
                        //     BoxShadow(
                        //       color: Colors.black12,
                        //       blurRadius: 10,
                        //       offset: const Offset(0, 1),
                        //     ),
                        // ],
                      ),
                      child: DropdownButton(
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                        underline: SizedBox(),
                        isExpanded: true,
                        value: Controller.initialEmployeeSlection,
                        onChanged: (String? newValue) {
                          for(int i=0;i<Controller.employeessList.length;i++){
                              if(Controller.employeessList[i].cnic.toString()==newValue){
                                Controller.PropertyEmployeeName.text=Controller.employeessList[i].name!;
                                Controller.empoloyeesPercentage=Controller.employeessList[i].commission!;
                                print("data get: ");
                              }
                            }
                            Controller.initialEmployeeSlection = newValue!;

                        },
                        items: Controller.EmployeesCnic.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(items),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Employee",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,

                                color: AppColors.AuthTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        // boxShadow: [
                        //   if(AppConstants.lightVersion==0)
                        //     BoxShadow(
                        //       color: Colors.black12,
                        //       blurRadius: 10,
                        //       offset: const Offset(0, 1),
                        //     ),
                        // ],
                      ),
                      child: TextFormField(
                        controller: Controller.PropertyEmployeeName,
                        style: GoogleFonts.plusJakartaSans(color: Colors.black),

                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fillColor: AppColors.textFieldFillColore,
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Employee',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container
                      (
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Customer CNIC",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,

                                color: AppColors.AuthTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColors.textFieldFillColore,

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        // boxShadow: [
                        //   if(AppConstants.lightVersion==0)
                        //     BoxShadow(
                        //       color: Colors.black12,
                        //       blurRadius: 10,
                        //       offset: const Offset(0, 1),
                        //     ),
                        // ],
                      ),
                      child: DropdownButton(
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                        underline: SizedBox(),
                        isExpanded: true,
                        value: Controller.initialCustomerSlection,
                        onChanged: (String? newValue) {
                          for(int i=0;i<Controller.customersList.length;i++){
                              if(Controller.customersList[i].cnic==newValue){
                                Controller.PropertyCustomerName.text=Controller.customersList[i].name!;
                              }
                            }

                            Controller.initialCustomerSlection = newValue!;

                        },
                        items: Controller.CutomersCnic.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(items),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Cutomer",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,

                                color: AppColors.AuthTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        // boxShadow: [
                        //   if(AppConstants.lightVersion==0)
                        //     BoxShadow(
                        //       color: Colors.black12,
                        //       blurRadius: 10,
                        //       offset: const Offset(0, 1),
                        //     ),
                        // ],
                      ),
                      child: TextFormField(
                        controller: Controller.PropertyCustomerName,
                        style: GoogleFonts.plusJakartaSans(color: Colors.black),

                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fillColor: AppColors.textFieldFillColore,
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Cutomer',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Actual Price",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,

                                color: AppColors.AuthTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        // boxShadow: [
                        //   if(AppConstants.lightVersion==0)
                        //     BoxShadow(
                        //       color: Colors.black12,
                        //       blurRadius: 10,
                        //       offset: const Offset(0, 1),
                        //     ),
                        // ],
                      ),
                      child: TextFormField(
                        controller: Controller.PropertyMoney,
                        style: GoogleFonts.plusJakartaSans(color: Colors.black),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: AppColors.textFieldFillColore,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle:
                            GoogleFonts.plusJakartaSans(color: Colors.green),
                            hintText: '0',
                            hintStyle:
                            GoogleFonts.plusJakartaSans(color: Colors.green)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Sold Price",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,

                                color: AppColors.AuthTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        // boxShadow: [
                        //   if(AppConstants.lightVersion==0)
                        //     BoxShadow(
                        //       color: Colors.black12,
                        //       blurRadius: 10,
                        //       offset: const Offset(0, 1),
                        //     ),
                        // ],
                      ),
                      child: TextFormField(
                        controller: Controller.PropertySoldPrice,
                        style: GoogleFonts.plusJakartaSans(color: Colors.black),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: AppColors.textFieldFillColore,
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle:
                            GoogleFonts.plusJakartaSans(color: Colors.green),
                            hintText: '0',
                            hintStyle:
                            GoogleFonts.plusJakartaSans(color: Colors.green)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Property Description",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,

                                color: AppColors.AuthTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        // boxShadow: [
                        //   if(AppConstants.lightVersion==0)
                        //     BoxShadow(
                        //       color: Colors.black12,
                        //       blurRadius: 10,
                        //       offset: const Offset(0, 1),
                        //     ),
                        // ],
                      ),
                      child: TextFormField(
                        controller: Controller.PropertyDescriptions,
                        style: GoogleFonts.plusJakartaSans(color: Colors.black),

                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fillColor: AppColors.textFieldFillColore,
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Description',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            //width: width,
                              child: Text(
                                "Image",
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14,

                                    color: AppColors.AuthTextColor,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (){
                                _showImagePickerDialog(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.appBackground,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                                  child: Text(
                                    "Upload",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              Controller.UploadedImage.value.split('/').last,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: (){
                        Controller.SendApi();

                      },
                      child: Container(
                        height: 55,
                        width: width,
                        decoration: BoxDecoration(
                          color: AppColors.appBackground,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child:
                            Controller.login.value?
                            CircularProgressIndicator(
                              color: Colors.white54,
                              backgroundColor: Colors.white54,
                            )
                                :
                            Text(
                              "Create Deal",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 20,
                                  color: AppColors.LightVerison,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Future<void> _showImagePickerDialog(BuildContext context) async {
    final picker = ImagePicker();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Pick from Gallery"),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    // Handle the selected image here
                    Controller.UploadedImage.value=pickedFile.path;
                    Controller.ImageData=File(pickedFile.path);
                    print("Image path: ${pickedFile.path}");
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Take a Picture"),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile = await picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    // Handle the captured image here
                    Controller.UploadedImage.value=pickedFile.path;
                    Controller.ImageData=File(pickedFile.path);
                    print("Image path: ${pickedFile.path}");
                  }
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
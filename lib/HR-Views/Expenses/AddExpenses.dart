
import 'dart:io';

import 'package:crm_project/HR-Views/Controller/HrController.dart';
import 'package:crm_project/View/Employee/Controller/EmployeeController.dart';
import 'package:crm_project/View/Property/Controller/PropertyController.dart';
import 'package:crm_project/widget/CountryWidget.dart';
import 'package:crm_project/widget/TextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../Constants/Colors.dart';
class AddExpenses extends StatefulWidget {
  const AddExpenses({Key? key}) : super(key: key);

  @override
  State<AddExpenses> createState() => _ListYourPropertyScreenState();
}

class _ListYourPropertyScreenState extends State<AddExpenses> {
  var Controller=Get.find<HRCController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.ScrennBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text(
                    "Add Expense",
                    style: GoogleFonts.plusJakartaSans(

                      fontWeight: FontWeight.w700,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(),

                ],
              ),
            ),
            Obx(
              ()=> Container(
                child: Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Expenses Type",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Obx(
                      ()=> Padding(
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
                            value: Controller.selectedtype.value,
                            onChanged: (String? newValue) {
                              Controller.selectedtype.value=newValue!;
                            //  Controller.typeAppartment.value = newValue!;
                            },
                            items: Controller.typeList.map((String items) {
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
                    ),

                    if(Controller.selectedtype.value=="pay")
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Employee Cnic",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    if(Controller.selectedtype.value=="pay")
                    Obx(
                          ()=> Padding(
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
                            value: Controller.selectedEmployee.value,
                            onChanged: (String? newValue) {
                              Controller.selectedEmployee.value=newValue!;
                              //  Controller.typeAppartment.value = newValue!;
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
                    ),


                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Expenses Description",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Textfield(hint: "Description",contentPadding:22,Contorller: Controller.expenseDescription,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Expenses Money",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Textfield(hint: "Money",contentPadding:22,Contorller: Controller.expenseMoney,),
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
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 10, bottom: 10),
                      child: GestureDetector(
                        onTap: (){
                          Controller.AddExpense();
                        },
                        child: Container(
                          height: 55,
                          width: width,
                          decoration: BoxDecoration(
                            color: AppColors.appBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                                "ADD Expenses",
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
            ),

          ],
        ),
      ),
    );
  }
  Container GetImageContianer(){
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/person.png', // Replace with your actual image path
          fit: BoxFit.cover,
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
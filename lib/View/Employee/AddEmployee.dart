
import 'dart:io';

import 'package:crm_project/View/Employee/Controller/EmployeeController.dart';
import 'package:crm_project/View/Property/Controller/PropertyController.dart';
import 'package:crm_project/widget/CountryWidget.dart';
import 'package:crm_project/widget/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../Constants/Colors.dart';
class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _ListYourPropertyScreenState();
}

class _ListYourPropertyScreenState extends State<AddEmployee> {
  var Controller=Get.put(EmployeeController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.ScrennBackgroundColor,
      body: SingleChildScrollView(
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
                      "Add Employess Detail",
                      style: GoogleFonts.plusJakartaSans(

                        fontWeight: FontWeight.w700,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(),

                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    GestureDetector(
                        onTap:(){
                          _showImagePickerDialog(context);
                        },
                        child: GetImageContianer()),
                    Row(
                      children: [

                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "${Controller.UserNameText.value}",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Textfield(hint: "Name",contentPadding:22,Contorller: Controller.EmployeeName,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Father Name",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Textfield(hint: "Father Name",contentPadding:22,Contorller: Controller.EmployeeFatherName,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Employee CNIC",
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
                          controller: Controller.EmployeeCnic,
                          style: GoogleFonts.plusJakartaSans(color: Colors.black),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(13),
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
                            hintText: '00000-000000-0',
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
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Employee Email",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Textfield(hint: "example@gmail.com",contentPadding:22,Contorller: Controller.Employeeemail,),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Employee Phone Number",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: TextFormField(
                        controller: Controller.EmployeePhone,
                        style: GoogleFonts.plusJakartaSans(color: Colors.black),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
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
                          hintText: '12342534',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your cninc';
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Employee City",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Textfield(hint: "City",contentPadding:22,Contorller: Controller.EmailCity,),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Employee Address",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Textfield(hint: "Address",contentPadding:22,Contorller: Controller.EmployeeAddress,),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Employee Designation",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,

                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Textfield(hint: "Designation",contentPadding:22,Contorller: Controller.desination,),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 20),
                    //   child: Container(
                    //       width: width,
                    //       child: Padding(
                    //         padding: EdgeInsets.only(left: 20),
                    //         child: Text(
                    //           "PropertyType",
                    //           style: GoogleFonts.plusJakartaSans(
                    //               fontSize: 14,
                    //
                    //               color: AppColors.AuthTextColor,
                    //               fontWeight: FontWeight.w500),
                    //         ),
                    //       )),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    //   child: Container(
                    //     height: 55,
                    //     decoration: BoxDecoration(
                    //       color: AppColors.textFieldFillColore,
                    //
                    //       borderRadius: BorderRadius.all(Radius.circular(15)),
                    //       // boxShadow: [
                    //       //   if(AppConstants.lightVersion==0)
                    //       //     BoxShadow(
                    //       //       color: Colors.black12,
                    //       //       blurRadius: 10,
                    //       //       offset: const Offset(0, 1),
                    //       //     ),
                    //       // ],
                    //     ),
                    //     child: DropdownButton(
                    //       style: GoogleFonts.plusJakartaSans(
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.w400,
                    //           color: Colors.black87),
                    //       underline: SizedBox(),
                    //       isExpanded: true,
                    //       value: Controller.typeAppartment.value,
                    //       onChanged: (String? newValue) {
                    //         setState(() {
                    //           Controller.typeAppartment.value = newValue!;
                    //         });
                    //       },
                    //       items: Controller.TypeList.map((String items) {
                    //         return DropdownMenuItem(
                    //           value: items,
                    //           child: Padding(
                    //             padding: EdgeInsets.only(left: 10),
                    //             child: Text(items),
                    //           ),
                    //         );
                    //       }).toList(),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Employee Salary",
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
                          controller: Controller.EmployeeSalary,
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
                              hintText: 'PKR 0',
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
                              "Employee Comission (%)",
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
                          controller: Controller.EmployeeComission,
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
                              hintText: 'Comission',
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
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 10, bottom: 10),
                      child: GestureDetector(
                        onTap: (){
                         Controller.addEmployee();
                        
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
                                "ADD Employee",
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
      child: Obx(
        ()=> ClipOval(
          child:
          Controller.ImagePath.value==""?
          Image.asset(
            'assets/avatar.png', // Replace with your actual image path
            fit: BoxFit.cover,
          ):Image.file(File(Controller.ImagePath.value)),
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
                    Controller.ImagePath.value=pickedFile.path;
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
                    Controller.ImagePath.value=pickedFile.path;
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
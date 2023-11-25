
import 'dart:io';

import 'package:crm_project/Constants/Colors.dart';
import 'package:crm_project/View/Customer/Controller/CutomerController.dart';
import 'package:crm_project/View/Employee/Controller/EmployeeController.dart';
import 'package:crm_project/View/Property/Controller/PropertyController.dart';
import 'package:crm_project/widget/CountryWidget.dart';
import 'package:crm_project/widget/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  State<AddCustomer> createState() => _ListYourPropertyScreenState();
}

class _ListYourPropertyScreenState extends State<AddCustomer> {
  var Controller=Get.put(CutomerController());
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
                    "Add Customer Detail",
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
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Customer Name",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,

                                color: AppColors.AuthTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Textfield(hint: "Name",contentPadding:22,Contorller: Controller.CutomerName,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
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
                        controller: Controller.CutomerCnic,
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
                          hintText: '00000-0000000-0',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your cnic';
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
                            "Customer Address",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,

                                color: AppColors.AuthTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Textfield(hint: "Address",contentPadding:22,Contorller: Controller.CutomerAddress,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Cutomer Email",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,

                                color: AppColors.AuthTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: Textfield(hint: "example@gmail.com",contentPadding:22,Contorller: Controller.Cutomeremail,),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                        width: width,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Cutomer Phone Number",
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
                        controller: Controller.CutomerPhone,
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
                          hintText: 'Number',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone';
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
                            "No of bought Properties",
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
                        controller: Controller.CutomerProperty,
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
                          hintText: 'Property',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your cnic';
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
                            "No of Sold Properties",
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
                        controller: Controller.CutomerSoldProperty,
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
                          hintText: 'Property',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your cnic';
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
                      child: Obx(
                        ()=> Container(
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
                                    backgroundColor: Colors.white54,
                                    color: Colors.white54,
                                  )
                                  :
                              Text(
                                "ADD Customer",
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 20,
                                    color: AppColors.LightVerison,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
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
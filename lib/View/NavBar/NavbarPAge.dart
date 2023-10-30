import 'dart:io';

import 'package:crm_project/Constants/Colors.dart';
import 'package:crm_project/View/Customer/AddCustomer.dart';
import 'package:crm_project/View/Customer/CutomerList.dart';
import 'package:crm_project/View/Dashboard/Controller/dashboardController.dart';
import 'package:crm_project/View/Deals/DealList.dart';
import 'package:crm_project/View/Employee/AddEmployee.dart';
import 'package:crm_project/View/Employee/EmployeesList.dart';
import 'package:crm_project/View/Property/property_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Drawer(
      child: ListView(
        children: [
          Container(
            width: width,
            height: 220,
            decoration: BoxDecoration(
              color: AppColors.appBackground,
              image: DecorationImage(
                image: AssetImage('assets/maskImage.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       "${Get.find<DashBoardController>().UserName.toString()}",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${Get.find<DashBoardController>().Email.toString()}",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
            // Add your child widgets here
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Employee Detail',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  minLeadingWidth: 10,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeGridView(
                    EmployeesList: Get.find<DashBoardController>().allEmployee,

                  ))),
                  //onTap: () => controller.Backup(),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Cutomer Detail',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  minLeadingWidth: 10,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CutomerGridView(
                    EmployeesList: Get.find<DashBoardController>().allCustomer,
                  ))),
                  //onTap: () => controller.Backup(),
                ),
                ListTile(
                  leading: Icon(
                    Icons.wallet,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Deals Detail',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  minLeadingWidth: 10,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DealList())),

//                  onTap: () => controller.downloadBackup(),
                  //onTap: () => controller.Backup(),
                ),
                ListTile(
                  leading: Icon(Icons.info,color: Colors.black,),
                  title: Text(
                    'About Us',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  minLeadingWidth: 10,
                  // onTap: () =>
                  //
                  //     Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => AboutUS())),
                ),
                ListTile(
                  leading: Icon(Icons.share,color: Colors.black,),
                  title: Text(
                    'Invite Friends & Family',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  minLeadingWidth: 10,
                  //onTap: () => _shareContent(),
                ),

                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Logout',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  minLeadingWidth: 10,
                  onTap: () => Get.find<DashBoardController>().logout(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }




  bool isNetworkImage(String imageUrl) {
    Uri uri = Uri.tryParse(imageUrl)!;
    return uri?.scheme == 'http' || uri?.scheme == 'https';
  }
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout',style: TextStyle
            (
              fontSize: 16
          ),),
          content: Text('Are you sure you want to log out?',style: TextStyle
            (
              fontSize: 14
          ),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.appBackground),
              ),
              onPressed: () {
                // Perform logout logic here
                // controller.Logout();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Logout',style: TextStyle(color: Colors.white),),
            ),
            SizedBox(width: 10,)
          ],
        );
      },
    );
  }

}

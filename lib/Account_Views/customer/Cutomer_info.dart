import 'package:crm_project/Account_Views/controller/accountController.dart';
import 'package:crm_project/Account_Views/customer/Customer_Detail.dart';
import 'package:crm_project/Constansts/ApisConstants.dart';
import 'package:crm_project/Constants/Colors.dart';
import 'package:crm_project/View/Customer/CutomerDetails.dart';
import 'package:crm_project/View/Employee/EmployeeDetail.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/Employee Details.dart';
class CutomerInfo extends StatefulWidget {


  @override
  State<CutomerInfo> createState() => _EmployeeAdminGridViewState();
}

class _EmployeeAdminGridViewState extends State<CutomerInfo> {
  var Controller=Get.find<AccountController>();
  final List<Employee_Detail> employees = [
    Employee_Detail(
      name: 'John Doe',
      fatherName: 'Michael Doe',
      cnic: '12345-6789012-3',
      phoneNumber: '123-456-7890',
      email: 'john@example.com',
      salary: 50000.0,
      commission: 2500.0,
      address: '123 Main Street, City',
      imageUrl: 'assets/avatar.png',
    ),

    // Add more employee data here
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.ScrennBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 50,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  "Customers",
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
                ()=>
            Controller.allCustomer.length>0?
            Expanded(
              child: Container(
                width: width,
                child: ListView.builder(
                    itemCount: Controller.allCustomer.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DustomerDetail(
                            empployee: Controller.allCustomer[index],
                          )));
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeInfoPage()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                          child: Container(
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset:
                                  Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                NetworkImage(ApiConstans.imageCutomerBaseUrl+Controller.allCustomer[index].image!),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${Controller.allCustomer[index].name!}",
                                                style: GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18.0,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Property ${Controller.allCustomer[index].noOfProperty.toString()}",
                                            style: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [

                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap:(){
                                              print("on Delet");
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerDetail(
                                                customer: Controller.allCustomer[index],
                                              )));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.green,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset:
                                                    Offset(0, 3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                                child: Text(
                                                  "Update",
                                                  style: GoogleFonts.plusJakartaSans(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16.0,
                                                      color: Colors.white
                                                  ),),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          GestureDetector(
                                            onTap:(){
                                              print("Delete");
                                              Controller.deleteCutomer(Controller.allCustomer[index].sId!);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.red,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset:
                                                    Offset(0, 3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                                child: Text(
                                                  "Delete",
                                                  style: GoogleFonts.plusJakartaSans(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16.0,
                                                      color: Colors.white
                                                  ),),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ):Text('No Customer'
                ''),
          ),
        ],
      ),
    );
  }
}

class EmployeeCard extends StatelessWidget {
  final Employee_Detail employee;

  EmployeeCard({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Add shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      margin: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Image.asset(
            employee.imageUrl,
            height: 90,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  employee.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(employee.phoneNumber),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
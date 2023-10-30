import 'package:crm_project/Constansts/ApisConstants.dart';
import 'package:crm_project/Constants/Colors.dart';
import 'package:crm_project/HR-Views/Controller/HrController.dart';
import 'package:crm_project/HR-Views/EmployeeComission/CommissionDetail.dart';
import 'package:crm_project/View/Employee/EmployeeDetail.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/Employee Details.dart';

class EmployeeList extends StatefulWidget {
  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  var Controller = Get.find<HRCController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.ScrennBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  "Employees",
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
            () => Controller.allEmployee.length > 0
                ? Expanded(
                    child: Container(
                      width: width,
                      child: ListView.builder(
                          itemCount: Controller.allEmployee.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) {
                            return Controller.checkEmployeeGetPaid(Controller
                                    .allEmployee[index].cnic
                                    .toString())
                                ? SizedBox()
                                : GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CommissionDetail(
                                                    SiD: Controller.allEmployee[index].sId.toString(),
                                                    Pay: Controller.allEmployee[index].salary.toString(),
                                                  )));
                                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeInfoPage()));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 16, right: 16, bottom: 10),
                                      child: Container(
                                        width: width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(ApiConstans
                                                                    .imageEmployeeBaseUrl +
                                                                Controller
                                                                    .allEmployee[
                                                                        index]
                                                                    .image!),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${Controller.allEmployee[index].name!}",
                                                            style: GoogleFonts
                                                                .plusJakartaSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
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
                                                        "Pay ${Controller.allEmployee[index].salary.toString()}",
                                                        style: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Commission ${Controller.allEmployee[index].commission}%",
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          print("Pay");
                                                          Controller
                                                              .PayEmployee(Controller.allEmployee[index]);
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.red,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.2),
                                                                spreadRadius: 2,
                                                                blurRadius: 5,
                                                                offset: Offset(
                                                                    0,
                                                                    3), // changes position of shadow
                                                              ),
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        10),
                                                            child: Text(
                                                              "Pay",
                                                              style: GoogleFonts.plusJakartaSans(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      16.0,
                                                                  color: Colors
                                                                      .white),
                                                            ),
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
                  )
                : Text('No Employees'
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

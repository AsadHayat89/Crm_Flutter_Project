import 'package:crm_project/Constansts/ApisConstants.dart';
import 'package:crm_project/Constants/Colors.dart';
import 'package:crm_project/HR-Views/Controller/HrController.dart';
import 'package:crm_project/Model/Employee%20Details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommissionDetail extends StatefulWidget {
  String SiD;
  String Pay;
  CommissionDetail({Key? key,required this.SiD,required this.Pay}) : super(key: key);

  @override
  State<CommissionDetail> createState() => _CommissionDetailState();
}

class _CommissionDetailState extends State<CommissionDetail> {
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
                  "Employees Deals",
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
            () => Controller.profitList.length > 0
                ? Expanded(
                    child: Container(
                      width: width,
                      child: ListView.builder(
                          itemCount: Controller.profitList.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                    onTap: () {},
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

                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Commission",
                                                            style: GoogleFonts
                                                                .plusJakartaSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 18.0,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Text(
                                                            "${Controller.profitList[index].employeeBonus}",
                                                            style: GoogleFonts
                                                                .plusJakartaSans(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Pay ${widget.Pay}",
                                                        style: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                    "${Controller.profitList[index].date}%",
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),

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
                : Text('No Deals Yet'
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

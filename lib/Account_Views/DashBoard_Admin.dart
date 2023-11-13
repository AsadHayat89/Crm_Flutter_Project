import 'package:crm_project/Account_Views/controller/accountController.dart';
import 'package:crm_project/Constansts/ApisConstants.dart';
import 'package:crm_project/Constants/Colors.dart';
import 'package:crm_project/View/Deals/dealDetailScreen.dart';
import 'package:crm_project/View/NavBar/NavbarPAge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<AdminHomePage> {
  var Controller = Get.put(AccountController());

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.ScrennBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  "DashBoard",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Controller.logout();
                    },
                    child: Icon(Icons.logout)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome Admin!",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.0,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: PieChart(
                dataMap: Controller.myMap.value,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 2.2,
                //colorList: colorList,
                initialAngleInDegree: 0,

                chartType: ChartType.ring,
                ringStrokeWidth: 32,
                centerText: "Earning Graph",
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  //legendShape: _BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    //   Controller.getListProperty("asadhayat2007@gmail.com");
                  },
                  child: Text(
                    "Expenses",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Expanded(
              child: Controller.DealList.length > 0
                  ? Container(
                      width: width,
                      height: 220,
                      child: ListView.builder(
                          itemCount: Controller.ExpensesList.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => dealDetailOption(
                                  //           dealData:
                                  //               Controller.DealList[index],
                                  //         )));
                                },
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
                                        offset: Offset(
                                            0, 3), // changes position of shadow
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
                                                // Container(
                                                //   width: 40,
                                                //   height: 40,
                                                //   decoration: BoxDecoration(
                                                //     shape: BoxShape.circle,
                                                //     image: DecorationImage(
                                                //       fit: BoxFit.cover,
                                                //       image: NetworkImage(
                                                //           ApiConstans
                                                //                   .imageDealBaseUrl +
                                                //               Controller
                                                //                   .DealList[
                                                //                       index]
                                                //                   .image!),
                                                //     ),
                                                //   ),
                                                // ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${Controller.ExpensesList[index].expenseType}",
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
                                            Row(
                                              children: [
                                                Text(
                                                  "Pkr ${Controller.ExpensesList[index].expenseAmount}",
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
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
                                            Text(
                                              "${Controller.ExpensesList[index].description}",
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.w400,
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
                    )
                  : Text("No Deal Avaialble"),
            ),
          ),
        ],
      ),
    );
  }
}

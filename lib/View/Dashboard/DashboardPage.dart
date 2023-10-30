import 'package:crm_project/Constansts/ApisConstants.dart';
import 'package:crm_project/Constants/Colors.dart';
import 'package:crm_project/View/Dashboard/Controller/dashboardController.dart';
import 'package:crm_project/View/Deals/dealDetailScreen.dart';
import 'package:crm_project/View/NavBar/NavbarPAge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //var Controller = Get.put(homeController());
  var Controller=Get.put(DashBoardController());
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.ScrennBackgroundColor,
      key: _key,
      drawer: NavBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:(){
                    _key.currentState!.openDrawer();
                  },
                  child: SvgPicture.asset("assets/more.svg",
                      semanticsLabel: 'Acme Logo'),
                ),
                Text(
                  "DashBoard",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome Mukarram!",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Image.asset("assets/groupImage.png"),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    //   Controller.getListProperty("asadhayat2007@gmail.com");
                  },
                  child: Text(
                    "Monthly Deals",
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
            ()=> Expanded(
              child:

              Controller.DealList.length>0?
              Container(
                width: width,
                height: 220,
                child: ListView.builder(
                    itemCount: Controller.DealList.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => dealDetailOption(dealData: Controller.DealList[index],)));
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
                                                    NetworkImage(ApiConstans.imageDealBaseUrl+Controller.DealList[index].image!),
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
                                                "${Controller.DealList[index].property}",
                                                style: GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              Text(
                                                "Propert :${Controller.DealList[index].property}",
                                                style: GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Pkr ${Controller.DealList[index].soldPrice}",
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
                                        MainAxisAlignment.end
                                    ,
                                    children: [
                                      Text(
                                        "${Controller.DealList[index].date}",
                                        style: GoogleFonts.plusJakartaSans(
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
              ):Text("No Deal Avaialble"),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:crm_project/Account_Views/DashBoard_Admin.dart';
import 'package:crm_project/Account_Views/Deal/Deal_Info.dart';
import 'package:crm_project/Account_Views/Employee/Employee_Detail.dart';
import 'package:crm_project/Account_Views/customer/Cutomer_info.dart';
import 'package:crm_project/Constants/Colors.dart';
import 'package:crm_project/View/Customer/AddCustomer.dart';
import 'package:crm_project/View/Customer/Controller/CutomerController.dart';
import 'package:crm_project/View/Dashboard/DashboardPage.dart';
import 'package:crm_project/View/Employee/AddEmployee.dart';
import 'package:crm_project/View/Property/property_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class AdminNavigationBar extends StatefulWidget {
  static List<Widget> _widgetOptions = <Widget>[
    AdminHomePage(),
    EmployeeAdminGridView(),
    DealList(),
    CutomerInfo(),

  ];

  @override
  State<AdminNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<AdminNavigationBar> {
  int _selectedIndex = 0;
  //var Controller=Get.put(MainController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Controller.initConsts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Center(
        child: AdminNavigationBar._widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 20,
              blurRadius: 15,
              offset: Offset(
                  0, 1), // changes position of shadow
            ),
          ],
        ),
        child:

        BottomNavigationBar(
            showUnselectedLabels: true,

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  label: "Home",

                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Icon(FontAwesomeIcons.home,size: 24,),
                  ),
                  // title: Text('Home'),
                  backgroundColor: Colors.white54),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.person,size: 24,),
                  ),
                  label: "Employee",
                  // title: Text('Search'),
                  backgroundColor: Colors.white54),
              BottomNavigationBarItem(
                label: "Deal",
                icon: Icon(Icons.wallet_membership_outlined,
                  color: _selectedIndex==2?AppColors.appBackground:AppColors.bottomIconUnSelected,
                  size: 28,
                ),
                //
                backgroundColor: Colors.white54,
              ),
              BottomNavigationBarItem(
                label: "Cutomer",
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Icon(FontAwesomeIcons.person
                    ,size: 24,),
                ),
                backgroundColor: Colors.white54,
              ),



            ],
            type:  BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.appBackground,
            unselectedItemColor: AppColors.bottomIconUnSelected,
            selectedFontSize: 16,
            unselectedFontSize:10,
            iconSize: 40,
            onTap: (value){
              print("selected values: "+value.toString());
              //_selectedIndex
              setState(() {
                _selectedIndex=value;
              });
              print("values we get: "+value.toString());
            },
            elevation: 5),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Future<void> showSimplePopup(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false, // Prevents dismissing the dialog on outside tap
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/AddExpenses');
                  },
                  child: Text(
                    'Add Income',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(width:
                double.infinity,
                  height: 1,
                  color: Colors.black54,),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/RemoveExpenses');
                  },
                  child: Text(
                    'Add Expense',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        );
      },
    );
  }

}
class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint _paint = Paint()
      ..color = Colors.cyan
      ..strokeWidth = 5
      ..isAntiAlias = true;

    canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx, 0), _paint);
  }




}
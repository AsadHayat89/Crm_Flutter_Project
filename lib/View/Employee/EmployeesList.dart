import 'package:crm_project/Constansts/ApisConstants.dart';
import 'package:crm_project/Constants/Colors.dart';
import 'package:crm_project/Model/Employee.dart';
import 'package:crm_project/View/Employee/EmployeeDetail.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/Employee Details.dart';
class EmployeeGridView extends StatefulWidget {
  final List<Employee> EmployeesList;
   EmployeeGridView({Key? key,required this.EmployeesList}) : super(key: key);
  @override
  State<EmployeeGridView> createState() => _EmployeeGridViewState();
}

class _EmployeeGridViewState extends State<EmployeeGridView> {



  @override
  Widget build(BuildContext context) {
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
          Expanded(child:
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
            ),
            itemCount: widget.EmployeesList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeInfoPage(
                      empployee: widget.EmployeesList[index],
                    )));
                  },
                  child: EmployeeCard(employee: widget.EmployeesList[index]));
            },
          ),)
        ],
      ),
    );
  }
}

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  EmployeeCard({required this.employee});

  @override
  Widget build(BuildContext context) {
    print(ApiConstans.imageEmployeeBaseUrl+employee.image!);
    return Card(
      elevation: 4, // Add shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      margin: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Image.network(
            ApiConstans.imageEmployeeBaseUrl+employee.image!,
            height: 90,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  employee.name!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(employee.phone!.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
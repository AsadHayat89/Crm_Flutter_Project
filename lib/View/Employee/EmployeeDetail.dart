import 'package:crm_project/Constansts/ApisConstants.dart';
import 'package:crm_project/Model/Employee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/Employee Details.dart';
class EmployeeInfoPage extends StatefulWidget {
  Employee empployee;

  EmployeeInfoPage({Key? key,required this.empployee}) : super(key: key);

  @override
  State<EmployeeInfoPage> createState() => _EmployeeInfoPageState();
}

class _EmployeeInfoPageState extends State<EmployeeInfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  SizedBox(),
                    Text(
                      "Employee Detail",
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
                padding: EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(ApiConstans.imageEmployeeBaseUrl+widget.empployee.image!),
                ),
              ),
              ListTile(
                title: Text('Name'),
                subtitle: Text(widget.empployee.name!),
              ),
              ListTile(
                title: Text('Father Name'),
                subtitle: Text(widget.empployee.fatherName!),
              ),
              ListTile(
                title: Text('CNIC'),
                subtitle: Text(widget.empployee.cnic.toString()),
              ),
              ListTile(
                title: Text('Phone Number'),
                subtitle: Text(widget.empployee.phone!.toString()),
              ),
              ListTile(
                title: Text('Designation'),
                subtitle: Text(widget.empployee!.designation.toString()),
              ),
              ListTile(
                title: Text('Email'),
                subtitle: Text(widget.empployee.email!),
              ),
              ListTile(
                title: Text('Salary'),
                subtitle: Text('PKR ${widget.empployee.salary}'),
              ),
              ListTile(
                title: Text('Commission'),
                subtitle: Text('PKR ${widget.empployee.commission}'),
              ),
              ListTile(
                title: Text('Address'),
                subtitle: Text(widget.empployee.address!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







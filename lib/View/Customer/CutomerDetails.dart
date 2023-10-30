import 'package:crm_project/Constansts/ApisConstants.dart';
import 'package:crm_project/Model/Cutomer.dart';
import 'package:crm_project/Model/Employee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/Employee Details.dart';
class DustomerDetail extends StatefulWidget {
  Cutomer empployee;

  DustomerDetail({Key? key,required this.empployee}) : super(key: key);

  @override
  State<DustomerDetail> createState() => _EmployeeInfoPageState();
}

class _EmployeeInfoPageState extends State<DustomerDetail> {

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
                      "Cutomer Detail",
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
                  backgroundImage: NetworkImage(ApiConstans.imageCutomerBaseUrl+widget.empployee.image!),
                ),
              ),
              ListTile(
                title: Text('Name'),
                subtitle: Text(widget.empployee.name!),
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
                title: Text('Email'),
                subtitle: Text(widget.empployee.email!),
              ),
              ListTile(
                title: Text('Properties'),
                subtitle: Text('\$${widget.empployee.noOfProperty}'),
              ),
              ListTile(
                title: Text('Sold Properties'),
                subtitle: Text('\$${widget.empployee.noOfProperty}'),
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







import 'package:crm_project/Constansts/ApisConstants.dart';
import 'package:crm_project/Model/Inventry.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dealDetailOption extends StatefulWidget {
  Inventry dealData;

  dealDetailOption({Key? key, required this.dealData}) : super(key: key);

  @override
  State<dealDetailOption> createState() => _dealDetailState();
}

class _dealDetailState extends State<dealDetailOption> {
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
                      "Deal Detail",
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
                  backgroundImage: NetworkImage(
                      ApiConstans.imageInvetryBaseUrl + widget.dealData.image!),
                ),
              ),
              ListTile(
                title: Text('Property Type'),
                subtitle: Text(widget.dealData.propertyType!),
              ),
              ListTile(
                title: Text('Contact Number'),
                subtitle: Text(widget.dealData.contact!),
              ),
              if (widget.dealData.propertyType != "Build")
                ListTile(
                  title: Text('File Number'),
                  subtitle: Text(widget.dealData.fileNumber.toString()!),
                ),
              if (widget.dealData.propertyType != "Build")
                ListTile(
                  title: Text('Location'),
                  subtitle: Text(widget.dealData.location.toString()),
                ),
              if (widget.dealData.propertyType == "Build")
                ListTile(
                  title: Text('Property Size (Marla)'),
                  subtitle: Text(widget.dealData.propertySize.toString()),
                ),
              if (widget.dealData.propertyType == "Build")
                ListTile(
                  title: Text('Rooms'),
                  subtitle: Text(widget.dealData.rooms.toString()),
                ),
              if (widget.dealData.propertyType == "Build")
                ListTile(
                  title: Text('Bedroom'),
                  subtitle: Text(widget.dealData.bedroom.toString()),
                ),
              if (widget.dealData.propertyType == "Build")
                ListTile(
                  title: Text('BathRoom'),
                  subtitle: Text('\$${widget.dealData.bathroom.toString()}'),
                ),

              ListTile(
                title: Text('Description'),
                subtitle: Text('\$${widget.dealData.description}'),
              ),

            ],
          ),
        ),
      ),
    );
  }

}

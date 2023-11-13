import 'package:crm_project/Constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Textfield extends StatefulWidget {
  String hint;
  double contentPadding;
  TextEditingController Contorller;
  Textfield({Key? key,required this.hint,required this.contentPadding,required this.Contorller}) : super(key: key);

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.contentPadding+40,
      decoration: BoxDecoration(
        color: Colors.transparent,

        borderRadius: BorderRadius.all(Radius.circular(15)),
        // boxShadow: [
        //   if(AppConstants.lightVersion==0)
        //     BoxShadow(
        //       color: Colors.black12,
        //       blurRadius: 10,
        //       offset: const Offset(0, 1),
        //     ),
        // ],
      ),
      child: TextFormField(
        maxLines: null,
        expands: true,
        controller: widget.Contorller,
        textCapitalization: TextCapitalization.words,
        cursorColor: Colors.black,
        decoration: InputDecoration(

            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            fillColor: AppColors.textFieldFillColore,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle:
            GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87),
            hintText: widget.hint,
            hintStyle:
            GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87)),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
      ),
    );
  }
}
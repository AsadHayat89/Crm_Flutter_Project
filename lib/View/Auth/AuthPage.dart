import 'package:crm_project/Account_Views/bottomBar/BottomBar.dart';
import 'package:crm_project/Constants/Colors.dart';
import 'package:crm_project/HR-Views/BottomBar.dart';
import 'package:crm_project/View/Auth/controller/authController.dart';
import 'package:crm_project/View/BottomBar/BottomBarPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int selected = 0;

  var Contorller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: 270,
              decoration: BoxDecoration(
                color: AppColors.appBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50, left: 20),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      width: width,
                      height: 150,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60),
                        child: SvgPicture.asset("assets/newlogo.svg",
                            semanticsLabel: 'Acme Logo'),
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 0;
                        });
                      },
                      child: Container(
                          width: width / 2,
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: selected == 0
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 20.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Container(
                                  width: width / 2,
                                  height: selected == 0 ? 3 : 1,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 1;
                        });
                      },
                      child: Container(
                          width: width / 2,
                          child: Column(
                            children: [
                              Text(
                                "SignUp",
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: selected == 1
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 20.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10, top: 10),
                                child: Container(
                                  width: width / 2,
                                  height: selected == 1 ? 3 : 1,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            if (selected == 0)
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Email",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
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
                          controller: Contorller.SignInEmail,
                          style:
                              GoogleFonts.plusJakartaSans(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fillColor: AppColors.textFieldFillColore,
                              filled: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.black.withOpacity(0.7)),
                              hintText: 'Enter your email',
                              hintStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.black.withOpacity(0.7))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Password",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
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
                          controller: Contorller.SignInPassword,
                          style:
                              GoogleFonts.plusJakartaSans(color: Colors.black),
                          obscureText: true,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fillColor: AppColors.textFieldFillColore,
                              filled: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.black.withOpacity(0.7)),
                              hintText: 'Enter your Password',
                              hintStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.black.withOpacity(0.7))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Type",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5, left: 20, right: 20, bottom: 20),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColors.textFieldFillColore,

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
                        child: DropdownButton(
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                          underline: SizedBox(),
                          isExpanded: true,
                          value: Contorller.SelectedAppartemnt,
                          onChanged: (String? newValue) {
                            setState(() {
                              //selectedTypeList.value=newValue!;
                              Contorller.SelectedAppartemnt = newValue!;
                            });
                          },
                          items: Contorller.typeAppartment.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(items),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          Contorller.PerformSignIn(context);
                        },
                        child: Obx(
                          () => Container(
                            height: 55,
                            width: width,
                            decoration: BoxDecoration(
                              color: AppColors.appBackground,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Contorller.login.value
                                    ? CircularProgressIndicator(
                                        color: Colors.white54,
                                        backgroundColor: Colors.white54,
                                      )
                                    : Text(
                                        "Login",
                                        style: GoogleFonts.plusJakartaSans(
                                            fontSize: 22,
                                            color: AppColors.LightVerison,
                                            fontWeight: FontWeight.normal),
                                      )),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "or Login with",
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          color: AppColors.AuthTextColor,
                          fontWeight: FontWeight.normal),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/Facebook.svg",
                              semanticsLabel: 'Acme Logo'),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset("assets/Google.svg",
                              semanticsLabel: 'Acme Logo'),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset("assets/Apple.svg",
                              semanticsLabel: 'Acme Logo'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "or ",
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              color: AppColors.AuthTextColor,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "Login or continue as guest",
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              color: AppColors.AuthTextColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (selected == 1)
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Full Name",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5, left: 20, right: 20, bottom: 10),
                      child: Container(
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
                          controller: Contorller.SignUpfullName,
                          style:
                              GoogleFonts.plusJakartaSans(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fillColor: AppColors.textFieldFillColore,
                              filled: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.black.withOpacity(0.7)),
                              hintText: 'John Wick',
                              hintStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.black.withOpacity(0.7))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "UserName",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5, left: 20, right: 20, bottom: 10),
                      child: Container(
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
                          controller: Contorller.SignUpUserName,
                          style:
                              GoogleFonts.plusJakartaSans(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fillColor: AppColors.textFieldFillColore,
                              filled: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.black.withOpacity(0.7)),
                              hintText: 'john123',
                              hintStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.black.withOpacity(0.7))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Email",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
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
                          controller: Contorller.SignUpEmail,
                          style:
                              GoogleFonts.plusJakartaSans(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fillColor: AppColors.textFieldFillColore,
                              filled: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.black.withOpacity(0.7)),
                              hintText: 'Enter your email',
                              hintStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.black.withOpacity(0.7))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Password",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5, left: 20, right: 20, bottom: 20),
                      child: Container(
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
                          controller: Contorller.SignUpPassword,
                          style:
                              GoogleFonts.plusJakartaSans(color: Colors.black),
                          obscureText: true,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fillColor: AppColors.textFieldFillColore,
                              filled: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.black.withOpacity(0.7)),
                              hintText: 'Enter your Password',
                              hintStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.black.withOpacity(0.7))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Container(
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Type",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  color: AppColors.AuthTextColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5, left: 20, right: 20, bottom: 20),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColors.textFieldFillColore,

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
                        child: DropdownButton(
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                          underline: SizedBox(),
                          isExpanded: true,
                          value: Contorller.SelectedAppartemnt,
                          onChanged: (String? newValue) {
                            setState(() {
                              //selectedTypeList.value=newValue!;
                              Contorller.SelectedAppartemnt = newValue!;
                            });
                          },
                          items: Contorller.typeAppartment.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(items),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 10),
                      child: GestureDetector(
                        onTap: () {
                          Contorller.PerformSignUp(context);
                        },
                        child: Obx(
                          ()=> Container(
                            height: 55,
                            width: width,
                            decoration: BoxDecoration(
                              color: AppColors.appBackground,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Contorller.login.value
                                    ? CircularProgressIndicator(
                                        color: Colors.white54,
                                        backgroundColor: Colors.white54,
                                      )
                                    : Text(
                                        //Contorller.button.value,
                                        "SignUP",
                                        style: GoogleFonts.plusJakartaSans(
                                            fontSize: 22,
                                            color: AppColors.LightVerison,
                                            fontWeight: FontWeight.normal),
                                      )),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "or ",
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              color: AppColors.AuthTextColor,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "Sign Up or continue as guest",
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              color: AppColors.AuthTextColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            // Container(
            //   width: width,
            //   height: height/1.7,
            //   child: selected==0?LoginPageView():LoginPageView(),
            // )
          ],
        ),
      ),
    );
  }
}

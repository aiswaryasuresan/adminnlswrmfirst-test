import 'dart:async';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Admin_HomPage.dart';



//import 'package:flutter_icons/flutter_icons.dart';
//import 'package:google_fonts/google_fonts.dart';

class
AdminSplash_screen extends StatefulWidget {
  _AdminSplash_screenState createState() => _AdminSplash_screenState();
}

class _AdminSplash_screenState extends State<AdminSplash_screen> {
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Admin_HomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,


      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/nileswram.png",
                height: 45,
                width: 45,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Nileswaram.com",
                style: GoogleFonts.aclonica(
                  color: Colors.red.shade900,
                  fontSize: 11.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],


      ),
    );
  }
}

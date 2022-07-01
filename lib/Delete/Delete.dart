import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'Delete_Advertaisement.dart';
import 'Delete_Event.dart';
import 'Delete_News.dart';
import 'Delete_Organisation.dart';
import 'Delete_Public_Numbers.dart';
import 'Delete_Representatives.dart';
import 'Delete_Services.dart';
import 'Delete_Shop_Budsiness.dart';
import 'Delete_Tourist_Place.dart';

class Delete extends StatefulWidget {
  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Delete",
          style: GoogleFonts.prompt(color: Colors.red.shade900),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.red.shade900,
            size: 35, // add custom icons also
// add custom icons also
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delete_Event()));
                },
                leading: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.blueGrey.shade900,
                ),
                title: Text("Delete Event",
                    style: GoogleFonts.prompt(fontSize: 20)),
              ),
            ),



            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delete_Advertaisement()));
                },
                leading: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.blueGrey.shade900,
                ),
                title: Text("Delete Advertaisement",
                    style: GoogleFonts.prompt(fontSize: 20)),
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delete_News()));
                },
                leading: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.blueGrey.shade900,
                ),
                title: Text("Delete News",
                    style: GoogleFonts.prompt(fontSize: 20)),
              ),
            ),



            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Delete_Shop_business()));
                },
                leading: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.blueGrey.shade900,
                ),
                title: Text("Delete Shop/Business",
                    style: GoogleFonts.prompt(fontSize: 20)),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Delete_Services()));
                },
                leading: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.blueGrey.shade900,
                ),
                title: Text("Delete Services",
                    style: GoogleFonts.prompt(fontSize: 20)),
              ),
            ),




            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delete_Organisation()));
                },
                leading: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.blueGrey.shade900,
                ),
                title: Text("Delete Organisation",
                    style: GoogleFonts.prompt(fontSize: 20)),
              ),
            ),



            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delete_Tourist_Place()));
                },
                leading: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.blueGrey.shade900,
                ),
                title: Text("Delete Tourist Place",
                    style: GoogleFonts.prompt(fontSize: 20)),
              ),
            ),



            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delete_Public_Numbers()));
                },
                leading: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.blueGrey.shade900,
                ),
                title: Text("Delete Public Numbers",
                    style: GoogleFonts.prompt(fontSize: 20)),
              ),
            ),



            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delete_Representatives()));
                },
                leading: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.blueGrey.shade900,
                ),
                title: Text("Delete Representatives",
                    style: GoogleFonts.prompt(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

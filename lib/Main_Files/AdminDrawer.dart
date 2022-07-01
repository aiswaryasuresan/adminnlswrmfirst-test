import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Delete/Delete_Advertaisement.dart';
import '../Delete/Delete_Event.dart';
import '../Service/Service_Registration.dart';
import 'About_Us.dart';
import '../Delete/Delete.dart';
import '../Main_Registration/Main_Registration.dart';
import '../Other_Registrations/Admin_Advertisement_Reg.dart';
import '../Other_Registrations/Admin_News_Registration.dart';
import '../Other_Registrations/Admin_event_Registration.dart';
import '../Other_Registrations/Public_Numbers.dart';
import '../Other_Registrations/Public_Organistation_Registration.dart';
import '../Other_Registrations/Representative_Registration.dart';
import '../Other_Registrations/Tourist_Registration.dart';






class AdminDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(
                    "assets/nileswram.png",
                  ),

                ),

                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Nileshwaram.com",
                    style: GoogleFonts.aclonica(
                      color: Colors.red.shade900,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),


        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => About_Us()));
          },
          leading: Icon(
            Icons.menu,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("About Us",
              style: GoogleFonts.prompt(
                fontSize: 15,
              )),
        ),


        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Main_Registration_Page()));
          },
          leading: Icon(
            Icons.business,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Business/Shop Registration",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),

        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Service_Registration_Page()));
          },
          leading: Icon(
            Icons.business,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Service Registration",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),



        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Admin_News_Reg()));
          },
          leading: Icon(
            Icons.newspaper_rounded,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("News Registration",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Admin_Event_Regt()));
          },
          leading: Icon(
            Icons.image,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Event Registration",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),

        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Admin_Advertisemen_Regt()));
          },
          leading: Icon(
            Icons.web_asset_sharp,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Advertisement Registration",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),



        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Public_Organisation_Reg()));
          },
          leading: Icon(
            Icons.business_outlined,
            color: Colors.blueGrey.shade900,
          ),
          title: Text(" Organisation Registration",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),







        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Tourist_Reg()));
          },
          leading: Icon(
            Icons.photo,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Tourist Place Registration",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),





        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Public_Numbers_Registration()));
          },
          leading: Icon(
            Icons.business_outlined,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Public Number Registration",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),

        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Representative_Reg()));
          },
          leading: Icon(
            Icons.person,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Representive Registration",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),

        // ListTile(
        //   onTap: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => Delete_Event()));
        //   },
        //   leading: Icon(
        //     Icons.delete_forever,
        //     color: Colors.blueGrey.shade900,
        //   ),
        //   title: Text("Delete Event",
        //       style: GoogleFonts.prompt(fontSize: 15)),
        // ),
        //
        // ListTile(
        //   onTap: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => Delete_Advertaisement()));
        //   },
        //   leading: Icon(
        //     Icons.delete_forever,
        //     color: Colors.blueGrey.shade900,
        //   ),
        //   title: Text("Delete Advertaisement",
        //       style: GoogleFonts.prompt(fontSize: 15)),
        // ),

        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Delete()));
          },
          leading: Icon(
            Icons.delete_forever_rounded,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Delete",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),

      ]),
    );
  }
}


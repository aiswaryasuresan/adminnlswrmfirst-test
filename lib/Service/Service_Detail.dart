
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';

class Service_Detail extends StatelessWidget {
  final passing_data;

  const Service_Detail(this.passing_data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.pink.shade800,
      //   title: Text(passing_data.name),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            FullScreenWidget(
              child: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width / 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      passing_data.image,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              //padding: EdgeInsets.symmetric(vertical: 100, horizontal: 25),
              padding: EdgeInsets.only(top: 250),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/7,
                    width: MediaQuery.of(context).size.width/1,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade200,
                      //  color: Color(0xB6C33A),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 30,left: 30,top: 10),
                            // padding:EdgeInsets.all(20),
                            child: Text(
                              passing_data.name,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        Padding(
                          // padding: EdgeInsets.only(right: 120),
                            padding: EdgeInsets.only(right: 30,left: 30,top: 10),
                            child: Text(
                              passing_data.address,
                              style: GoogleFonts.inter(
                                fontSize: 11,
                              ),
                            )),
                        SizedBox(height: 5,),
                        Padding(
                          //padding: EdgeInsets.only(right: 167),
                            padding: EdgeInsets.only(right: 30,left: 30,top: 10),
                            child: GestureDetector(

                              child: GestureDetector(
                                onTap: () async => !await launch(passing_data.website),
                                child: Text(
                                  "Website:" +  passing_data.website,
                                  style: GoogleFonts.inter(
                                      fontSize: 13, color: Colors.red
                                      ,fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 20,
                      ),
                      Container(
                          height: 35,
                          width: 35,
                          child: Icon(
                            Icons.phone,
                            size: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10))),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 20,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: GestureDetector(
                                  onTap: () async => !await launch('sms:' + passing_data.phone),
                                  child: Text(
                                    passing_data.phone,
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 22,
                          ),
                          Container(
                            height: 20,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: GestureDetector(
                                  onTap: () async => !await launch('sms:' + passing_data.mobile),
                                  child: Text(
                                    passing_data.mobile,
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 20,
                      ),
                      Container(
                          height: 35,
                          width: 35,
                          child: Icon(
                            Icons.email_outlined,
                            size: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10))),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 20,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: GestureDetector(
                                  onTap: ()async {
                                    var result = await OpenMailApp.openMailApp();
                                    if (!result.didOpen && !result.canOpen) {
                                      showNoMailAppsDialog(context);
                                    } else if (!result.didOpen && result.canOpen) {
                                      showDialog(
                                        context: context,
                                        builder: (_) {
                                          return MailAppPickerDialog(
                                            mailApps: result.options,
                                          );
                                        },
                                      );
                                    }
                                  },

                                  child: Text(
                                    passing_data.email,
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        decoration: TextDecoration.underline,

                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                )),
                          ),
                        ],
                      ),


                    ],
                  ),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 20,
                      ),
                      Container(
                          height: 35,
                          width: 35,
                          child: Icon(
                            Icons.bloodtype_outlined,
                            size: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10))),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Blood Group",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 20,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                                  passing_data.blood,
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width / 20,
                  //     ),
                  //     Container(
                  //         height: 35,
                  //         width: 35,
                  //         child: Icon(
                  //           Icons.format_list_bulleted,
                  //           size: 20,
                  //         ),
                  //         decoration: BoxDecoration(
                  //             color: Colors.grey.shade300,
                  //             borderRadius: BorderRadius.circular(10))),
                  //     SizedBox(
                  //       width: 20,
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           "Other Products",
                  //           style: GoogleFonts.inter(
                  //               fontSize: 13,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.grey.shade600),
                  //         ),
                  //         SizedBox(
                  //           height: 5,
                  //         ),
                  //         Container(
                  //           height: 100,
                  //           width: 250,
                  //           decoration: BoxDecoration(
                  //               color: Colors.orange.shade100,
                  //               borderRadius: BorderRadius.circular(10)),
                  //           child: Center(
                  //               child: Text(
                  //                 passing_data.other_pro,
                  //                 style: GoogleFonts.inter(
                  //                     fontSize: 12,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.red),
                  //               )),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  Text(
                    "Other Services",
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(10),
                    height:MediaQuery.of(context).size.height/4,
                    width:MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                          passing_data.other_pro,
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        )),
                  ),



                  SizedBox(height: 30,),
                  // Container(
                  //   // child: Image.asset('assets/location.jpeg'),
                  //   height:MediaQuery.of(context).size.height/6,
                  //   width:MediaQuery.of(context).size.width/1.2,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1,color: Colors.red.shade100),
                  //       color: Colors.grey,
                  //       image: DecorationImage(
                  //         image: AssetImage('assets/loca.jpeg'),
                  //         fit: BoxFit.cover,
                  //       ),
                  //       borderRadius: BorderRadius.circular(10)),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          primary: Colors.red.shade900,
                          padding: EdgeInsets.symmetric(horizontal: 90, vertical: 18),
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      onPressed: () => MapsLauncher.launchQuery(
                          passing_data.name + passing_data.address),

                      child: Text("View Direction",style: GoogleFonts.inter(fontSize: 15),),

                    ),
                  ),

                  SizedBox(height: 5,),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width/1.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width:1,color: Colors.grey)
                    ),
                    child: Column(children:[
                      SizedBox(height: 10,),
                      Text("Connect Us On",style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.bold),),
                      //   Image.asset('assets/facebook.png',height: 40,width: 40,fit: BoxFit.fill,),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async => !await launch(passing_data.facebook),
                            child: Image.asset(
                              "assets/facebook.png",
                              height: 40,
                              width: 40,
                            ),
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: () async => !await launch(passing_data.insta),
                            child: Image.asset(
                              "assets/instagram.png",
                              height: 40,
                              width: 40,
                            ),
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: () async => await launch(
                                "https://wa.me/${passing_data.watsap}?text=Hello"),
                            child: Image.asset(
                              "assets/watsap.png",
                              height: 40,
                              width: 40,
                            ),
                          ),




                        ],
                      )
                    ],
                    ),

                  ),

                  // Image(
                  //   image: AssetImage('assets/facebook.png')),

                ],
              ),
            ),
          ],
        ),
      ),










    );
  }
  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}








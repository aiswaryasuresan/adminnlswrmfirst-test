import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/Main_Files/view_more.dart';
import '../Service/Service_Container.dart';
import 'About_Us.dart';
import 'AdminCatagory_image_buttons.dart';
import 'AdminDrawer.dart';
import '../Admin_DropdownSearch/Searchbar.dart';
import '../Admin_Carousels/Admin_Advertaisement_carousel.dart';
import '../Admin_Carousels/Admin_EventDisplay.dart';
import '../Display_Other_Catagory/Public_Tourist_Local_Display_Container.dart';
import '../New_News_Container/News_Container.dart';



class Admin_HomePage extends StatefulWidget {
  const Admin_HomePage({Key? key}) : super(key: key);


  @override
  _Admin_HomePageState createState() => _Admin_HomePageState();
}

class _Admin_HomePageState extends State<Admin_HomePage> {

  bool isReadmore= false;


  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FF),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Nileshwaram.com",
          style: GoogleFonts.aclonica(
            color: Colors.red.shade900,
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.red.shade900),
        elevation: 0.0,
        backgroundColor: Color(0xFFF6F7FF),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey.shade700,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Admin_HomePage()));
                },
                child: Icon(
                  Icons.refresh_sharp,
                  size: 30,
                )),
            label: 'Refresh',
          ),


          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => View_More()));
                },
                child: Icon(
                  Icons.menu_open_rounded,
                  size: 30,
                )),
            label: 'Catagory',
          ),


          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => About_Us()));
                },
                child: Icon(
                  Icons.menu,
                  size: 30,
                )),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,

      ),



      drawer: Drawer(
        child: AdminDrawer(),
      ),
      body: Column(
        children: [

          Admin_Search_Bar(),

          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                   // Admin_Adcarousel(),
                    AdminAd_Sliderscreen(),


                    SizedBox(height: 20,),



                    Text(
                      "News",
                      style: GoogleFonts.prompt(
                        fontSize: 18,
                        color: Colors.blueGrey.shade900,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    News_Container(),

                   // News_Display(),

                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Select Category",
                      style: GoogleFonts.prompt(
                          fontSize: 18, color: Colors.blueGrey.shade900),
                    ),
                    // Carousel(),
                    SizedBox(
                      height: 10,
                    ),


                    Admin_CatagoryimageButton(),



                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Other Category",
                      style: GoogleFonts.prompt(
                          fontSize: 18, color: Colors.blueGrey.shade900),
                    ),
                    SizedBox(
                      height: 10,
                    ),


                  //  Public_Tourist_Local_Display_Container(),
                    Public_Tourist_Local_Display_Container2(),
                    Text(
                      "Services",
                      style: GoogleFonts.prompt(
                          fontSize: 18, color: Colors.blueGrey.shade900),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Service_Container(),
                    SizedBox(height: 20,),


                    Text(
                      "Events",
                      style: GoogleFonts.prompt(
                          fontSize: 18, color: Colors.blueGrey.shade900),
                    ),


                    AdminEventDisplay(),


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Public_Numbers_display.dart';
import 'Public_organisation_display.dart';
import 'Representative_display.dart';
import 'Tourist_Place_display.dart';






class Public_Tourist_Local_Display_Container2 extends StatefulWidget {
  @override
  Public_Tourist_Local_Display_Container2State createState() => new Public_Tourist_Local_Display_Container2State();
}

class Public_Tourist_Local_Display_Container2State extends State<Public_Tourist_Local_Display_Container2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      padding: EdgeInsets.all(20),
      height: 140,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Tourist_Display_with_searchbar()));

                      },
                      child: new Image.asset(
                        'assets/tourist.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                    TextButton(onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Tourist_Display_with_searchbar()));
                      // Navigator.push(context,MaterialPageRoute(builder: (context)=>Hotel_Sub_Display()));
                    }, child: Text("Attractions",style:GoogleFonts.quicksand(
                        color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold,fontSize: 12),))
                    // new Text(
                    //   "shop",
                    //   style:
                    //       TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                    // )
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    GestureDetector(
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Organisation_Display_with_searchbar()));
                      },
                      child: new Image.asset(
                        'assets/public.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                    TextButton(onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Organisation_Display_with_searchbar()));
                    }, child: Text(

                      "Organisations",style:GoogleFonts.quicksand(
                      color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold,fontSize: 12,),))

                  ],
                ),




                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:(){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Public_Numbers_Display_with_searchbar()));
                      } ,
                      child: new Image.asset(
                        'assets/ob.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Public_Numbers_Display_with_searchbar()));
                    }, child: Text("Public Numbers",style:GoogleFonts.quicksand(color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold,fontSize: 12),))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Representatives_Display_with_searchbar()));
                      } ,
                      child: new Image.asset(
                        'assets/profile.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Representatives_Display_with_searchbar()));
                    }, child: Text("Representative",style:GoogleFonts.quicksand(color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold,fontSize: 12),))
                  ],
                ),
              ],
            ),
          ),
              ],
      ),
    );
  }
}

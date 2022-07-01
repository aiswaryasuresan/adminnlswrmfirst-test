import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:http/http.dart' as http;

class AdminAd_Sliderscreen extends StatefulWidget {
  const AdminAd_Sliderscreen({Key? key}) : super(key: key);

  @override
  _AdminAd_SliderscreenState createState() => _AdminAd_SliderscreenState();
}

class _AdminAd_SliderscreenState extends State<AdminAd_Sliderscreen> {
  var imageList;

  //late List imageList;
  bool loading = true;
  String imagefolder =
   "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/adimages/";

  fetchAllImage() async {
    final response = await http.get(Uri.parse(
        "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/get_image.php"));
    if (response.statusCode == 200) {
      setState(() {
        imageList = jsonDecode(response.body);
        loading = false;
      });
    }
    print(imageList);
  }

  @override
  void initState() {
    fetchAllImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 20),
        height: 170,
        width: MediaQuery.of(context).size.width,
        child: loading
            ? CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.red.shade900,
              // semanticsLabel:'Please check your Network connection',
              )
            : Carousel(
                borderRadius: true,
                radius: Radius.circular(40),
                boxFit: BoxFit.contain,
                autoplay: true,
                animationCurve: Curves.bounceOut,
                animationDuration: Duration(milliseconds: 3000),
                dotSize: 5.0,
                dotIncreasedColor: Color(0xFFFF335C),
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 10.0,
                showIndicator: true,
                indicatorBgPadding: 5.0,
                autoplayDuration:Duration(seconds: 3),
                images: imageList.map((element) {
                  return Image.network(imagefolder + element['image'],
                   //height: 170,

                  );
                }).toList(),
              ),

    );
  }
}

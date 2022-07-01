import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Admin_DropdownSearch/search.dart';

import 'New_Searchbar_(value-other_pro).dart';





class Admin_Search_Bar extends StatefulWidget {
  const Admin_Search_Bar({Key? key}) : super(key: key);

  @override
  _Admin_Search_BarState createState() => _Admin_Search_BarState();
}

class _Admin_Search_BarState extends State<Admin_Search_Bar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(40.0),
        shadowColor: Color(0x55434343),
        child: TextField(
          onTap: () {
            Navigator.push(
                // context, MaterialPageRoute(builder: (context) => Cust_Searchbar_Home()));
                context, MaterialPageRoute(builder: (context) => New_Searchbar()));
          },
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: "Search for Shops,.",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black54,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

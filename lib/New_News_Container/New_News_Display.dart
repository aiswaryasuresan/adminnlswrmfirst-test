import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'News_Details.dart';




class News_Display_with_delete extends StatefulWidget {
  @override
  _News_Display_with_deleteState createState() => new _News_Display_with_deleteState();
}

class _News_Display_with_deleteState extends State<News_Display_with_delete> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse( "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/news_Display.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade800,
        title: Text(
          "Read News",
          style: GoogleFonts.prompt(fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
            // list: snapshot.data,
            list: snapshot.data??[],
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context)=> new News_Detail(list:list , index: i,)
                )
            ),
            child: new  Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                minLeadingWidth: 5,
                // contentPadding: EdgeInsets.all(5.0),
                leading:Icon(Icons.circle,size: 10,color: Colors.red.shade900,),


                title: Text(
                  (list[i]['name']),
                  style: GoogleFonts.lora(
                      fontSize: 13, color: Colors.pink.shade700),
                ),

              ),
            ),
          ),

        );
      },
    );
  }
}



















// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
//
// import '../Admin_Display Catagory/News_Details.dart';
//
//
// //Creating a class user to store the data;
// class User {
//   // final String id;
//   final String name;
//   final String address;
//
//   User({
//     // required this.id,
//     required this.name,
//     required this.address,
//   });
// }
//
// class New_News_Display extends StatefulWidget {
//   @override
//   _New_News_DisplayState createState() => _New_News_DisplayState();
// }
//
// class _New_News_DisplayState extends State<New_News_Display> {
// //Applying get request.
//
//   Future<List<User>> getRequest() async {
//     //replace your restFull API here.
//     String url =
//         "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/news_Display.php";
//
//     final response = await http.get(Uri.parse(url));
//
//     var responseData = json.decode(response.body);
//
//     //Creating a list to store input data;
//     List<User> users = [];
//     for (var singleUser in responseData) {
//       User user = User(
//         //id:  singleUser["id"].toString(),
//         name: singleUser["name"].toString(),
//         address: singleUser["address"].toString(),
//       );
//
//       //Adding user to the list.
//       users.add(user);
//     }
//     return users;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.pink.shade800,
//           title: Text(
//             "Read News",
//             style: GoogleFonts.prompt(fontSize: 22),
//           ),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back_rounded),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(16.0),
//           child: FutureBuilder(
//             future: getRequest(),
//             builder: (BuildContext ctx, AsyncSnapshot snapshot) {
//               if (snapshot.data == null) {
//                 return Container(
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CircularProgressIndicator(
//                           color: Colors.red.shade900,
//                           strokeWidth: 5,
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Text(
//                           "Data Loading Please Wait!",
//                           style: TextStyle(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               } else {
//                 return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (ctx, index) => Card(
//                     margin: EdgeInsets.all(10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     child: ListTile(
//                         minLeadingWidth: 5,
//                        // contentPadding: EdgeInsets.all(5.0),
//                         leading:Icon(Icons.circle,size: 10,color: Colors.red.shade900,),
//
//
//                        title: Text(
//                           snapshot.data[index].name,
//                           style: GoogleFonts.lora(
//                               fontSize: 13, color: Colors.pink.shade700),
//                         ),
//                         onTap: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             return Detail_Screen_News(snapshot.data[index]);
//                           }));
//                         }),
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
// //

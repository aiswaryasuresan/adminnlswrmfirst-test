import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;




class View_more_display_with_delete extends StatefulWidget {
  @override
  _View_more_display_with_deleteState createState() => new _View_more_display_with_deleteState();
}

class _View_more_display_with_deleteState extends State<View_more_display_with_delete> {

  Future<List> getData() async {
    final response = await http.get(Uri.parse( "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/Main_Display_ASC_order.php"));
    return json.decode(response.body);
  }






  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade800,
        title: Text(
          "Delete Shop/Business",

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
            // onTap: ()=>Navigator.of(context).push(
            //     new MaterialPageRoute(
            //         builder: (BuildContext context)=> new Shop_business_Delete_Detail(list:list , index: i,)
            //     )
            // ),
            child: new Card(

              child: new ListTile(
                //title: new Text(list[i]['id']),
                title: Text(list[i]['name']),
                subtitle: Text(list[i]['catagory']),
              ),
            ),
          ),

        );
      },
    );
  }
}

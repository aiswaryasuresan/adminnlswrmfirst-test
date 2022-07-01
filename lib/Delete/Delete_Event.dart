import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'Delete_Event_Detail.dart';


class Delete_Event extends StatefulWidget {
  @override
  _Delete_EventState createState() => new _Delete_EventState();
}

class _Delete_EventState extends State<Delete_Event> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse( "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/eventdisplay.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade800,
        title: Text(
          "Events",

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
                    builder: (BuildContext context)=> new Event_Delete_Detail(list:list , index: i,)
                )
            ),
            child: new Card(

              child: new ListTile(
               // title: new Text(list[i]['id']),
                leading: new Text(list[i]['name']),
              ),
            ),
          ),

        );
      },
    );
  }
}

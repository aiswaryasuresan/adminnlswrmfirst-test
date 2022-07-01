import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../Main_Files/Admin_HomPage.dart';




class Service_Delete_Detail extends StatefulWidget {
  List list;
  int index;
  Service_Delete_Detail({required this.index,required this.list});
  @override
  _Service_Delete_DetailState createState() => new _Service_Delete_DetailState();
}

class _Service_Delete_DetailState extends State<Service_Delete_Detail> {

  void deleteData(){
    //var url="http://10.0.2.2/my_store/deleteData.php";
    var url= "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/Delete/Delete_Services.php";
    http.post(Uri.parse(url),
        body: {
          'id': widget.list[widget.index]['id']
        });
  }

  void confirm (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are You sure want to delete '${widget.list[widget.index]['name']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK DELETE!",style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context)=> Admin_HomePage (),
                )
            );
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL",style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: ()=> Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, builder: (BuildContext context) =>alertDialog,);

    // showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(title: new Text("${widget.list[widget.index]['name']}"),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade800,
        title:Text("${widget.list[widget.index]['name']}",
          style: GoogleFonts.prompt(fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: new Container(
        height:MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              SizedBox(height: 20,),
              new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width/3.5,
                    height: MediaQuery.of(context).size.height/15,
                    child: new RaisedButton(
                      child: new Text("DELETE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      color: Colors.red.shade900,
                      onPressed: ()=>confirm(),
                    ),
                  ),
                  // SizedBox(width: 10,),
                  // ButtonTheme(
                  //   minWidth: MediaQuery.of(context).size.width/3.5,
                  //   height: MediaQuery.of(context).size.height/15,
                  //   child: RaisedButton(
                  //     child: new Text("EDIT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  //     color: Colors.green,
                  //     onPressed: ()=>Navigator.of(context).push(
                  //         new MaterialPageRoute(
                  //           builder: (BuildContext context)=>new Shop_Business_Update(list: widget.list, index: widget.index,),
                  //         )
                  //     ),
                  //   ),
                  // ),
                ],
              ),


              new Padding(padding: const EdgeInsets.only(top: 30.0),),
              new Text(widget.list[widget.index]['address'], style: new TextStyle(fontSize: 15.0),  textAlign: TextAlign.justify,),






            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../Main_Files/Admin_HomPage.dart';


class News_Update extends StatefulWidget {
  final List list;
  final int index;

  News_Update({required this.list, required this.index});

  @override
  _News_UpdateState createState() => new _News_UpdateState();
}

class _News_UpdateState extends State<News_Update> {

  TextEditingController controllername = TextEditingController();
  TextEditingController controlleraddress = TextEditingController();


  void UpdateData() {
    var url ="https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/Update/News_Update.php";
    http.post(Uri.parse(url),
        body: {
          "id": widget.list[widget.index]['id'],
          "name": controllername.text,
          "address": controlleraddress.text,

        });
  }


  @override
  void initState() {
    controllername= new TextEditingController(text: widget.list[widget.index]['name'] );
    controlleraddress= new TextEditingController(text: widget.list[widget.index]['address'] );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "EDIT DATA",
          style: GoogleFonts.prompt(color: Colors.red.shade900),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.red.shade900,
            size: 35,// add custom icons also
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllername,
                  decoration: new InputDecoration(
                      hintText: "News Title", labelText: "News Title"),
                ),
                new TextField(
                  maxLines: 10,
                  controller: controlleraddress,
                  decoration: new InputDecoration(
                      hintText: "Description", labelText: "Description"),
                ),

                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Submit",style: TextStyle(color: Colors.white),),
                  color: Colors.red.shade900,
                  onPressed: () {
                    UpdateData();
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context)=>Admin_HomePage()
                        )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

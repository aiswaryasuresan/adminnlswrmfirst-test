import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../Main_Files/Admin_HomPage.dart';
import '../Update/Update_News.dart';




class News_Detail extends StatefulWidget {
  List list;
  int index;
  News_Detail({required this.index,required this.list});
  @override
  _News_DetailState createState() => new _News_DetailState();
}

class _News_DetailState extends State<News_Detail> {

  void deleteData(){
    //var url="http://10.0.2.2/my_store/deleteData.php";
    var url= "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/Delete/News_Delete.php";
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
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              confirm();
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context)=>new News_Update(list: widget.list, index: widget.index,),
                ), );
            },
          ),
        ],
      ),

      body: new Container(
        height:MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              //new Padding(padding: const EdgeInsets.only(top: 30.0),),
              new Text(widget.list[widget.index]['address'],
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 20.0, color: Colors.black,),
                overflow: TextOverflow.visible,),






            ],
          ),
        ),
      ),
    );
  }
}





// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class Detail_Screen_News extends StatelessWidget {
//   final  pquestion;
//   const Detail_Screen_News(this.pquestion, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.pink.shade800,
//         title: Text(pquestion.name),
//       ),
//       body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
//           child: Text(
//             pquestion.address,
//             textAlign: TextAlign.justify,
//             style: const TextStyle(fontSize: 20.0, color: Colors.black,),
//             overflow: TextOverflow.visible,
//           )),
//     );
//   }
// }
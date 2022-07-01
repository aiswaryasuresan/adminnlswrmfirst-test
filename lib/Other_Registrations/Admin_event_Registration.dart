import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../Main_Files/Admin_HomPage.dart';

class Admin_Event_Regt extends StatefulWidget {

  @override
  _Admin_Event_RegtState createState() =>
      _Admin_Event_RegtState();
}

class _Admin_Event_RegtState extends State<Admin_Event_Regt> {
    TextEditingController namecontroller = TextEditingController();
   // TextEditingController descriptioncontroller = TextEditingController();

  @override
  void initState() {
      namecontroller = TextEditingController();
     // descriptioncontroller = TextEditingController();
    super.initState();
  }

  var _imageFile;
  final String uploadUrl =
      'https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/event_Reg.php';


  final ImagePicker _picker = ImagePicker();

  Future<String?> uploadImage(filepath, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', filepath));
     request.fields['name'] = namecontroller.text;
    // request.fields['description'] = descriptioncontroller.text;
    var res = await request.send();
    return res.reasonPhrase;
  }

  Future<void> retriveLostData() async {
    final LostData response = await _picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file!;
      });
    } else {

      //  print('Retrieve error ' + response.exception.code);
    }
  }

  Widget _previewImage() {
    if (_imageFile != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 6.5,
                width: MediaQuery.of(context).size.width/1.8,
                child: Image.file(File(_imageFile.path,)
                ),
            ),
            SizedBox(height:40,),

            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.red.shade900,
              onPressed: () async {
                 var res = await uploadImage(_imageFile.path, uploadUrl);
                 namecontroller.clear();
                  print(res);
                final snackBar = await SnackBar(
                  content: const Text('Image Uploaded Successfully!'),
                  action: SnackBarAction(
                    label: 'Ok',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_HomePage()));
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);




              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Upload & Submit', style: GoogleFonts.prompt(fontSize: 20,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: const Text(
          'Pick an Image of Event',
          //textAlign: TextAlign.center,
        ),
      );
    }
  }

  void _pickImage() async {
    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile!;
      });
    } catch (e) {
      // print("Image picker error " + e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Event Registration",
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
// add custom icons also
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: namecontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: '*Event Name',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            // SizedBox(height: 20,),
            //
            //
            // Container(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            //     child: TextField(
            //       controller: descriptioncontroller,
            //       decoration: new InputDecoration(
            //         border: new OutlineInputBorder(
            //             borderSide: new BorderSide(color: Colors.teal)),
            //         labelText: 'Event Description',
            //       ),
            //       keyboardType: TextInputType.multiline,
            //       maxLines: 10,
            //     ),
            //   ),
            // ),

            FutureBuilder<void>(
              future: retriveLostData(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Text('Picked an image');
                  case ConnectionState.done:
                    return _previewImage();
                  default:
                    return const Text('Picked an image');
                }
              },
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade900,
        onPressed: _pickImage,
        tooltip: 'Pick Image from gallery',
        child: Icon(
          Icons.photo_library,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

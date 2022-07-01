import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class Main_Registration_Page extends StatefulWidget {

  @override
  _Main_Registration_PageState createState() =>
      _Main_Registration_PageState();
}

class _Main_Registration_PageState extends State<Main_Registration_Page> {
  TextEditingController catagorycontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController watsapcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController websitecontroller = TextEditingController();
  TextEditingController facebookcontroller = TextEditingController();
  TextEditingController instalcontroller = TextEditingController();
  TextEditingController bloodcontroller = TextEditingController();
  TextEditingController other_procontroller = TextEditingController();

  @override
  void initState() {
    catagorycontroller=TextEditingController();
    namecontroller = TextEditingController();
    addresscontroller = TextEditingController();
    phonecontroller = TextEditingController();
    mobilecontroller = TextEditingController();
    watsapcontroller = TextEditingController();
    emailcontroller== TextEditingController();
    websitecontroller= TextEditingController();
    facebookcontroller= TextEditingController();
    instalcontroller= TextEditingController();
    bloodcontroller= TextEditingController();
    other_procontroller= TextEditingController();
    super.initState();
  }

  var _imageFile;
  final String uploadUrl =
      'https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/A_Regi_Test.php';


  final ImagePicker _picker = ImagePicker();

  Future<String?> uploadImage(filepath, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', filepath));
    request.fields['catagory'] = catagorycontroller.text;
    request.fields['name'] = namecontroller.text;
    request.fields['address'] = addresscontroller.text;
    request.fields['phone'] = phonecontroller.text;
    request.fields['mobile'] = mobilecontroller.text;
    request.fields['watsap'] = watsapcontroller.text;
    request.fields['email'] = emailcontroller.text;
    request.fields['website'] = websitecontroller.text;
    request.fields['facebook'] = facebookcontroller.text;
    request.fields['insta'] = instalcontroller.text;
    request.fields['blood'] =bloodcontroller.text;
    request.fields['other_pro'] = other_procontroller.text;





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
               // Text("please wait");

              //  print(res);
                catagorycontroller.clear();
                namecontroller.clear();
                addresscontroller.clear();
                phonecontroller.clear();
                mobilecontroller.clear();
                watsapcontroller.clear();
                emailcontroller.clear();
                websitecontroller.clear();
                facebookcontroller.clear();
                instalcontroller.clear();
                bloodcontroller.clear();
                other_procontroller.clear();




                final snackBar = await SnackBar(
                  content: const Text('Image Uploaded Successfully!'),
                  action: SnackBarAction(
                    label: 'Ok',
                    onPressed: () {
                      Navigator.pop(context);
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
             Text(
            'Pick an Image ',  style: GoogleFonts.prompt(color: Colors.red.shade900,fontSize: 20),
          ),
          IconButton(onPressed: (){
            _pickImage();
          }, icon: Icon(Icons.photo_library,color: Colors.red.shade900,size: 35,)),


        ],
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
          "Registration",
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
                  controller: catagorycontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Enter Category',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),

            SizedBox(height: 20,),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: namecontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Enter Name',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            SizedBox(height: 20,),


            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: addresscontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Enter Address',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: phonecontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: '*Enter Phone No',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: mobilecontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Enter Mobile no',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: watsapcontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Enter Watsap no',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: emailcontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Enter email_id',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: websitecontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Enter Website address',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: facebookcontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Enter facebook Link',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            SizedBox(height: 20,),


            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: instalcontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Enter Instagram link',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: bloodcontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: '*Enter blood group',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  controller: other_procontroller,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: 'Enter other products',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                ),
              ),
            ),
            SizedBox(height: 20,),




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
            // IconButton(onPressed: (){
            //   _pickImage();
            // }, icon: Icon(Icons.photo_library)),

          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.red.shade900,
      //   onPressed: _pickImage,
      //   tooltip: 'Pick Image from gallery',
      //   child: Icon(
      //     Icons.photo_library,
      //     color: Colors.white,
      //   ),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

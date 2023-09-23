import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;

class UpImg extends StatefulWidget {
  const UpImg({super.key});

  @override
  State<UpImg> createState() => _UpImgState();
}

class _UpImgState extends State<UpImg> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future<void> getImage()async{
    var pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if(pickedFile != null){
      image = File(pickedFile.path);
      setState(() {

      });
    }
  }

  Future<void> uploadImage()async{
    setState(() {
      showSpinner = true;
    });
    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();

    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = http.MultipartRequest('POST',uri);
    request.fields['title']='Static Title';

    var multipart = await http.MultipartFile('image',stream, length);
    request.files.add(multipart);

    var response = await request.send();
    if(response.statusCode == 200){
      setState(() {
        showSpinner=false;
      });}

      else{
        setState(() {
          showSpinner = false;
        });
    }
    }




  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Upload Image'),
          centerTitle: true,
          elevation: 10,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: (){

                    getImage();

                },
                child: Container(
                  width: 100,
                  height: 100,
                  child:image==null?Center(child: Text("Pick Image")):
                  Container(
                    child: Center(
                      child: Image.file(File(image!.path).absolute,
                        height: 100,

                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: InkWell(
                onTap: (){
                  if(image?.path.toString() == null){}
                  else {
                    uploadImage();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 50,
                  width:double.infinity,
                  child: Center(child: Text('Upload',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
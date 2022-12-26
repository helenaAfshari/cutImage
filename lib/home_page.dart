




import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imagePath = "";
  
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
       body: Container(
         child: Column(
           children: [
             Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: () async {
          final pikedFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
                    
                    if(pikedFile != null){
       CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pikedFile.path,
         aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper hhh',
            toolbarColor: Color.fromARGB(255, 76, 20, 3),
            toolbarWidgetColor: Color.fromARGB(255, 244, 104, 104),
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
         IOSUiSettings(
          title: 'title',
         ),
         WebUiSettings(context: context),
      ],
    
    );                    
    setState(() {
      if(croppedFile != null){
        imagePath  = croppedFile.path;
      }
     
    });
                     
                      
                    }
                  }, child: Text("select Image"),),
                ),
                   
              ),
               
             ),
             imagePath != ""?Container(
              padding: EdgeInsets.symmetric(horizontal: 14,vertical: 60),
              child: Image.file(File(imagePath)),
             ) :  Container()
           ],
         ),
       ),
      
    );
  }
}
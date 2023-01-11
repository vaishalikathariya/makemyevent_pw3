import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makemyevent/components/my_button.dart';
import 'package:makemyevent/components/my_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:makemyevent/components/square_tile.dart';
import 'package:makemyevent/services/auth_service.dart';
import 'package:makemyevent/pages/login_page.dart';
import 'package:makemyevent/pages/user_image.dart';

class EventRegisterPage extends StatefulWidget {
  const EventRegisterPage({super.key});


  @override
  State<EventRegisterPage> createState() => _EventRegisterPageState();
}

class _EventRegisterPageState extends State<EventRegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final linkController = TextEditingController();
  final _fullnameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String imageURL ='';
  final  event_descriptionController = TextEditingController();

  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    linkController.dispose();
    _fullnameController.dispose();
    confirmPasswordController.dispose();

    event_descriptionController.dispose();



    super.dispose();
  }



  // sign user up method

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,

      );
      addUserDetails(
          _fullnameController.text.trim(),
          emailController.text.trim(),
          event_descriptionController.text.trim(),
          linkController.text.trim());
      Navigator.pop(context);
      showConfirmMessage();

      // pop the loading circle

    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }
  Future addUserDetails(String fullName,String email,String desc,String link) async {
    await FirebaseFirestore.instance.collection('users').add({
      'full_name': fullName,
       'email': email,
      'Description': desc,
      'Registration Link': link,
    });
  }
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
  void showConfirmMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
               'Details uploaded',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
  Future _selectPhoto() async {
    await showModalBottomSheet(context: context, builder: (context) => BottomSheet(
      onClosing: () {},
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(leading: Icon(Icons.camera),title: Text('Camera'),onTap: () {
              Navigator.of(context).pop();
              _pickImage(ImageSource.camera);
            }),
            ListTile(leading: Icon(Icons.camera),title: Text('Pick a file'),onTap: () {
              Navigator.of(context).pop();
              _pickImage(ImageSource.gallery);
            }),
          ],
        )
    ));

  }
  Future _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source,imageQuality: 50);
    if(pickedFile == null){
      return;
    }
    ImageCropper img = ImageCropper();
    var file = await img.cropImage(sourcePath: pickedFile.path,aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    if(file==null){
      return;
    }
    await _uploadFile(file.path);
  }
  Future _uploadFile(String path) async {
    final ref = storage.FirebaseStorage.instance.ref()
        .child('images')
        .child(DateTime.now().toIso8601String() + p.basename(path));
    final result = await ref.putFile(File(path));
    final fileUrl = await result.ref.getDownloadURL();
    setState(() {
      imageURL = fileUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // logo
                Text(
                  'Upload event details',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),



                const SizedBox(height: 25),

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),


                const SizedBox(height: 10),

                // confirm password textfield
                MyTextField(
                  controller: _fullnameController,
                  hintText: 'Full Name',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // confirm password textfield
                MyTextField(
                  controller: event_descriptionController,
                  hintText: 'Event Description',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                // confirm password textfield
                MyTextField(
                  controller: linkController,
                  hintText: 'Registration Link',
                  obscureText: false,
                ),
                const SizedBox(height: 15,width:10),

              MyButton(
                text: "Select Image",
                onTap: () => _selectPhoto(),
              ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text: "Upload",
                  onTap: signUserIn,
                ),







              ],
            ),
          ),
        ),

    );
  }
}

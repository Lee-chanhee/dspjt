import 'dart:io';
import 'package:dsproject1/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:provider/src/provider.dart';
// import 'package:test/classservice.dart';
// import 'package:test/mainpage.dart';

import 'dataservice.dart';

class RequestForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Request_Form();
  }
}

class Request_Form extends State<RequestForm> {
  final _formKey = GlobalKey<FormState>();

  String type = '';
  String name = '';
  String reward = '';
  String left = '';
  String number = '';

  PickedFile? imageFile = null;
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Choose option",
            style: TextStyle(color: Colors.blue),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Divider(
                  height: 1,
                  color: Colors.blue,
                ),
                ListTile(
                  onTap: () {
                    _openGallery(context);
                  },
                  title: Text("Gallery"),
                  leading: Icon(
                    Icons.account_box,
                    color: Colors.blue,
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.blue,
                ),
                ListTile(
                  onTap: () {
                    _openCamera(context);
                  },
                  title: Text("Camera"),
                  leading: Icon(
                    Icons.camera,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Text(
            "상세 설명",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    _showChoiceDialog(context);
                  },
                  child: Container(
                    width: 40,
                    height: 55,
                    child: Icon(Icons.camera_roll, size: 30),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                  ),
                ),
              ),
              Expanded(flex: 5, child: Container())
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   alignment: Alignment.center,
          //   height: 200,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(10)),
          //       color: Colors.grey.withOpacity(0.15)),
          //   child: (imageFile == null)
          //       ? Text("Choose Image")
          //       : Image.file(File(imageFile!.path), fit: BoxFit.contain),
          // ),

          Container(
            alignment: Alignment.center,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey.withOpacity(0.15)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      labelStyle: TextStyle(color: Colors.redAccent),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.redAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.redAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  renderValues() {
    return Column(
      children: [
        // Text('name: $name'),
        // Text('career: $career'),
        // Text(
        //   'intro: $intro',
        // ),
        // Text(
        //   'address: $class_tar',
        // ),
        // Text(
        //   'nickname: $class_int',
        // ),
      ],
    );
  }

  // renderTextFormField(
  //     {required String hintmessage,
  //     required FormFieldSetter onSaved,
  //     required FormFieldValidator validator,
  //     required int maxline}) {
  //   assert(hintmessage != null);
  //   assert(onSaved != null);
  //   assert(validator != null);

  //   return Column(
  //     children: [
  //       TextFormField(
  //         maxLines: maxline,
  //         onSaved: onSaved,
  //         validator: validator,

  //         decoration: const InputDecoration(
  //           hintText:
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(6)),
  //               borderSide: BorderSide(color: Colors.amber)),
  //         ),
  //       ),
  //       Container(height: 16.0),
  //     ],
  //   );
  // }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }
}

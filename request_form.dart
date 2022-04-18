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
  final formKey = GlobalKey<FormState>();

  List<String> filetype = [
    'JPEG',
    'JPG',
    'txt',
    'csv',
  ];
  String _selectedtype = 'JPEG';

  String category = '';
  String title = '';
  String start_date = '';
  String due_date = '';
  String photo = '';
  String request_info = '';
  String condition_title = '';
  String condition_info = '';
  String file_type = '';
  String file_info = '';
  String reward = '';

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
    renderValues() {
      return Container(
        height: 200,
        child: Column(
          children: [
            Text('카테고리 : $category '),
            Text('타이틀 : $title '),
            Text('시작일 : $start_date'),
            Text('납기일 : $due_date'),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              height: 200,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: (imageFile == null)
                  ? Text("Choose Image")
                  : Image.file(File(imageFile!.path), fit: BoxFit.contain),
            ),
            Text('상세설명: $request_info'),
            Text('조건명: $condition_title'),
            Text('조건설명: $condition_info'),
            Text('파일형식: $file_type'),
            Text('파일정보: $file_info'),
          ],
        ),
      );
    }

    // TODO: implement build
    return Scaffold(
      body: Form(
        key: this.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            RequestForm_title(title_text: "데이터 모집 형식"),
            SizedBox(height: 20),
            TextForm_Field(
              form_maxline: 1,
              form_height: 70,
              form_hint: "제목",
              onSaved: (val) {
                setState(() {
                  this.title = val;
                });
              },
              validator: (val) {
                return null;
              },
            ),
            TextForm_Field(
              form_maxline: 1,
              form_height: 70,
              form_hint: "제목",
              onSaved: (val) {
                setState(() {
                  this.title = val;
                });
              },
              validator: (val) {
                return null;
              },
            ),
            SizedBox(height: 40),
            RequestForm_title(title_text: "데이터 모집기간"),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: TextForm_Field(
                      form_maxline: 1,
                      form_height: 70,
                      form_hint: "YYYY",
                      onSaved: (val) {},
                      validator: (val) {
                        return null;
                      },
                    )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: TextForm_Field(
                      form_maxline: 1,
                      form_height: 70,
                      form_hint: "YYYY",
                      onSaved: (val) {},
                      validator: (val) {
                        return null;
                      },
                    )),
              ],
            ),
            SizedBox(height: 40),
            RequestForm_title(title_text: "상세 설명"),
            SizedBox(height: 10),
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
            TextForm_Field(
              form_maxline: 10,
              form_height: 240,
              form_hint: "수집을 원하시는 데이터에 대한 상세 설명을 기입해주세요",
              onSaved: (val) {
                setState(() {
                  this.request_info = val;
                });
              },
              validator: (val) {
                return null;
              },
            ),
            SizedBox(height: 40),
            RequestForm_title(title_text: "조건"),
            SizedBox(height: 20),
            TextForm_Field(
              form_maxline: 1,
              form_height: 70,
              form_hint: "조건명",
              onSaved: (val) {
                setState(() {
                  this.condition_title = val;
                });
              },
              validator: (val) {
                return null;
              },
            ),
            SizedBox(height: 20),
            TextForm_Field(
              form_maxline: 3,
              form_height: 100,
              form_hint: "데이터 모집 조건에 대한 상세 설명을 입력해주세요",
              onSaved: (val) {
                setState(() {
                  this.condition_info = val;
                });
              },
              validator: (val) {
                return null;
              },
            ),
            SizedBox(height: 40),
            RequestForm_title(title_text: "파일형식"),
            SizedBox(height: 10),
            Container(
              height: 100,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        // decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: DropdownButton(
                          value: _selectedtype,
                          items: filetype.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedtype = value as String;
                              this.file_type = value as String;
                            });
                          },
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 290,
                        height: 50,
                        child: TextForm_Field(
                          form_maxline: 1,
                          form_height: 100,
                          form_hint: "조건을 입력하세요",
                          onSaved: (val) {
                            setState(() {
                              this.file_info = val;
                            });
                          },
                          validator: (val) {
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                this.formKey.currentState!.save();
              },
              child: Container(
                height: 50,
                color: Colors.amber,
                child: Center(child: Text("제출")),
              ),
            ),
            renderValues(),
          ]),
        ),
      ),
    );
  }

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

TextForm_Field(
    {required int form_maxline,
    required double form_height,
    required String form_hint,
    required FormFieldSetter onSaved,
    required FormFieldValidator validator}) {
  // assert(label != null);
  assert(onSaved != null);
  assert(validator != null);

  return Container(
    alignment: Alignment.center,
    height: form_height,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.grey.withOpacity(0.15)),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
            child: TextFormField(
              onSaved: onSaved,
              maxLines: form_maxline,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: form_hint,
                labelStyle: TextStyle(color: Colors.redAccent),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ],
      ),
    ),
  );
}

RequestForm_title({required String title_text}) {
  return Text(
    title_text,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  );
}

// RequestForm_filetype() {String? selectedValue;
// List<String> items = [
//     'Item1',
//     'Item2',
//     'Item3',
//     'Item4',
//     'Item5',
//     'Item6',
//     'Item7',
//     'Item8',
//   ];

//   return Container(
//     child: Row(
//       children: [
//        DropdownButtonHideUnderline(
//           child: DropdownButton2(
//             isExpanded: true,
//             hint: Row(
//               children: const [
//                 Icon(
//                   Icons.list,
//                   size: 16,
//                   color: Colors.yellow,
//                 ),
//                 SizedBox(
//                   width: 4,
//                 ),
//                 Expanded(
//                   child: Text(
//                     'Select Item',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.yellow,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//             items: items
//                 .map((item) => DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(
//                         item,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ))
//                 .toList(),
//             value: selectedValue,
//             onChanged: (value) {
//               setState(() {
//                 selectedValue = value as String;
//               });
//             },
//             icon: const Icon(
//               Icons.arrow_forward_ios_outlined,
//             ),
//             iconSize: 14,
//             iconEnabledColor: Colors.yellow,
//             iconDisabledColor: Colors.grey,
//             buttonHeight: 50,
//             buttonWidth: 160,
//             buttonPadding: const EdgeInsets.only(left: 14, right: 14),
//             buttonDecoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(14),
//               border: Border.all(
//                 color: Colors.black26,
//               ),
//               color: Colors.redAccent,
//             ),
//             buttonElevation: 2,
//             itemHeight: 40,
//             itemPadding: const EdgeInsets.only(left: 14, right: 14),
//             dropdownMaxHeight: 200,
//             dropdownWidth: 200,
//             dropdownPadding: null,
//             dropdownDecoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(14),
//               color: Colors.redAccent,
//             ),
//             dropdownElevation: 8,
//             scrollbarRadius: const Radius.circular(40),
//             scrollbarThickness: 6,
//             scrollbarAlwaysShow: true,
//             offset: const Offset(-20, 0),
//           ),
//         ),
//         ],
//     ),
//   )
//   );
// }

// renderValues() {
//   return Column(
//     children: [
//       Text('name: $name'),
//       Text('career: $career'),
//       ),
//     ],
//   );
// }

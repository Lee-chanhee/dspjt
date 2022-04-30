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
  TextEditingController controller_title = TextEditingController();
  TextEditingController controller_startdate = TextEditingController();
  TextEditingController controller_duedate = TextEditingController();
  TextEditingController controller_info = TextEditingController();
  TextEditingController controller_condition_title = TextEditingController();
  TextEditingController controller_condition_info = TextEditingController();
  TextEditingController controller_file_condition = TextEditingController();
  TextEditingController controller_file_quantity = TextEditingController();
  TextEditingController controller_reward = TextEditingController();
  bool autovalidate = false;

  List<String> filetype = [
    'JPEG',
    'JPG',
    'txt',
    'csv',
  ];
  String _selectedtype = 'JPEG';
  Map<String, dynamic> data_request = {
    'title': Null,
    'category': Null,
    'start_date': Null,
    'due_date': Null,
    'photo': Null,
    'request_info': Null,
    'conditions': Null,
    'file_types': Null,
    'reward': Null,
  };

  bool cate1 = true;
  bool cate2 = false;
  bool cate3 = false;
  late List<bool> category_list = [cate1, cate2, cate3];
  List<String> category_name = ['cate1', 'cate2', 'cate3'];
  String category = '';
  String title = '';
  String start_date = '';
  String due_date = '';
  String photo = '';
  String request_info = '';
  List conditions = [];
  String condition_title = '';
  String condition_info = '';
  List file_types = [];
  String file_type = '';
  String file_info = '';
  String file_quantity = '';
  String reward = '';
  int condition_number = 1;

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

////////// 데이터 모집 시작시기 입력 //////////

  yearMonthDayTimePicker1() async {
    final year = DateTime.now().year;
    String hour, min;
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(year),
      lastDate: DateTime(year + 10),
    );

    if (dateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 0, minute: 0),
      );

      if (pickedTime != null) {
        if (pickedTime.hour < 10) {
          hour = '0' + pickedTime.hour.toString();
        } else {
          hour = pickedTime.hour.toString();
        }

        if (pickedTime.minute < 10) {
          min = '0' + pickedTime.minute.toString();
        } else {
          min = pickedTime.minute.toString();
        }

        controller_startdate.text =
            '${dateTime.toString().split(' ')[0]}, $hour:$min';
      }
    }
  }

////////// 데이터 모집 종료시기 입력 //////////
  ///
  yearMonthDayTimePicker2() async {
    final year = DateTime.now().year;
    String hour, min;
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(year),
      lastDate: DateTime(year + 10),
    );

    if (dateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 0, minute: 0),
      );

      if (pickedTime != null) {
        if (pickedTime.hour < 10) {
          hour = '0' + pickedTime.hour.toString();
        } else {
          hour = pickedTime.hour.toString();
        }

        if (pickedTime.minute < 10) {
          min = '0' + pickedTime.minute.toString();
        } else {
          min = pickedTime.minute.toString();
        }

        controller_duedate.text =
            '${dateTime.toString().split(' ')[0]}, $hour:$min';
      }
    }
  }

  ////////// 저장값 출력 //////////

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

////////// 데이터 모집 종료시기 입력 //////////

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "DATA STORE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              data_request = {
                'title': controller_title.text,
                'category': category,
                'start_date': controller_startdate.text,
                'due_date': controller_duedate.text,
                'photo': photo,
                'request_info': controller_info.text,
                'conditions': conditions,
                'file_types': file_types,
                'reward': controller_reward.text,
              };
              print(data_request);
            },
            child: Center(
              child: Text(
                "제출",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
          child: ListView(children: [
            RequestForm_title(title_text: "데이터 수집 이름"),
            SizedBox(height: 20),
            request_TextField(
              controller: controller_title,
              form_maxline: 1,
              form_height: 70,
              form_hint: "데이터 수집 이름",
              // validator: (val) {
              //   return null;
              // },
            ),
            SizedBox(height: 20),
            RequestForm_title(title_text: "데이터 모집 형식"),
            SizedBox(height: 20),
            ToggleButtons(
              children: [
                Container(
                    height: 40,
                    width: 120,
                    child: Center(
                      child: Text(
                        "Cate1",
                        style: TextStyle(fontSize: 15),
                      ),
                    )),
                Container(
                    height: 40,
                    width: 120,
                    child: Center(
                      child: Text(
                        "Cate2",
                        style: TextStyle(fontSize: 15),
                      ),
                    )),
                Container(
                    height: 40,
                    width: 120,
                    child: Center(
                      child: Text(
                        "Cate3",
                        style: TextStyle(fontSize: 15),
                      ),
                    )),
              ],
              isSelected: category_list,
              onPressed: (value) {
                if (value == 0) {
                  cate1 = true;
                  cate2 = false;
                  cate3 = false;
                }
                if (value == 1) {
                  cate1 = false;
                  cate2 = true;
                  cate3 = false;
                }
                if (value == 2) {
                  cate1 = false;
                  cate2 = false;
                  cate3 = true;
                }
                setState(() {
                  category_list = [cate1, cate2, cate3];
                  if (cate1 == true) {
                    category = category_name[0];
                  }
                  if (cate2 == true) {
                    category = category_name[1];
                  }
                  if (cate3 == true) {
                    category = category_name[2];
                  }
                  print(category);
                });
              },
            ),
            SizedBox(height: 40),
            RequestForm_title(title_text: "데이터 모집기간"),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "시작일 :",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Container(
                  width: 300,
                  child: GestureDetector(
                    onTap: yearMonthDayTimePicker1,
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: controller_startdate,
                        decoration: InputDecoration(
                          // labelText: "Pick year, month, date, time",
                          border: OutlineInputBorder(),
                          filled: true,
                        ),
                        onSaved: (val) {
                          setState(() {
                            this.start_date = controller_startdate.text;
                          });
                        },
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'value is empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "종료일 :",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Container(
                  width: 300,
                  child: GestureDetector(
                    onTap: yearMonthDayTimePicker2,
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: controller_duedate,
                        decoration: InputDecoration(
                          // labelText: "Pick year, month, date, time",
                          border: OutlineInputBorder(),
                          filled: true,
                        ),
                        onSaved: (val) {
                          setState(() {
                            this.due_date = controller_duedate.text;
                          });
                        },
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'value is empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
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
            request_TextField(
              controller: controller_info,
              form_maxline: 10,
              form_height: 240,
              form_hint: "수집을 원하시는 데이터에 대한 상세 설명을 기입해주세요",
              // validator: (val) {
              //   return null;
              // },
            ),
            SizedBox(height: 40),
            RequestForm_title(title_text: "조건"),
            SizedBox(height: 20),
            for (List condition in conditions)
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      // padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            child: Text(condition[0]),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            child: Text(condition[1]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          conditions.remove(condition);
                        });
                      },
                      child: Container(
                        height: 30,
                        color: Colors.blue,
                        width: 30,
                      ),
                    ),
                  )
                ],
              ),
            SizedBox(height: 20),
            request_TextField(
              controller: controller_condition_title,
              form_maxline: 1,
              form_height: 70,
              form_hint: "조건명",
              // validator: (val) {
              //   return null;
              // },
            ),
            SizedBox(height: 20),
            request_TextField(
              controller: controller_condition_info,
              form_maxline: 3,
              form_height: 100,
              form_hint: "데이터 모집 조건에 대한 상세 설명을 입력해주세요",
              // validator: (val) {
              //   return null;
              // },
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                setState(() {
                  conditions.add([
                    controller_condition_title.text,
                    controller_condition_info.text
                  ]);
                  controller_condition_title.clear();
                  controller_condition_info.clear();
                  print(conditions);
                });
              },
              child: Container(
                height: 50,
                color: Colors.amber,
                child: Center(child: Text("조건 추가")),
              ),
            ),
            SizedBox(height: 40),
            RequestForm_title(title_text: "파일형식"),
            SizedBox(height: 10),
            Container(
              height: 80,
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
                        width: 190,
                        height: 50,
                        child: request_TextField(
                          controller: controller_file_condition,
                          form_maxline: 1,
                          form_height: 100,
                          form_hint: "조건",
                          // validator: (val) {
                          //   return null;
                          // },
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 100,
                        height: 50,
                        child: request_TextField(
                          controller: controller_file_quantity,
                          form_maxline: 1,
                          form_height: 100,
                          form_hint: "수량",
                          // validator: (val) {
                          //   return null;
                          // },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            for (List file_type in file_types)
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: Text(file_type[0]),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: Text(file_type[1]),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      child: Text(file_type[1]),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          file_types.remove(file_type);
                        });
                      },
                      child: Container(
                        height: 30,
                        color: Colors.blue,
                        width: 30,
                      ),
                    ),
                  )
                ],
              ),
            SizedBox(height: 2),
            GestureDetector(
              onTap: () {
                setState(() {
                  file_types.add([
                    _selectedtype,
                    controller_file_condition.text,
                    controller_file_quantity.text,
                  ]);
                  _selectedtype = 'JPEG';
                  controller_file_condition.clear();
                  controller_file_quantity.clear();
                });
              },
              child: Container(
                height: 50,
                color: Colors.amber,
                child: Center(child: Text("파일형식 추가")),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RequestForm_title(title_text: "총 보상금액"),
            SizedBox(height: 20),
            request_TextField(
              controller: controller_reward,
              form_maxline: 1,
              form_height: 70,
              form_hint: "총 보상금액",
              // validator: (val) {
              //   return null;
              // },
            ),
            // renderValues(),
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

request_TextField({
  // required Function sendMsg,
  required TextEditingController controller,
  required int form_maxline,
  required double form_height,
  required String form_hint,
  // required FormFieldSetter onSaved,
  // required FormFieldValidator validator
}) {
  // assert(label != null);

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
            child: TextField(
              controller: controller,
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsproject1/mainpage.dart';
import 'package:flutter/material.dart';

class dataService extends ChangeNotifier {
  final requestCollection =
      FirebaseFirestore.instance.collection('request_collection');

  Future<QuerySnapshot> read(String uid) async {
// 내 datacollection 가져오기
    throw UnimplementedError(); // return 값 미구현 에러
  }

  /// data_requset 추가
  create(
      // String uid,
      String title,
      String category,
      String start_date,
      String due_date,
      String photo,
      String request_info,
      List conditions,
      List file_types,
      String reward) async {
    // data_request 만들기
    await requestCollection.add({
      // 'uid': uid,
      'title': title,
      'category': category,
      'start_date': start_date,
      'due_date': due_date,
      'photo': photo,
      'request_info': request_info,
      'conditions': conditions,
      'file_types': file_types,
      'reward': reward,
    });
  }

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
  void update(String docId, bool isDone) async {
    // bucket isDone 업데이트
  }
  void delete(String docId) async {
    // data_request 삭제
  }
}

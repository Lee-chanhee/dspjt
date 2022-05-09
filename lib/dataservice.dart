import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsproject1/mainpage.dart';
import 'package:flutter/material.dart';

class dataService_request extends ChangeNotifier {
  final requestCollection =
      FirebaseFirestore.instance.collection('request_collection');

  Future<QuerySnapshot> read() async {
// 내 datacollection 가져오기
    return requestCollection.get();
    // return requestCollection.where('uid', isEqualTo: uid).get();
    // throw UnimplementedError(); // return 값 미구현 에러
  }

  /// data_requset 추가
  create(
      String uid,
      String title,
      String category,
      String start_date,
      String due_date,
      String photo,
      String request_info,
      List condition_title,
      List condition_info,
      List file_type,
      List file_info,
      List file_quantity,
      String reward) async {
    // data_request 만들기
    await requestCollection.add(
      {
        'uid': uid,
        'title': title,
        'category': category,
        'start_date': start_date,
        'due_date': due_date,
        'photo': photo,
        'request_info': request_info,
        'condition_title': condition_title,
        'condition_info': condition_info,
        'file_type': file_type,
        'file_info': file_info,
        'file_quantity': file_quantity,
        'reward': reward,
      },
    );
  }

  void update(String docId, bool isDone) async {
// bucket isDone 업데이트
    await requestCollection.doc(docId).update({'isDone': isDone});
    notifyListeners(); // 화면 갱신
  }

  void delete(String docId) async {
// bucket 삭제
    await requestCollection.doc(docId).delete();
    notifyListeners(); // 화면 갱신
  }

  void stream_test() {
    var stream = Stream.periodic(Duration(seconds: 2), (x) => x).take(5);
    stream.listen((x) => print(x));
  }
}

class dataService_selling extends ChangeNotifier {
  final requestCollection =
      FirebaseFirestore.instance.collection('selling_collection');

  Future<QuerySnapshot> read() async {
// 내 datacollection 가져오기
    return requestCollection.get();
    // return requestCollection.where('uid', isEqualTo: uid).get();
    // throw UnimplementedError(); // return 값 미구현 에러
  }

  /// data_requset 추가
  create(
      String uid,
      String title,
      String category,
      String start_date,
      String due_date,
      String photo,
      String request_info,
      List condition_title,
      List condition_info,
      List file_type,
      List file_info,
      List file_quantity,
      String reward) async {
    // data_request 만들기
    await requestCollection.add(
      {
        'uid': uid,
        'title': title,
        'category': category,
        'start_date': start_date,
        'due_date': due_date,
        'photo': photo,
        'request_info': request_info,
        'condition_title': condition_title,
        'condition_info': condition_info,
        'file_type': file_type,
        'file_info': file_info,
        'file_quantity': file_quantity,
        'reward': reward,
      },
    );
  }

  void update(String docId, bool isDone) async {
// bucket isDone 업데이트
    await requestCollection.doc(docId).update({'isDone': isDone});
    notifyListeners(); // 화면 갱신
  }

  void delete(String docId) async {
// bucket 삭제
    await requestCollection.doc(docId).delete();
    notifyListeners(); // 화면 갱신
  }

  void stream_test() {
    var stream = Stream.periodic(Duration(seconds: 2), (x) => x).take(5);
    stream.listen((x) => print(x));
  }
}

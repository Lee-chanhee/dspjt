// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsproject1/mainpage.dart';
import 'package:flutter/material.dart';

// class classservice extends ChangeNotifier {
//   final classCollection = FirebaseFirestore.instance.collection('class');
//   List<data_request> class_list = [
//     data_request('RAW', '풍경사진 데이터 모집', '10,000,000', '23:00:00', '0000')// 더미(dummy) 데이터
//   ]; //ChangeNotifier : 변경된 데이터에 대해 알람을 보낸다


//   /// bucket 추가
//   void createRequest(String type, String name, String reward, String left,
//       String number) {
//     class_list.add(data_request(type, name, reward, left, number));
//     notifyListeners(); // 갱신 = Consumer<BucketService>의 builder 부분만 새로고침
//   }

//   String type = '';
//   String name = '';
//   String reward = '';
//   String left = '';
//   String no = '';


//   /// bucket 수정
//   // void updateRequest(daily_class class_, int index) {
//   //   class_list[index] = ;
//   //   notifyListeners();
//   // }

//   /// bucket 삭제
//   void deleteRequest(int index) {
//     class_list.removeAt(index);
//     notifyListeners();
//   }
// }

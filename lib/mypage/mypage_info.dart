import 'package:flutter/material.dart';

// 이거는 안 쓸 지도 모름
class mypage_info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        stat_count_info("50", "포인트"),
        stat_sep_line(),
        stat_count_info("100", "판매내역"),
        stat_sep_line(),
        stat_count_info("5", "구매내역"),
        stat_sep_line(),
        stat_count_info("1010", "내가쓴후기"),
      ],
    );
  }

  Widget stat_count_info(String count, String title) {
    return InkWell(
      onTap: () {
        print("${title} 클릭 됨");
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
        // decoration: BoxDecoration(
        //   color: Colors.blue,
        //   borderRadius: BorderRadius.circular(10),
        // ),
      ),
    );
    // return Column(
    //   children: [
    //     Text(
    //       title,
    //       style: TextStyle(fontSize: 15),
    //     ),
    //     SizedBox(
    //       height: 2,
    //     ),
    //     Text(
    //       count,
    //       style: TextStyle(fontSize: 15),
    //     ),
    //   ],
    // );
  }

  Widget stat_sep_line() {
    return Container(
      color: Colors.blue,
      width: 2,
      height: 40,
    );
  }
}

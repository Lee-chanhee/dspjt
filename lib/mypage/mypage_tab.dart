import 'package:flutter/material.dart';

class mypage_tab extends StatefulWidget {
  @override
  mypage_tab_state createState() => mypage_tab_state();
}

class mypage_tab_state extends State<mypage_tab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController; // _를 적어서 private으로 적용

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this); // tab 수 : 4
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tabBar(),
        Expanded(child: tabBarView()),
      ],
    );
  }

  Widget tabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.black,
      tabs: [
        // #1
        // Text(
        //   "포인트",
        //   style: TextStyle(fontSize: 15),
        // ),
        // Text(
        //   "판매내역",
        //   style: TextStyle(fontSize: 15),
        // ),
        // Text(
        //   "구매내역",
        //   style: TextStyle(fontSize: 15),
        // ),
        // Text(
        //   "내가쓴후기",
        //   style: TextStyle(fontSize: 15),
        // ),
        // #3
        Tab(
          child: Column(
            children: [
              Text("포인트"),
              Text("500"),
            ],
          ),
        ),
        Tab(
          child: Column(
            children: [
              Text("판매내역"),
              Text("500"),
            ],
          ),
        ),
        Tab(
          child: Column(
            children: [
              Text("구매내역"),
              Text("500"),
            ],
          ),
        ),
        Tab(
          child: Column(
            children: [
              Text("내가쓴후기"),
              Text("500"),
            ],
          ),
        ),
        // #2
        // Tab(icon: Icon(Icons.directions_car)),
        // Tab(icon: Icon(Icons.directions_transit)),
        // Tab(icon: Icon(Icons.directions_transit)),
        // Tab(icon: Icon(Icons.directions_transit)),
      ],
    );
  }

  Widget tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            // return Image.asset('assets/images/1.jpg');
            return Image.network(
              "https://picsum.photos/id/${index + 1}/200/200",
              scale: 0.3,
            );
          },
        ),
        GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            // return Image.asset('assets/images/1.jpg');
            return Image.network(
              "https://picsum.photos/id/${index + 1}/200/200",
              scale: 0.3,
            );
          },
        ),
        GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            // return Image.asset('assets/images/1.jpg');
            return Image.network(
              "https://picsum.photos/id/${index + 1}/200/200",
              scale: 0.3,
            );
          },
        ),
        GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            // return Image.asset('assets/images/1.jpg');
            return Image.network(
              "https://picsum.photos/id/${index + 1}/200/200",
              scale: 0.3,
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MultiImageSelect extends StatelessWidget {
  const MultiImageSelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size _size = MediaQuery.of(context).size;

        return SizedBox(
          height: _size.width / 3,
          width: _size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  color: Colors.amber,
                  width: _size.width / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.browse_gallery, color: Colors.grey),
                      Text(
                        '0/10',
                      )
                    ],
                  ),
                ),
              ),
              Container(width: 100, color: Colors.accents[1]),
              Container(width: 100, color: Colors.accents[2]),
              Container(width: 100, color: Colors.accents[3]),
              Container(width: 100, color: Colors.accents[4]),
              Container(width: 100, color: Colors.accents[5]),
              Container(width: 100, color: Colors.accents[6]),
              Container(width: 100, color: Colors.accents[7]),
            ],
          ),
        );
      },
    );
  }
}

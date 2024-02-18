import 'package:flutter/material.dart';

class BoxBasics extends StatelessWidget {
  const BoxBasics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
            ),
            SizedBox.shrink(), // 0
            SizedBox.square(
              dimension: 100,
            ),
            // Text('text after  sizedBox')
          ],
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
          color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          width: 300,
          height: 350,
        ),

        /// size
        // Container(
        //   width: 250,
        //   height: 150,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     shape: BoxShape.circle,
        //   ),
        // ),
      ],
    );
  }
}

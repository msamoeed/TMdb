import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, count) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 180.0,
            width: 300.0,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.0,
                  height: 16.0,
                  color: Colors.white,
                ),
                SizedBox(height: 8.0),
                Container(
                  width: 200.0,
                  height: 16.0,
                  color: Colors.white,
                ),
                SizedBox(height: 8.0),
                Container(
                  width: 150.0,
                  height: 16.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

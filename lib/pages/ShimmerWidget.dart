import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerWidget extends StatelessWidget {
  double height;
  double width;
  ShapeBorder shapeBorder;

  ShimmerWidget.rect({
      this.height,
      this.width = double.infinity,
      this.shapeBorder = const RoundedRectangleBorder()
  });


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(milliseconds: 500),
        baseColor: Colors.grey[500],
        highlightColor: Colors.grey[300],
        child: Container(
          height: height,
          width: width,
          decoration: ShapeDecoration(
            color: Colors.grey[500],
            shape: shapeBorder
          ),
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'ShimmerWidget.dart';

Widget loadingWidget(){
  return ListTile(
    title: ShimmerWidget.rect(height: 15),
    subtitle: ShimmerWidget.rect(height: 15,),
    leading: ShimmerWidget.rect(
      height: 80,
      width: 65,
      shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
  );
}
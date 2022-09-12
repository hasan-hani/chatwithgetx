import 'package:chatwhitgetx/core/constatnt/appImage.dart';
import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(AppImage.home));
  }
}

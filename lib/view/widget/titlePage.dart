import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
class TitlePage extends StatelessWidget {
  final String title ;
  const TitlePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        color: Colors.white,
        height: 40,
        child: Text(title,style:Theme.of(context).textTheme.headline1,),
      ),
    ) ;
  }
}

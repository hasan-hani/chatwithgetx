import 'package:chatwhitgetx/core/class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constatnt/appImage.dart';

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const MyLoading()
        : statusRequest == StatusRequest.failure
            ? const ServerFauiler()
            : statusRequest == StatusRequest.serverFailure
                ? const ServerFauiler()
                : widget;
  }
}

class MyLoading extends StatelessWidget {
  const MyLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(AppImage.lottieLoading));
  }
}

class ServerFauiler extends StatelessWidget {
  const ServerFauiler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppImage.lottieServerError),
    );
  }
}

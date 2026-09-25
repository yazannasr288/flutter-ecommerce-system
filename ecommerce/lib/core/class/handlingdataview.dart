import 'package:ecommerse/core/class/statusrequest.dart';
import 'package:ecommerse/core/constant/imageassete.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Handlingdataview extends StatelessWidget {
  final StatusRequest statusRequest;

  final Widget widget;

  const Handlingdataview({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAssets.loading))
        : statusRequest == StatusRequest.offlinefailuer
        ? Lottie.asset(AppImageAssets.offline)
        : statusRequest == StatusRequest.serverfailure
        ? Lottie.asset(AppImageAssets.server)
        : statusRequest == StatusRequest.failure
        ? Lottie.asset(AppImageAssets.nodata)
        : widget;
  }
}

class HandlingdataRequest extends StatelessWidget {
  final StatusRequest statusRequest;

  final Widget widget;

  const HandlingdataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAssets.loading))
        : statusRequest == StatusRequest.offlinefailuer
        ? Lottie.asset(AppImageAssets.offline)
        : statusRequest == StatusRequest.serverfailure
        ? Lottie.asset(AppImageAssets.server)
        :widget;
  }
}

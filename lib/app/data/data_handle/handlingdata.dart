import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yugiapp/app/utils/constants.dart';


class HandlingDataView extends StatelessWidget {
  final LoadDataState loadDataState;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.loadDataState, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loadDataState == LoadDataState.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.lottieLoading, width: 250, height: 250))
        : loadDataState == LoadDataState.offline
            ? Center(
                child: Lottie.asset(AppImageAsset.lottieoffline,
                    width: 250, height: 250))
            : loadDataState == LoadDataState.error
                ? Center(
                    child: Lottie.asset(AppImageAsset.lottieserver,
                        width: 250, height: 250))
                : loadDataState == LoadDataState.error
                    ? Center(
                        child: Lottie.asset(AppImageAsset.lottienodata,
                            width: 250, height: 250, repeat: true))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final LoadDataState statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == LoadDataState.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.lottieLoading, width: 250, height: 250))
        : statusRequest == LoadDataState.offline
            ? Center(
                child: Lottie.asset(AppImageAsset.lottieoffline,
                    width: 250, height: 250))
            : statusRequest == LoadDataState.error
                ? Center(
                    child: Lottie.asset(AppImageAsset.lottieserver,
                        width: 250, height: 250))
                : widget;
  }
}
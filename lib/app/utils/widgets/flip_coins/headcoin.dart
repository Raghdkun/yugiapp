import 'package:flutter/material.dart';
import 'package:yugiapp/app/utils/constants.dart';
import 'package:yugiapp/app/utils/widgets/flip_coins/layout.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildLayoutWidget(
      coinImg: AppImageAsset.headcoin,
      faceName: "Head",
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
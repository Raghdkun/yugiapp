import 'package:flutter/material.dart';

class BuildLayoutWidget extends StatelessWidget {
  final Widget child;
  final String faceName;
  final String coinImg;
  BuildLayoutWidget({
    Key? key,
    required this.child,
    required this.coinImg,
    required this.faceName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(coinImg),
            ),
            borderRadius: BorderRadius.circular(150 / 2),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          faceName.substring(0, 4),
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
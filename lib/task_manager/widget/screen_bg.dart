import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/asset_path.dart';

class ScreenBG extends StatelessWidget {
  final Widget child;
  const ScreenBG({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: SvgPicture.asset(
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.cover,
              AssetPath.backgroundSVG),
        ),
        child
      ],
    );
  }
}

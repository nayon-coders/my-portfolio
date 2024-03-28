import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../data/models/responsive_size.dart';

class IntroImage extends StatelessWidget {
  const IntroImage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(
      deviceWidth: context.width,
      mobileSize: context.width * .55,
      ipadSize: context.width * .36,
      smallScreenSize: context.width * .26,
    );

    return InkWell(
      onTap: (){
        html.window.open("https://www.youtube.com/watch?v=ZD9zhJAfCT4", '_blank');
      },
      child: Image.asset(
        AppAssets.devImg,
        width: responsiveSize.getSize(),
        height: responsiveSize.getSize(),
        fit: BoxFit.cover,
      ),
    );
  }
}

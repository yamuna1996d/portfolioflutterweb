import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/Image_asset_constants.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';

class Logo extends StatelessWidget {
  final double width;
  final ScrollController scrollController;
  const Logo({required this.width, required this.scrollController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child:  RichText(
          text:  TextSpan(
            text: 'Y',
              style: GoogleFonts.greatVibes(
                  color: Colors.white, fontSize: 35),
            children: [
              TextSpan(
                text: 'G',
                style: GoogleFonts.greatVibes(
                    color: CustomColors.brightBackground, fontSize: 35),
              ),
            ],
          ),
        ),
        // child: Image.asset(ImageAssetConstants.logo,
        //     width: width >= Breakpoints.xlg ? width * 0.14 : Breakpoints.xlg * 0.14,
        //     height: width >= Breakpoints.xlg ? 0.04 * width : 0.04 * Breakpoints.xlg),

      ),
    );
  }
}

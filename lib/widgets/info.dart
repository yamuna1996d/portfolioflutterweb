import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/custom_colors.dart';

class Info extends StatelessWidget {
  final double width;
  final double ratio;
  const Info({required this.width,required this.ratio ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width * ratio),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '• I have completed MCA from Mount Zion College of Engineering',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 13)),
          const SizedBox(height: 20),
          Text('• I have completed Flutter Course with Node js &Mongo Db& AWS cloud hosting course from Logix Space Technologies Pvt.Ltd.',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 13)),
          const SizedBox(height: 20),
          Text(
              '• I always try to discover new and the best technologies and use them. ',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 13)),
        ],
      ),
    );
  }
}

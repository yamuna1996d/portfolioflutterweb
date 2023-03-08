import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Description extends StatelessWidget {
  final bool isVertical;
  final double width;
  const Description(
      {required this.isVertical, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isVertical ? double.infinity : width * 0.29,
      child: Column(
        crossAxisAlignment:
            isVertical ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          // Text('Software Developer, Freelancer',
          //     style: GoogleFonts.getFont('Poppins',
          //         color: Colors.white, fontSize: 15)),
          SizedBox(height: 0.015 * width),
          RichText(
            text:  TextSpan(
              text: 'Hi, my name is ',
              style: GoogleFonts.roboto(
                  color: Colors.white, fontSize: 30),
              children: [
                TextSpan(
                  text: 'Yamuna G',
                  style: GoogleFonts.greatVibes(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange, fontSize: 30),
                ),
              ],
            ),
          ),
          // Text('Yamuna',
          //     style: GoogleFonts.getFont('Poppins',
          //         color: Colors.white, fontSize: 30)),
          const SizedBox(height: 20),
          SizedBox(
            width: isVertical ? double.infinity : width * 0.29,
            height: 90,
            child: AnimatedTextKit(
              repeatForever: true,
              pause: const Duration(seconds: 2),
              animatedTexts: [
                TyperAnimatedText(
                    "Flutter Developer, Freelancer",
                    textAlign: isVertical ? TextAlign.center : TextAlign.start,
                    textStyle: GoogleFonts.getFont('Poppins',
                        color: CustomColors.gray,
                        fontSize: 15)),
              ],
            ),
          ),
          InkWell(
            onTap: () async => !await launch(
                'https://mail.google.com/mail/u/0/?fs=1&to=yamunag19@gmail.com&tf=cm'),
            child: Text("Let's chat",
                style: GoogleFonts.getFont('Poppins',
                    decoration: TextDecoration.underline,
                    color: Colors.orange,
                    fontSize: 20)),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/custom_colors.dart';

class Projects extends StatelessWidget {
  final String project,image,description;
  const Projects(
      {required this.project,
        required this.image,
      required this.description,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 370,
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
          color: CustomColors.background,
          border: Border.all(
              color: CustomColors.primary)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 90,top: 10),
            child: Container(
              height: 130,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage(
                    image,
                  ),fit: BoxFit.fill,)
                ),),
          ),
          const SizedBox(width: 70,),
          Column(
            children: [
              Center(
                  child: Text(project,
                      style: GoogleFonts.getFont('Poppins',
                          color: CustomColors.primary, fontSize: 13))),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width/2.3,
                  child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Poppins',
                          color: CustomColors.gray, fontSize: 13)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

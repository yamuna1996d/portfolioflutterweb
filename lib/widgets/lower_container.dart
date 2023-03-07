import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/utils/image_asset_constants.dart';
import 'package:portfolio/widgets/hello_with_bio.dart';
import 'package:portfolio/widgets/info.dart';
import 'package:portfolio/widgets/intrest.dart';
import 'package:portfolio/widgets/skill_card.dart';
import 'package:url_launcher/url_launcher.dart';

class LowerContainer extends StatelessWidget {
  final double width;
  final List<Map> projects;
  final List<Map> ownPro;
  final GlobalKey intrestsKey;
  final GlobalKey skillsKey;

  const LowerContainer(
      {Key? key,
      required this.width,
      required this.projects,
      required this.ownPro,
      required this.intrestsKey,
      required this.skillsKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        key: skillsKey,
        color: CustomColors.darkBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left:width>=Breakpoints.lg? width * 0.1:width * 0.05),
              child: Text('Experience',
                  style: GoogleFonts.getFont('Delius',
                      color: Colors.white, fontSize: 19)),
            ),
            SizedBox(height: 15,),
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth >= Breakpoints.lg) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // skills cards
                    SizedBox(height: width * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkillCard(
                          title: 'Techins Software Solutions',
                          description:
                          'Developed highly functional set of flutter applications for Bookit E-commerce Platform.',
                          company: "Software Developer - Flutter",
                          icon: ImageAssetConstants.techins,
                          width: width,
                          ratio: 0.35,
                        ),
                        const SizedBox(height: 10),
                        SkillCard(
                          title: 'Folea Film Factory PVT LTD',
                          company: "Software Developer - Flutter",
                          description:
                          ' * Developed a highly functional set of flutter applications for SPC PRANA.\n\n'
                              ' * Developed E-commerce flutter application allows students to purchase course materials for \n\tSPC PRANA INSIGHT.\n\n'
                              '* Integrated E-commerce applications with RAZORPAY.\n\n'
                              '* Designed and developed a complete office management application for AXYZ ventures using\n\tFlutter and Firebase',
                          icon: ImageAssetConstants.folea,
                          width: width,
                          ratio: 0.35,
                        ),

                      ],
                    ),
                    SizedBox(width: 0.05 * width),
                    // hello with bio and info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HelloWithBio(
                          ratio:0.4 ,
                          width: width,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Info(width: width,ratio:0.4)
                      ],
                    )
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // skills cards
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkillCard(
                            title: 'Techins Software Solutions LLP',
                            description:
                            'I’m developing android,ios and web applications using flutter platform.',
                            company: "Software Developer - Flutter",
                            icon: ImageAssetConstants.techins,
                            width: 2 * width,
                            ratio: 0.45),
                        const SizedBox(height: 10),
                        SkillCard(
                            title: 'Folea Film Factory PVT LTD',
                            company: "Software Developer - Flutter",
                            description:
                            ' * Developed a highly functional set of flutter applications for SPC PRANA.\n\n'
                                ' * Developed E-commerce flutter application allows students to purchase\n\tcourse materials for SPC PRANA INSIGHT.\n\n'
                                '* Integrated E-commerce applications with RAZORPAY.\n\n'
                                '* Designed and developed a complete office management application for\n\tAXYZ ventures using Flutter and Firebase',
                            icon: ImageAssetConstants.folea,
                            width: 2 * width,
                            ratio: 0.45),
                        const SizedBox(height: 10),

                      ],
                    ),
                    // hello with bio and info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        HelloWithBio(width: 3 * width,ratio: 0.3,),
                        const SizedBox(
                          height: 35,
                        ),
                        Info(width: 3 * width,ratio:0.3),
                      ],
                    )
                  ],
                );
              }
            }),
            SizedBox(
              height: width * 0.07,
            ),
            Container(
              key: intrestsKey,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left:width>=Breakpoints.lg? width * 0.1:width * 0.05),
              child: Text('Projects that i worked on.',
                  style: GoogleFonts.getFont('Delius',
                      color: Colors.white, fontSize: 19)),
            ),
            SizedBox(height: width * 0.03),
            // 820
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth >= Breakpoints.lg) {
                return SizedBox(
                  width: width * 0.86,
                  height: 870,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){
                          launch(projects[index]['url']);
                        },
                        child: Container(
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
                                        projects[index]['image'],
                                      ),fit: BoxFit.fill,)
                                  ),),
                              ),
                              const SizedBox(width: 70,),
                              Column(
                                children: [
                                  Center(
                                      child: Text(projects[index]['project'],
                                          style: GoogleFonts.getFont('Poppins',
                                              color: CustomColors.primary, fontSize: 13))),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width/2.3,
                                      child: Text(
                                          projects[index]['description'],
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.getFont('Poppins',
                                              color: CustomColors.gray, fontSize: 13)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(
                      2,
                    ),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 40.0,
                  ),
                );
              }
              else if (constraints.maxWidth < Breakpoints.lg &&
                  constraints.maxWidth >= Breakpoints.sm) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: width * 2,
                    height: MediaQuery.of(context).size.height*1.84,
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: 4,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: (){
                            launch(projects[index]['url']);
                          },
                          child: Container(
                            // width: 370,
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            decoration: BoxDecoration(
                                color: CustomColors.background,
                                border: Border.all(
                                    color: CustomColors.primary)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 10),
                                  child: Container(
                                    height: 130,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(image: AssetImage(
                                          projects[index]['image'],
                                        ),fit: BoxFit.fill,)
                                    ),),
                                ),
                                const SizedBox(width: 20,),
                                Column(
                                  children: [
                                    Center(
                                        child: Text(projects[index]['project'],
                                            style: GoogleFonts.getFont('Poppins',
                                                color: CustomColors.primary, fontSize: 13))),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width/2.3,
                                        child: Text(
                                            projects[index]['description'],
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.getFont('Poppins',
                                                color: CustomColors.gray, fontSize: 13)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      staggeredTileBuilder: (int index) =>
                          const StaggeredTile.fit(
                        4,
                      ),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 40.0,
                    ),
                  ),
                );
              }
              else if (constraints.maxWidth < Breakpoints.sm) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: width * 2,
                    height: MediaQuery.of(context).size.height*2.5,
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) => MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: (){
                            launch(projects[index]['url']);
                          },
                          child: Container(
                            // width: 370,
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            decoration: BoxDecoration(
                                color: CustomColors.background,
                                border: Border.all(
                                    color: CustomColors.primary)),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20,top: 10),
                                    child: Container(
                                      height: 130,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          image: DecorationImage(image: AssetImage(
                                            projects[index]['image'],
                                          ),fit: BoxFit.fill,)
                                      ),),
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                Column(
                                  children: [
                                    Center(
                                        child: Text(projects[index]['project'],
                                            style: GoogleFonts.getFont('Poppins',
                                                color: CustomColors.primary, fontSize: 13))),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width/2.3,
                                        child: Text(
                                            projects[index]['description'],
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.getFont('Poppins',
                                                color: CustomColors.gray, fontSize: 13)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      staggeredTileBuilder: (int index) =>
                      const StaggeredTile.fit(
                        4,
                      ),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 40.0,
                    ),
                  ),
                );
              }
              else {
                return SizedBox(
                  width: width * 2,
                  height: MediaQuery.of(context).size.height*2.3,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: 4,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){
                          launch(projects[index]['url']);
                        },
                        child: Container(
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
                                        projects[index]['image'],
                                      ),fit: BoxFit.fill,)
                                  ),),
                              ),
                              const SizedBox(width: 70,),
                              Column(
                                children: [
                                  Center(
                                      child: Text(projects[index]['project'],
                                          style: GoogleFonts.getFont('Poppins',
                                              color: CustomColors.primary, fontSize: 13))),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width/2.3,
                                      child: Text(
                                          projects[index]['description'],
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.getFont('Poppins',
                                              color: CustomColors.gray, fontSize: 13)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(
                      8,
                    ),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 40.0,
                  ),
                );
              }
            }),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left:width>=Breakpoints.lg? width * 0.1:width * 0.05),
              child: Text('Own Projects in Play store',
                  style: GoogleFonts.getFont('Delius',
                      color: Colors.white, fontSize: 19)),
            ),
            SizedBox(height: width * 0.03),
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth >= Breakpoints.lg) {
                return SizedBox(
                  width: width * 0.86,
                  height: 300,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){
                          launch(ownPro[index]['url']);
                        },
                        child: Container(
                          // width: 370,
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          decoration: BoxDecoration(
                              color: CustomColors.background,
                              border: Border.all(
                                  color: CustomColors.primary)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10,top: 10),
                                child: Container(
                                  height: 130,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(image: AssetImage(
                                        ownPro[index]['image'],
                                      ),fit: BoxFit.fill,)
                                  ),),
                              ),
                              const SizedBox(width: 70,),
                              Column(
                                children: [
                                  Center(
                                      child: Text(ownPro[index]['project'],
                                          style: GoogleFonts.getFont('Poppins',
                                              color: CustomColors.primary, fontSize: 13))),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: 300,
                                      child: Text(
                                          ownPro[index]['description'],
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.getFont('Poppins',
                                              color: CustomColors.gray, fontSize: 13)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                    const StaggeredTile.fit(
                      2,
                    ),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 40.0,
                  ),
                );
              }
              else if (constraints.maxWidth < Breakpoints.lg &&
                  constraints.maxWidth >= Breakpoints.sm) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: width * 2,
                    height: MediaQuery.of(context).size.height/2,
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) => MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: (){
                            launch(ownPro[index]['url']);
                          },
                          child: Container(
                            // width: 370,
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            decoration: BoxDecoration(
                                color: CustomColors.background,
                                border: Border.all(
                                    color: CustomColors.primary)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 10),
                                  child: Container(
                                    height: 130,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(image: AssetImage(
                                          ownPro[index]['image'],
                                        ),fit: BoxFit.fill,)
                                    ),),
                                ),
                                const SizedBox(width: 20,),
                                Column(
                                  children: [
                                    Center(
                                        child: Text(ownPro[index]['project'],
                                            style: GoogleFonts.getFont('Poppins',
                                                color: CustomColors.primary, fontSize: 13))),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width/2.3,
                                        child: Text(
                                            ownPro[index]['description'],
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.getFont('Poppins',
                                                color: CustomColors.gray, fontSize: 13)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      staggeredTileBuilder: (int index) =>
                      const StaggeredTile.fit(
                        4,
                      ),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 40.0,
                    ),
                  ),
                );
              }
              else if (constraints.maxWidth < Breakpoints.lg &&
                  constraints.maxWidth <= Breakpoints.sm) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: width * 2,
                    height: MediaQuery.of(context).size.height*0.67,
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) => MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: (){
                            launch(ownPro[index]['url']);
                          },
                          child: Container(
                            // width: 370,
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            decoration: BoxDecoration(
                                color: CustomColors.background,
                                border: Border.all(
                                    color: CustomColors.primary)),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20,top: 10),
                                    child: Container(
                                      height: 130,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          image: DecorationImage(image: AssetImage(
                                            ownPro[index]['image'],
                                          ),fit: BoxFit.fill,)
                                      ),),
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                Column(
                                  children: [
                                    Center(
                                        child: Text(ownPro[index]['project'],
                                            style: GoogleFonts.getFont('Poppins',
                                                color: CustomColors.primary, fontSize: 13))),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width/2.3,
                                        child: Text(
                                            ownPro[index]['description'],
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.getFont('Poppins',
                                                color: CustomColors.gray, fontSize: 13)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      staggeredTileBuilder: (int index) =>
                      const StaggeredTile.fit(
                        4,
                      ),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 40.0,
                    ),
                  ),
                );
              }else {
                return SizedBox(
                  width: width * 3,
                  height: 960,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){
                          launch(ownPro[index]['url']);
                        },
                        child: Container(
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
                                        ownPro[index]['image'],
                                      ),fit: BoxFit.fill,)
                                  ),),
                              ),
                              const SizedBox(width: 70,),
                              Column(
                                children: [
                                  Center(
                                      child: Text(ownPro[index]['project'],
                                          style: GoogleFonts.getFont('Poppins',
                                              color: CustomColors.primary, fontSize: 13))),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width/2.3,
                                      child: Text(
                                          ownPro[index]['description'],
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.getFont('Poppins',
                                              color: CustomColors.gray, fontSize: 13)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                    const StaggeredTile.fit(
                      8,
                    ),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 40.0,
                  ),
                );
              }
            }),

          ],
        ));
  }
}

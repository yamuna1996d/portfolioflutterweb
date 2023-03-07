import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/lower_container.dart';
import 'package:portfolio/widgets/upper_container.dart';
import 'package:portfolio/widgets/nav_bar.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  late final List<Map> projects;
  late final List<Map> ownProjects;
  late final GlobalKey projectKey;
  late final GlobalKey skillsKey;
  late final GlobalKey homeKey;
  late final ScrollController scrollController;
  late final RxBool showFloatingButton;

  @override
  void initState() {
    projectKey = GlobalKey();
    skillsKey = GlobalKey();
    homeKey = GlobalKey();
    scrollController = ScrollController();
    showFloatingButton = false.obs;

    projects = [
      {
        'project': 'Prana Insight',
        'description': 'Digitalization is bringing a positive difference in the educational sector, globally. The classic tuition system is now being taken over by effective learning applications. This gives a personalized, visually rich learning experience to the students.',
        'image' : "assets/images/prana.jpg",
        'url' : "https://play.google.com/store/apps/details?id=com.spc.prana.insight"
      },
      {
        'project': 'Bookit',
        'description': ' It’s the world’s first Global Online Mall giving space for shops and establishments to create their own online store, operating in urban or rural areas. Customers can access shops and establishments from their mobile app and making purchase orders or taking service appointment bookings directly with the providers (book it).It caters Online Shopping, Food Delivery, Online booking, Booking appointments, online food order from restaurants, online supermarket, ordering from supermarkets.',
        'image' : "assets/images/bookit.jpg",
        'url' : "https://play.google.com/store/apps/details?id=com.bookitindia.customer"
      },
      {
        'project': 'Bookit Service Provider App',
        'description': "Bookit - Orders or bookings placed by customers with a Vendor are being notified to the Vendor through Bookit Vendor App only.\n"
            "It has quick stock updates features to update the online store stock.\n"
            "It has few store settings functionalities that can be used for quick management.\n"
            "The vendor app has dedicated separate home screens for e-Commerce type vendors and booking type vendors. \n"
            "Additionally, it has the feature to use single-user sign-in to access multiple vendors' accounts for easily accessing the vendor activities using a single login.",
        'image' : "assets/images/bookit.jpg",
        'url' : "https://play.google.com/store/apps/details?id=com.bookitindia.employee"
      },
      {
        'project': "Delivery Agent's App - Bookit",
        'description': 'Bookit Delivery App is for the delivery management of e-Commerce orders placed through the Bookit App by customers.\nA person registered and on active status with Bookit Platform is allowed to use this App.',
        'image' : "assets/images/bookit.jpg",
        'url' : "https://play.google.com/store/apps/details?id=com.bookitindia.delivery"
      },
    ];
    ownProjects = [
      {
        'project': 'Cook Book',
        'description': 'Cook Book -The Crazy Chef ......A RECIPE has no soul..YOU as the Cook MUST BRING soul to the Recipe.....',
        'image' : "assets/images/cook.png",
        'url' : "https://play.google.com/store/apps/details?id=com.yamuna.cook_book"
      },
      {
        'project': 'Wallpic',
        'description': 'Wallpic is an app full of photos..that u can download and use it as wallpaper,profile pics..etc..',
        'image' : "assets/images/icons.jpeg",
        'url' : "https://play.google.com/store/apps/details?id=com.yamuna.wallpic"
      },
    ];

    scrollController.addListener(() {
      if (scrollController.offset >= Breakpoints.floatingButton) {
        showFloatingButton.value = true;
      } else {
        showFloatingButton.value = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: ObxValue<RxBool>(
          (data) => Visibility(
                visible: data.value,
                child: FloatingActionButton(
                    onPressed: () => scrollController.animateTo(
                        scrollController.position.minScrollExtent,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOut),
                    backgroundColor: CustomColors.imageCircleBackground,
                    child: const Icon(Icons.arrow_upward,
                        color: Colors.white)),
              ),
          showFloatingButton),
      body: Container(
        color: CustomColors.darkBackground,
        width: width,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 130),
                  UpperContainer(width: width),
                  LowerContainer(
                      width: width,
                      ownPro: ownProjects,
                      projects: projects,
                      intrestsKey: projectKey,
                      skillsKey: skillsKey),
                  Container(
                    width: width,
                    height: 0.1,
                    color:CustomColors.gray,
                  ),
                  Footer(width: width,scrollController: scrollController,),
                ],
              ),
              NavBar(
                width: width,
                skillsKey: skillsKey,
                intrestsKey: projectKey,
                key: homeKey,
                scrollController: scrollController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

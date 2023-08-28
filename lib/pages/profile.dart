import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:face_net_authentication/constants/colors.dart';
import 'package:face_net_authentication/pages/widgets/home/resident_page.dart';
import 'package:face_net_authentication/pages/widgets/home/visitante_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';

class Profile extends StatefulWidget {
  const Profile(this.username, {Key? key, required this.imagePath})
      : super(key: key);
  final String username;
  final String imagePath;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();

  var _bottomNavIndex = 0;
  //default index of a first screen
  late AnimationController _fabAnimationController;

  late AnimationController _borderRadiusAnimationController;

  late Animation<double> fabAnimation;

  late Animation<double> borderRadiusAnimation;

  late CurvedAnimation fabCurve;

  late CurvedAnimation borderRadiusCurve;

  late AnimationController _hideBottomBarAnimationController;

  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 380,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(45),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 150, top: 100),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 46,
                              ),
                            ),
                            SizedBox(width: 12),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 80),
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.username,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: Text(
                                        "SAIR",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 140),
                            Icon(
                              Icons.notifications_active,
                              color: Colors.white,
                            )
                          ]),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 300, left: 45, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ResidentPage(
                                            name: widget.username,
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    height: 140,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color: SafeFaceColors().blueCard,
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child:
                                        Image.asset('assets/Icons/morador.png'),
                                  ),
                                ),
                                Text(
                                  "Morador",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 26),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VisitantePage(
                                                name: widget.username,
                                              ))),
                                  child: Container(
                                    height: 140,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color: SafeFaceColors().blueCard,
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Image.asset(
                                        'assets/Icons/visitante.png'),
                                  ),
                                ),
                                Text(
                                  "Visitante",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Column(children: [
                              Container(
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: SafeFaceColors().blueCard,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Image.asset('assets/Icons/portaria.png'),
                              ),
                              Text(
                                "Portaria",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              )
                            ]),
                            SizedBox(width: 26),
                            Column(
                              children: [
                                Container(
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    color: SafeFaceColors().blueCard,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child:
                                      Image.asset('assets/Icons/problemas.png'),
                                ),
                                Text(
                                  "Relatar Problemas",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 68),
                          child: Text(
                            "Projeto voltado para fetin 2023. ",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

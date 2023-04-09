import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'ui_components/common/constant.dart';
import 'ui_components/mobile/announcement_page.dart';
import 'ui_components/mobile/appbar.dart';
import 'ui_components/mobile/body.dart';
import 'ui_components/mobile/feed_page.dart';
import 'ui_components/mobile/job_page.dart';
import 'ui_components/size_info.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PageController bodyNavigation = PageController();

  bool isWeb() {
    return SizeInfo.screenWidth > 950;
  }

  final int maxCount = 4;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: MobileAppBar(scaffoldKey: scaffoldKey),
        ),
        // endDrawer: const MobileDrawer(),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: bodyNavigation,
          scrollDirection: Axis.horizontal,
          children: const [
            FeedPage(),
            MobileBody(),
            AnnouncementPage(),
            JobPage(),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: (4 <= maxCount)
            ? Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(3, 0, 3, 3),
                child: SalomonBottomBar(
                  selectedItemColor: primaryColor,
                  // selectedColorOpacity: 0.5,
                  unselectedItemColor: secondaryColor,
                  backgroundColor: primaryColor,
                  currentIndex: _currentIndex,
                  onTap: (i) {
                    setState(() {
                      _currentIndex = i;
                    });
                    bodyNavigation.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  items: [
                    SalomonBottomBarItem(
                        icon: const Icon(Icons.home_outlined, size: 16),
                        title: const Text(
                          "Home",
                          style: TextStyle(fontSize: 12),
                        ),
                        selectedColor: scaffoldColor),
                    SalomonBottomBarItem(
                        icon:
                            const Icon(Icons.sports_esports_outlined, size: 16),
                        title: const Text(
                          "Activity",
                          style: TextStyle(fontSize: 12),
                        ),
                        selectedColor: scaffoldColor),
                    SalomonBottomBarItem(
                        icon: const Icon(CupertinoIcons.bell, size: 16),
                        title: const Text(
                          "Events",
                          style: TextStyle(fontSize: 12),
                        ),
                        selectedColor: scaffoldColor),
                    SalomonBottomBarItem(
                        icon: const Icon(Icons.home_repair_service_rounded,
                            size: 16),
                        title: const Text(
                          "Jobs",
                          style: TextStyle(fontSize: 12),
                        ),
                        selectedColor: scaffoldColor),
                    // SalomonBottomBarItem(
                    //     icon: const Icon(Icons.person),
                    //     title: const Text("Profile"),
                    //     selectedColor: scaffoldColor),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}

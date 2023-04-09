import 'dart:async';

import 'package:ace_hack/ui_components/common/club_card.dart';
import 'package:flutter/material.dart';

import '../common/constant.dart';
import '../size_info.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  Timer? carouselsTimer;
  late final PageController pageController;
  int pageNo = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carouselsTimer = getTimer();
    super.initState();
  }

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 3) {
        pageNo = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          pageNo,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
        );
        pageNo++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<bool> joinStatus = [true, false, true, false];
    List<String> url = [
      "assets/AIC.jpg",
      "assets/Arya.jpg",
      "assets/Sticker.jpg"
    ];
    List<String> clubData = [
      "assets/Bubble.jpg",
      "assets/Global.jpg",
      "assets/Humming.jpg",
      "assets/Royal.jpg"
    ];
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: SizeInfo.screenHeight * .3,
          child: PageView.builder(
            itemCount: url.length,
            controller: pageController,
            onPageChanged: (index) {
              pageNo = index;
              setState(() {});
            },
            itemBuilder: (_, int index) {
              return AnimatedBuilder(
                animation: pageController,
                builder: (ctx, child) {
                  return child!;
                },
                child: GestureDetector(
                  onTap: () {},
                  onPanDown: (d) {
                    carouselsTimer?.cancel();
                    carouselsTimer = null;
                  },
                  onPanCancel: () {
                    carouselsTimer = getTimer();
                  },
                  child: Container(
                    // height: 50,
                    // width: 100,
                    margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          url[index],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Container(
              margin: const EdgeInsets.all(2),
              child: Icon(
                Icons.circle,
                size: 12,
                color: pageNo == index ? primaryColor : secondaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 35,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: FittedBox(
              child: Text(
                "Clubs & Society",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: clubData.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  clubCard(true, joinStatus[index], clubData[index], context),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 35,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: FittedBox(
              child: Text(
                "Events",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: clubData.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  clubCard(false, false, clubData[index], context),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 35,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: FittedBox(
              child: Text(
                "Upcoming Events",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: clubData.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  clubCard(true, joinStatus[index], clubData[index], context),
            ),
          ),
        ),
      ],
    );
  }
}

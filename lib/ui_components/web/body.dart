import 'dart:async';

import 'package:flutter/material.dart';

import '../size_info.dart';

class WebBody extends StatefulWidget {
  const WebBody({super.key});

  @override
  State<WebBody> createState() => _WebBodyState();
}

class _WebBodyState extends State<WebBody> {
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
    return Timer.periodic(Duration(seconds: 3), (timer) {
      if (pageNo == 3) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: SizeInfo.screenHeight * .3,
            child: PageView.builder(
              itemCount: 3,
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
                        color: Colors.yellow,
                        // image: DecorationImage(
                        //     image: NetworkImage(backdropUrl),
                        //     fit: BoxFit.cover,
                        //     alignment: Alignment.center),
                        borderRadius: BorderRadius.circular(24),
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
                child: Icon(Icons.circle,
                    size: 12,
                    color: pageNo == index
                        ? Colors.indigoAccent
                        : Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

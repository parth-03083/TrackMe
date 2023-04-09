import 'package:ace_hack/ui_components/mobile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/constant.dart';

class MobileAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MobileAppBar({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //   icon: const Icon(CupertinoIcons.bars),
      //   onPressed: () {
      //     scaffoldKey.currentState?.openEndDrawer();
      //   },
      // ),
      title: const Text("HTL"),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return const ProfilePage();
            }));
          },
          child: CircleAvatar(
            // radius: SizeInfo.screenWidth * .3 / 2,
            backgroundColor: secondaryColor,
            child: Icon(
              color: primaryColor,
              // size: SizeInfo.screenHeight * .2 / 2,
              Icons.person_outline_rounded,
            ),
          ),
        ),
      ],
    );
  }
}

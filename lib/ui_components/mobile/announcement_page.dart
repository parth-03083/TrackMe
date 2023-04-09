import 'package:flutter/material.dart';

import '../common/constant.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        customTile(
            "Our organization is excited to host a hackathon on [date] at [location], where participants will have the opportunity to create innovative solutions to [theme], network with other professionals, and showcase their skills."),
        customTile(
            "Join us on [date] at [location] for a hackathon focused on [theme], where participants will collaborate, compete, and showcase their innovative solutions to real-world problems."),
        customTile(
            "Calling all developers, designers, and entrepreneurs: participate in our hackathon on [date] at [location] to create innovative solutions that address pressing issues in [theme], network with like-minded individuals, and potentially win prizes."),
        customTile(
            "Be a part of the innovation and join us on [date] at [location] for our hackathon, where participants will work together to create solutions to [theme], learn new skills, and compete for prizes."),
      ],
    );
  }

  Widget customTile(String details) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: primaryColor)),
      padding: const EdgeInsets.all(10),
      child: ListTile(
        shape: const StadiumBorder(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Announcements"),
            Text(
              details,
              style: TextStyle(fontSize: 12, color: secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}

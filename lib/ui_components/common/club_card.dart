import 'package:flutter/material.dart';

import 'constant.dart';

Widget clubCard(
    bool isEvent, bool haveJoined, String url, BuildContext context) {
  // bool haveJoined = true;
  return GestureDetector(
    onTap: () {
      showDetails(context, url);
    },
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Card(
        elevation: 8.0,
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
          ),
          height: 150,
          width: 100,
          child: isEvent
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {},
                    child:
                        haveJoined ? const Text("Joined") : const Text("Join"),
                  ),
                )
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {},
                    child:
                        haveJoined ? const Text("Joined") : const Text("Join"),
                  ),
                ),
        ),
      ),
    ),
  );
}

Future showDetails(BuildContext context, String url) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: scaffoldColor.withOpacity(.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(url)),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
                ),
              ],
            ),
          ),
        );
      });
}

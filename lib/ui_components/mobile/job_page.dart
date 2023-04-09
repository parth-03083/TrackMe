import 'package:flutter/material.dart';

import '../common/constant.dart';

class JobPage extends StatelessWidget {
  const JobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        customTile(context, "assets/Bubble.jpg", "Bubble Tech",
            "Associate Software Engineer", "6 LPA", "Full-Time"),
        customTile(context, "assets/Humming.jpg", "Humming Digital Technology",
            "Data Scientist", "8 LPA", "Freelance"),
        customTile(context, "assets/Royal.jpg", "Royal Tech Technology",
            "Product Manager", "6 LPA", "Intern"),
        customTile(context, "assets/Global.jpg", "Global Impact",
            "Web Developer", "6 LPA", "Part-Time"),
      ],
    );
  }

  Widget customTile(BuildContext ctx, String url, name, jd, salary, jobType) {
    return GestureDetector(
      onTap: () => showDetails(ctx, url),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: primaryColor)),
        padding: const EdgeInsets.all(10),
        child: ListTile(
          shape: const StadiumBorder(),
          leading: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
              // color: primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            height: 80,
            width: 80,
          ),
          // leading: Image.asset(url),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(
                jd,
                style: TextStyle(fontSize: 12, color: secondaryColor),
              ),
              Row(
                children: [
                  Text(
                    salary,
                    style: TextStyle(fontSize: 10, color: secondaryColor),
                  ),
                  Text(
                    "  |  ",
                    style: TextStyle(fontSize: 10, color: secondaryColor),
                  ),
                  Text(
                    jobType,
                    style: TextStyle(fontSize: 10, color: secondaryColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
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
            // height: double.infinity,
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent.withOpacity(.5),
                    ),
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginScreen(),
                      //   ),
                      // );
                    },
                    child: Center(
                      child: Text(
                        "Apply",
                        style: TextStyle(color: primaryColor, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

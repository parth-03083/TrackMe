import 'package:ace_hack/ui_components/common/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (_, index) {
        return buildFeed("assets/Humming.jpg", "Sanskar", "Flutter Dev",
            "Humming Bird", false);
      },
    );
  }

  Widget buildFeed(String url, name, bio, details, bool isOrg) {
    PageController carouselController = PageController();
    // return Container(
    //     margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    //     height: 200,
    //     width: double.infinity,
    //     alignment: Alignment.bottomCenter,
    //     decoration: BoxDecoration(
    //         color: Colors.yellow,
    //         borderRadius: BorderRadius.circular(20),
    //         image: const DecorationImage(
    //             image: AssetImage("assets/Bubble.jpg"), fit: BoxFit.cover)),
    //     child: Container(
    //       // width: double.infinity,
    //       height: 50,
    //       decoration: BoxDecoration(
    //         color: scaffoldColor.withOpacity(.5),
    //         borderRadius: const BorderRadius.only(
    //             bottomLeft: Radius.circular(20),
    //             bottomRight: Radius.circular(20)),
    //       ),
    //       padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    //       child: Text(
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    //         style: TextStyle(color: primaryColor, height: 1.2),
    //         overflow: TextOverflow.clip,
    //       ),
    //     ));
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          border: Border.all(color: primaryColor, width: 2)),
      child: Column(
        children: [
          SizedBox(
            height: 65,
            child: ListTile(
              leading: isOrg
                  ? CircleAvatar(
                      backgroundColor: secondaryColor,
                      child: Icon(
                        color: primaryColor,
                        Icons.person_outline_rounded,
                      ),
                    )
                  : null,
              trailing: isOrg
                  ? null
                  : Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(url),
                        ),
                      ),
                    ),
              title: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bio,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(details),
                ],
              ),
              isThreeLine: false,
              dense: true,
            ),
          ),
          SizedBox(
            // width: 300,
            height: 200,
            child: CarouselSlider(
              items: [
                carousel(url),
                carousel(url),
                carousel(url),
                carousel(url),
              ],
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                // autoPlay: true,
                // aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                // autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget carousel(String url) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(9)

          // bottomLeft: Radius.circular(8.5),
          // bottomRight: Radius.circular(8.5),
          ),
      image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
    ),
  );
}

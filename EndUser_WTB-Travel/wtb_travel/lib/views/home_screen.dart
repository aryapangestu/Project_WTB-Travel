import 'package:flutter/material.dart';
import 'package:wtb_travel/models/category.dart';

class Category {
  String? name;
  IconData? icon;

  Category({this.name, this.icon});
}

class Place {
  String? image;
  String? title;
  String? rating;
  String? comments;

  Place({this.image, this.title, this.rating, this.comments});
}

class WtbTravelHomeScreen extends StatefulWidget {
  const WtbTravelHomeScreen({Key? key}) : super(key: key);

  @override
  State<WtbTravelHomeScreen> createState() => _WtbTravelHomeScreen();
}

class _WtbTravelHomeScreen extends State<WtbTravelHomeScreen> {
  List<Category> categories = [
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
    Category(name: 'Electronics', icon: Icons.audiotrack),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10.0),
          const Text(
            'Category',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          categoryList(),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget categoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(right: 8, top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: categories.map((e) {
          return Container(
            width: 100,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF1157FA)),
                  child: Icon(e.icon!, size: 30, color: Colors.white),
                ),
                const SizedBox(height: 4.0),
                Text(e.name!,
                    style: const TextStyle(fontSize: 12),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // Widget recommendPlaceList() {
  //   return Container(
  //     width: 250,
  //     decoration: BoxDecoration(
  //         color: Colors.white, borderRadius: BorderRadius.circular(32)),
  //     child: Stack(
  //       children: [
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Image.network(
  //               'https://picsum.photos/250?image=9',
  //               width: 250,
  //               height: 150,
  //               fit: BoxFit.cover,
  //             ).cornerRadiusWithClipRRectOnly(topLeft: 32, topRight: 32),
  //             widget.element.saveTag
  //                 ? Container(
  //                     color: bmTextColorDarkMode.shade400,
  //                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  //                     child: Row(
  //                       children: [
  //                         Icon(Icons.local_offer_rounded,
  //                             color: Color(0xff808080), size: 16),
  //                         2.width,
  //                         Text(
  //                           'Save up to 20% for next booking!',
  //                           style: secondaryTextStyle(color: Color(0xff636161)),
  //                         ).expand(),
  //                       ],
  //                     ),
  //                   )
  //                 : Offstage(),
  //             const SizedBox(height: 8.0),
  //             Text(widget.element.title,
  //                     style: boldTextStyle(
  //                         size: 18,
  //                         color: appStore.isDarkModeOn
  //                             ? Colors.white
  //                             : bmSpecialColorDark))
  //                 .paddingSymmetric(horizontal: 8),
  //             const SizedBox(height: 4.0),
  //             Text(widget.element.subtitle!,
  //                     style: secondaryTextStyle(
  //                         color: appStore.isDarkModeOn
  //                             ? bmTextColorDarkMode
  //                             : bmPrimaryColor,
  //                         size: 12))
  //                 .paddingSymmetric(horizontal: 8),
  //             const SizedBox(height: 4.0),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Icon(
  //                       Icons.star,
  //                       color: Colors.amber,
  //                     ),
  //                     4.width,
  //                     Text(widget.element.rating!, style: boldTextStyle()),
  //                     2.width,
  //                     Text('(${widget.element.comments!})',
  //                         style: secondaryTextStyle(
  //                             color: appStore.isDarkModeOn
  //                                 ? bmTextColorDarkMode
  //                                 : bmPrimaryColor)),
  //                   ],
  //                 ),
  //                 Text(widget.element.distance!,
  //                     style: secondaryTextStyle(
  //                         color: appStore.isDarkModeOn
  //                             ? bmTextColorDarkMode
  //                             : bmPrimaryColor)),
  //               ],
  //             ).paddingSymmetric(horizontal: 8),
  //             const SizedBox(height: 16.0),
  //           ],
  //         ),
  //         Positioned(
  //           top: 15,
  //           right: 15,
  //           child: Icon(
  //             Icons.favorite,
  //             color: widget.element.liked! ? Colors.amber : bmTextColorDarkMode,
  //             size: 24,
  //           ).onTap(() {
  //             widget.element.liked = !widget.element.liked.validate();
  //             if (widget.isFavList) {
  //               favList.remove(widget.element);
  //             }
  //             setState(() {});
  //           }),
  //         )
  //       ],
  //     ),
  //   );
  // }
}

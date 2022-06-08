import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wtb_travel/views/detail_place_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Review {
  String title;
  String? subtitle;
  String? rating;

  Review({required this.title, this.subtitle, this.rating});
}

class WtbTravelReviewScreen extends StatefulWidget {
  const WtbTravelReviewScreen({Key? key}) : super(key: key);

  @override
  State<WtbTravelReviewScreen> createState() => _WtbTravelReviewScreen();
}

class _WtbTravelReviewScreen extends State<WtbTravelReviewScreen> {
  List<Review> review = [
    Review(
      title: "Ihsan",
      subtitle: 'Bagus museumnya',
      rating: '4.0',
    ),
    Review(
      title: "Ihsan",
      subtitle: 'Bagus museumnya',
      rating: '4.0',
    ),
    Review(
      title: "Ihsan",
      subtitle: 'Bagus museumnya',
      rating: '4.0',
    ),
    Review(
      title: "Ihsan",
      subtitle: 'Bagus museumnya',
      rating: '4.0',
    ),
    Review(
      title: "Ihsan",
      subtitle: 'Bagus museumnya',
      rating: '4.0',
    ),
  ];

  @override
  void initState() {
    setStatusBarColor(const Color(0xfff6f0e4));
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(const Color(0xff88692b));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 16,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        direction: Axis.vertical,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        runSpacing: 8,
        children: review.map((e) {
          return Container(
            width: context.width() - 32,
            decoration: BoxDecoration(
                color: context.cardColor, borderRadius: radius(32)),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Text(e.title,
                            style: boldTextStyle(
                                size: 18, color: const Color(0xff543c0d)))
                        .paddingSymmetric(horizontal: 8),
                    4.height,
                    Text(e.subtitle!,
                            style: secondaryTextStyle(
                                color: const Color(0xffc7b899), size: 12))
                        .paddingSymmetric(horizontal: 8),
                    4.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: e.rating!.toDouble(),
                              minRating: 5,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 18,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                //
                              },
                            ),
                            4.width,
                            Text(e.rating!, style: boldTextStyle()),
                            2.width,
                          ],
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 8),
                    16.height,
                  ],
                ),
              ],
            ),
          ).onTap(() {
            // const WtbTravelDetailPlaceScreen(element: e).launch(context);
            const WtbTravelDetailPlaceScreen().launch(context);
          });
        }).toList(),
      ).paddingOnly(top: 16, bottom: 70, left: 16, right: 16),
    );
  }
}

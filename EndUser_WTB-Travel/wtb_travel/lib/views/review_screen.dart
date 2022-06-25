import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wtb_travel/controllers/review_controller.dart';
import 'package:wtb_travel/models/review.dart';

class WtbTravelReviewScreen extends StatefulWidget {
  WtbTravelReviewScreen({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<WtbTravelReviewScreen> createState() => _WtbTravelReviewScreen();
}

class _WtbTravelReviewScreen extends State<WtbTravelReviewScreen> {
  Widget reviewPlace(List<Review> data) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 16,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        direction: Axis.vertical,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        runSpacing: 8,
        children: data.map((e) {
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
                    Text(e.username!,
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
          });
        }).toList(),
      ).paddingOnly(top: 16, bottom: 70, left: 16, right: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future reviews = getReviews(widget.id);
    return FutureBuilder(
      future: reviews,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error when fetching data"),
          );
        } else if (snapshot.hasData) {
          List<Review> data = snapshot.data as List<Review>;

          if (data.isEmpty) {
            return const Center(child: Text("Belum ada ulasan"));
          }
          return reviewPlace(data);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

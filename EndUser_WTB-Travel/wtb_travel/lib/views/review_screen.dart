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

class inputReview extends StatefulWidget {
  @override
  const inputReview(
      {Key? key,
      required this.token,
      required this.user_id,
      required this.place_id})
      : super(key: key);

  final String token;
  final int? user_id, place_id;
  @override
  State<inputReview> createState() => _inputReviewState();
}

class _inputReviewState extends State<inputReview> {
  final _formKey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  double rating = 3.0;
  var comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f0e4),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Ulasan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 60),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating_set) {
                      print(rating_set);
                      rating = rating_set;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan masukkan ulasan';
                      }
                      comment = value;
                      return null;
                    },
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Ulasan',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff464544)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xff543c0d))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          finish(context);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
                            primary: const Color(0xff543c0d)),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var data = await storeReviews(widget.token, rating,
                                comment, widget.user_id!, widget.place_id!);
                            Navigator.pop(context, 'OK');
                            if (data[0] == true) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Tambah ulasan berhasil'),
                                  content: const Text(
                                      'Selamat ulasan Anda berhasil ditambahkan'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'OK');
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Tambah ulasan gagal'),
                                  content: Wrap(
                                      spacing: 20,
                                      runSpacing: 20,
                                      children: [
                                        for (var i = 0; i < data[1].length; i++)
                                          Text(data[1][i]),
                                      ]),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
                            primary: const Color(0xff543c0d)),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wtb_travel/views/detail_place_screen.dart';
import 'package:wtb_travel/views/home_screen.dart';

class Place {
  String image;
  String title;
  String? subtitle;
  String? rating;
  String? comments;
  String? distance;

  Place(
      {required this.image,
      required this.title,
      this.subtitle,
      this.comments,
      this.distance,
      this.rating});
}

class WtbTravelListPlaceScreen extends StatefulWidget {
  const WtbTravelListPlaceScreen({Key? key}) : super(key: key);

  @override
  State<WtbTravelListPlaceScreen> createState() => _WtbTravelListPlaceScreen();
}

class _WtbTravelListPlaceScreen extends State<WtbTravelListPlaceScreen> {
  List<Place> place = [
    Place(
      title: "Museum Konferensi Asia Afrika",
      image:
          'https://lh5.googleusercontent.com/p/AF1QipNXWXmYuRaRCTFhROcJ9MAq0ocIErS4M-wRP9vd=w426-h240-k-no',
      subtitle:
          'Jl. Asia Afrika No.65, Braga, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40111',
      rating: '5.0',
      comments: '240',
      distance: '0.5 mil',
    ),
    Place(
      title: "Museum Konferensi Asia Afrika",
      image:
          'https://lh5.googleusercontent.com/p/AF1QipNXWXmYuRaRCTFhROcJ9MAq0ocIErS4M-wRP9vd=w426-h240-k-no',
      subtitle:
          'Jl. Asia Afrika No.65, Braga, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40111',
      rating: '5.0',
      comments: '240',
      distance: '0.5 mil',
    ),
    Place(
      title: "Museum Konferensi Asia Afrika",
      image:
          'https://lh5.googleusercontent.com/p/AF1QipNXWXmYuRaRCTFhROcJ9MAq0ocIErS4M-wRP9vd=w426-h240-k-no',
      subtitle:
          'Jl. Asia Afrika No.65, Braga, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40111',
      rating: '5.0',
      comments: '240',
      distance: '0.5 mil',
    ),
    Place(
      title: "Museum Konferensi Asia Afrika",
      image:
          'https://lh5.googleusercontent.com/p/AF1QipNXWXmYuRaRCTFhROcJ9MAq0ocIErS4M-wRP9vd=w426-h240-k-no',
      subtitle:
          'Jl. Asia Afrika No.65, Braga, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40111',
      rating: '5.0',
      comments: '240',
      distance: '0.5 mil',
    ),
    Place(
      title: "Museum Konferensi Asia Afrika",
      image:
          'https://lh5.googleusercontent.com/p/AF1QipNXWXmYuRaRCTFhROcJ9MAq0ocIErS4M-wRP9vd=w426-h240-k-no',
      subtitle:
          'Jl. Asia Afrika No.65, Braga, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40111',
      rating: '5.0',
      comments: '240',
      distance: '0.5 mil',
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
    return Scaffold(
      backgroundColor: const Color(0xfff6f0e4),
      appBar: AppBar(
        backgroundColor: const Color(0xfff6f0e4),
        elevation: 0.0,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back, size: 30, color: Color(0xffc7b899)),
          onPressed: () {
            finish(context);
          },
        ),
        title: Text(
          "Name category",
          style: boldTextStyle(size: 20, color: const Color(0xff543c0d)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 16,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          direction: Axis.vertical,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          runSpacing: 8,
          children: place.map((e) {
            return Container(
              width: context.width() - 32,
              decoration: BoxDecoration(
                  color: context.cardColor, borderRadius: radius(32)),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        e.image,
                        width: context.width() - 32,
                        height: 150,
                        fit: BoxFit.cover,
                      ).cornerRadiusWithClipRRectOnly(
                          topLeft: 32, topRight: 32),
                      const Offstage(),
                      8.height,
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
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              4.width,
                              Text(e.rating!, style: boldTextStyle()),
                              2.width,
                              Text('(${e.comments!})',
                                  style: secondaryTextStyle(
                                      color: const Color(0xffc7b899))),
                            ],
                          ),
                          Text(e.distance!,
                              style: secondaryTextStyle(
                                  color: const Color(0xffc7b899))),
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
      ),
    );
  }
}

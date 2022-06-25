import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wtb_travel/models/place.dart';
import 'package:wtb_travel/views/map_place_screen.dart';
import 'package:wtb_travel/views/review_screen.dart';

class WtbTravelDetailPlaceScreen extends StatefulWidget {
  final Place element;
  const WtbTravelDetailPlaceScreen({Key? key, required this.element})
      : super(key: key);

  @override
  State<WtbTravelDetailPlaceScreen> createState() =>
      _WtbTravelDetailPlaceScreen();
}

class _WtbTravelDetailPlaceScreen extends State<WtbTravelDetailPlaceScreen> {
  List<String> tabList = ['Description', 'Review'];

  int selectedTab = 0;

  Widget getSelectedTabComponent() {
    if (selectedTab == 0) {
      return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text(
              widget.element.description!,
              style: primaryTextStyle(color: const Color(0xff543c0d)),
            ),
            20.height,
          ]).paddingAll(16);
    } else {
      return WtbTravelReviewScreen(
        id: widget.element.id!,
      );
    }
  }

  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f0e4),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: const Color(0xfff6f0e4),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xffc7b899)),
                onPressed: () {
                  finish(context);
                },
              ).visible(innerBoxIsScrolled),
              title: Text(
                widget.element.name!,
                style: boldTextStyle(size: 20, color: const Color(0xff543c0d)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ).visible(innerBoxIsScrolled),
              leadingWidth: 30,
              pinned: true,
              elevation: 0.5,
              expandedHeight: 450,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                    const EdgeInsets.only(bottom: 66, left: 30, right: 50),
                collapseMode: CollapseMode.parallax,
                background: Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          widget.element.image!,
                          height: 300,
                          width: context.width(),
                          fit: BoxFit.cover,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: radius(100),
                                color: context.cardColor,
                              ),
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(left: 16, top: 30),
                              child: const Icon(Icons.arrow_back,
                                  color: Color(0xffc7b899)),
                            ).onTap(() {
                              finish(context);
                            }, borderRadius: radius(100)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: const Color(0xfff6f0e4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.element.name!,
                            style: boldTextStyle(
                                size: 20, color: const Color(0xff543c0d)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          8.height,
                          Text(
                            widget.element.address!,
                            style: secondaryTextStyle(
                                color: const Color(0xffc7b899), size: 12),
                          ),
                          8.height,
                          Row(
                            children: [
                              Text(widget.element.rating!,
                                  style: boldTextStyle()),
                              2.width,
                              RatingBar.builder(
                                initialRating:
                                    widget.element.rating!.toDouble(),
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
                              6.width,
                              Text("${widget.element.comments!} reviews",
                                  style:
                                      secondaryTextStyle(color: Colors.grey)),
                            ],
                          ),
                          8.height,
                          Wrap(
                            spacing: 16,
                            children: [
                              // Map
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffc7b899)),
                                  color: const Color(0xfff6f0e4),
                                  borderRadius: radius(32),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.map_outlined,
                                        color: Color(0xffc7b899)),
                                    4.width,
                                    Text('Map',
                                        style: boldTextStyle(
                                            color: const Color(0xffc7b899))),
                                  ],
                                ),
                              ).onTap(() {
                                MapNavigationApp(
                                  element: widget.element,
                                ).launch(context);
                              }, borderRadius: radius(32)),

                              // Tambah Review
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffc7b899)),
                                  color: const Color(0xfff6f0e4),
                                  borderRadius: radius(32),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.add_outlined,
                                        color: Color(0xffc7b899)),
                                    4.width,
                                    Text('Tambah review',
                                        style: boldTextStyle(
                                            color: const Color(0xffc7b899))),
                                  ],
                                ),
                              ).onTap(() {
                                const inputReview().launch(context);
                              }, borderRadius: radius(32)),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0xfffffcf5),
            borderRadius: radiusOnly(topLeft: 32, topRight: 32),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                16.height,
                HorizontalList(
                  itemCount: tabList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: radius(32),
                        color: selectedTab == index
                            ? const Color(0xffc7b899)
                            : Colors.transparent,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        tabList[index],
                        style: boldTextStyle(
                          size: 12,
                          color: selectedTab == index
                              ? white
                              : const Color(0xff543c0d),
                        ),
                      ).onTap(() {
                        selectedTab = index;
                        setState(() {});
                      }),
                    );
                  },
                ),
                getSelectedTabComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

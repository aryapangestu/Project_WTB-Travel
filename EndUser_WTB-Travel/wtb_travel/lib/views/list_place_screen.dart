import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wtb_travel/controllers/category_controller.dart';
import 'package:wtb_travel/views/detail_place_screen.dart';
import 'package:wtb_travel/models/place.dart';

class WtbTravelListPlaceScreen extends StatefulWidget {
  const WtbTravelListPlaceScreen(
      {Key? key, required this.id, required this.name})
      : super(key: key);

  final int id;
  final String name;
  @override
  State<WtbTravelListPlaceScreen> createState() => _WtbTravelListPlaceScreen();
}

class _WtbTravelListPlaceScreen extends State<WtbTravelListPlaceScreen> {
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

  Widget listPLace(List<Place> data) {
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
                    Image.network(
                      e.image!,
                      width: context.width() - 32,
                      height: 150,
                      fit: BoxFit.cover,
                    ).cornerRadiusWithClipRRectOnly(topLeft: 32, topRight: 32),
                    const Offstage(),
                    8.height,
                    Text(e.name!,
                            maxLines: 1,
                            style: boldTextStyle(
                                size: 18, color: const Color(0xff543c0d)))
                        .paddingSymmetric(horizontal: 8),
                    4.height,
                    Text(e.address!,
                            maxLines: 2,
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
                      ],
                    ).paddingSymmetric(horizontal: 8),
                    16.height,
                  ],
                ),
              ],
            ),
          ).onTap(() {
            // const WtbTravelDetailPlaceScreen(element: e).launch(context);
            WtbTravelDetailPlaceScreen(element: e).launch(context);
          });
        }).toList(),
      ).paddingOnly(top: 16, bottom: 70, left: 16, right: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future places = categoryPlace(widget.id);

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
          widget.name,
          style: boldTextStyle(size: 20, color: const Color(0xff543c0d)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: FutureBuilder(
        future: places,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error when fetching data"),
            );
          } else if (snapshot.hasData) {
            List<Place> data = snapshot.data as List<Place>;

            if (data.isEmpty) {
              return const Center(child: Text('Tempat tidak ditemukan'));
            }
            return listPLace(data);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

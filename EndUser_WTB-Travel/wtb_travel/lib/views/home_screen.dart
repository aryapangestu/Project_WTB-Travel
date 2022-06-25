import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wtb_travel/controllers/category_controller.dart';
import 'package:wtb_travel/controllers/place_controller.dart';
import 'package:wtb_travel/models/category.dart';
import 'package:wtb_travel/models/user.dart';
import 'package:wtb_travel/views/detail_place_screen.dart';
import 'package:wtb_travel/views/list_place_screen.dart';
import 'package:wtb_travel/models/place.dart';
import 'package:wtb_travel/views/list_search_results_places.dart';

class WtbTravelHomeScreen extends StatefulWidget {
  const WtbTravelHomeScreen({Key? key, required this.token, required this.user})
      : super(key: key);

  final String token;
  final profilUser user;
  @override
  State<WtbTravelHomeScreen> createState() => _WtbTravelHomeScreen();
}

class _WtbTravelHomeScreen extends State<WtbTravelHomeScreen> {
  late Future categories;
  late Future places;

  @override
  void initState() {
    categories = getCategories();
    places = getPlaces();
    super.initState();
  }

  Future refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    categories = getCategories();
    places = getPlaces();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshData,
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              searchTxt(),
              const SizedBox(height: 16.0),
              bannerWidget(),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Category',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              FutureBuilder(
                future: categories,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error when fetching data"),
                    );
                  } else if (snapshot.hasData) {
                    List<Category> data = snapshot.data as List<Category>;

                    if (data.isEmpty) {
                      return const Center(child: Text("Data is empty"));
                    }
                    return categoryList(data);
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Popular place',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              FutureBuilder(
                future: places,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error when fetching data"),
                    );
                  } else if (snapshot.hasData) {
                    List<Place> data = snapshot.data as List<Place>;

                    if (data.isEmpty) {
                      return const Center(child: Text("Data is empty"));
                    }
                    return popularPlaceList(data);
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchTxt() {
    final myController = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppTextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search_sharp, color: Colors.black),
            hintText: 'Find your place...',
            hintStyle: boldTextStyle(color: Colors.black)),
        textFieldType: TextFieldType.NAME,
        cursorColor: const Color(0xffc79a9a),
        controller: myController,
        onFieldSubmitted: (s) {
          WtbTravelListSearchResultsPlaceScreen(
                  name: myController.text,
                  token: widget.token,
                  user: widget.user)
              .launch(context);
        },
      ),
    );
  }

  Widget bannerWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                'https://live.staticflickr.com/7601/17147483356_9f86e26a29_c.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryList(List<Category> categories) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(right: 8, top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: categories.map((e) {
          return InkWell(
            child: Container(
              width: 100,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Image.network(e.url_icon!, width: 30, height: 30),
                  ),
                  const SizedBox(height: 4.0),
                  Text(e.name!,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            onTap: () {
              WtbTravelListPlaceScreen(
                id: e.id!,
                name: e.name!,
                token: widget.token,
                user: widget.user,
              ).launch(context);
            },
          );
        }).toList(),
      ),
    );
  }

  Widget popularPlaceList(List<Place> places) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 16,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        direction: Axis.horizontal,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        runSpacing: 8,
        children: places.map((e) {
          return InkWell(
            onTap: () {
              WtbTravelDetailPlaceScreen(
                element: e,
                token: widget.token,
                user: widget.user,
              ).launch(context);
            },
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            child: Container(
              width: 250,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(32))),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.network(
                          e.image!,
                          width: 250,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Offstage(),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(e.name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 4.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(e.address!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            )),
                      ),
                      const SizedBox(height: 4.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                const SizedBox(height: 4.0),
                                Text(e.rating!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const SizedBox(height: 2.0),
                                Text('(${e.comments!})',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

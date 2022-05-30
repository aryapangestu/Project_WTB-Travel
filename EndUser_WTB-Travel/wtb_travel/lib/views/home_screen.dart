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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          categoryList(),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Top views',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          recommendPlaceList(),
          const SizedBox(height: 20.0),
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

  Widget recommendPlaceList() {
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
        children: categories.map((e) {
          return Container(
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
                        'https://lh5.googleusercontent.com/p/AF1QipNXWXmYuRaRCTFhROcJ9MAq0ocIErS4M-wRP9vd=w426-h240-k-no',
                        width: 250,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Offstage(),
                    const SizedBox(height: 8.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Museum Konferensi Asia Afrika",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 4.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                          "Jl. Asia Afrika No.65, Braga, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40111",
                          style: TextStyle(
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
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(height: 4.0),
                              Text('4.8',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(height: 2.0),
                              Text('(1.2k)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          const Text('0.5 mil',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wtb_travel/views/login_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawwerScreenState();
}

class _DrawwerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xfff6f0e4),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Leonardo Palmeiro',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            DrawerListTitle(
              iconData: Icons.account_circle_outlined,
              title: "Profile settings",
              onTilePressed: () {},
            ),
            DrawerListTitle(
              iconData: Icons.reviews_outlined,
              title: "My reviews",
              onTilePressed: () {},
            ),
            DrawerListTitle(
              iconData: Icons.logout_outlined,
              title: "Logout",
              onTilePressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(title: 'WTB-Travel'),
                  ),
                );
              },
            ),
          ],
        ));
  }
}

class DrawerListTitle extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTitle(
      {Key? key, this.iconData, this.title, this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      title: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.black,
            size: 20,
          ),
          const SizedBox(width: 20),
          Text(
            title!,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

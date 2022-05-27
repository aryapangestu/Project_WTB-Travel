import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawwerScreenState createState() => _DrawwerScreenState();
}

class _DrawwerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Leonardo Palmeiro',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          'Flutter Developer',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        DrawerListTitle(
          iconData: Icons.account_circle,
          title: "Profile Settings",
          onTilePressed: () {},
        ),
        DrawerListTitle(
          iconData: Icons.group,
          title: "New Secret Group",
          onTilePressed: () {},
        ),
        DrawerListTitle(
          iconData: Icons.group,
          title: "New Channel Chat",
          onTilePressed: () {},
        ),
        DrawerListTitle(
          iconData: Icons.group,
          title: "Contacts",
          onTilePressed: () {},
        ),
        DrawerListTitle(
          iconData: Icons.group,
          title: "Saved Message",
          onTilePressed: () {},
        ),
        DrawerListTitle(
          iconData: Icons.group,
          title: "Calls",
          onTilePressed: () {},
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
      leading: Icon(iconData),
      title: Text(
        title!,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

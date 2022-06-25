import 'package:flutter/material.dart';
import 'package:wtb_travel/controllers/authentication_controller.dart';
import 'package:wtb_travel/controllers/profile_controller.dart';
import 'package:wtb_travel/models/user.dart';
import 'package:wtb_travel/views/full_app_screen.dart';
import 'package:wtb_travel/views/home_screen.dart';
import 'package:wtb_travel/views/login_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key, required this.token, required this.user})
      : super(key: key);

  final String token;
  final profilUser user;

  @override
  State<DrawerScreen> createState() => _DrawwerScreenState();
}

class _DrawwerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xfff6f0e4),
      child: ListView(
        children: widget.token != 'null'
            ? <Widget>[
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    widget.user.name!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                DrawerListTitle(
                  iconData: Icons.account_circle_outlined,
                  title: "Change Username",
                  onTilePressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeUsername(
                          token: widget.token,
                          user: widget.user,
                        ),
                      ),
                    );
                  },
                ),
                DrawerListTitle(
                  iconData: Icons.lock_outlined,
                  title: "Change Password",
                  onTilePressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePassword(
                          token: widget.token,
                          user: widget.user,
                        ),
                      ),
                    );
                  },
                ),
                DrawerListTitle(
                  iconData: Icons.logout_outlined,
                  title: "Logout",
                  onTilePressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LoginPage(title: 'WTB-Travel'), //sementara
                      ),
                    );
                  },
                ),
              ]
            : <Widget>[
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    'Tamu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                DrawerListTitle(
                  iconData: Icons.logout_outlined,
                  title: "Login",
                  onTilePressed: () async {
                    // destroy session
                    await logout(widget.token);

                    // menu login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LoginPage(title: 'WTB-Travel'), //sementara
                      ),
                    );
                  },
                ),
              ],
      ),
    );
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

class ChangeUsername extends StatefulWidget {
  @override
  const ChangeUsername({Key? key, required this.token, required this.user})
      : super(key: key);

  final String token;
  final profilUser user;

  @override
  State<ChangeUsername> createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {
  final _formKey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  var username;

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
              'Change username',
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
                  TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter current username';
                      }
                      username = value;
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Current username',
                      prefixIcon: const Icon(Icons.supervisor_account),
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
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter new username';
                      }
                      username = value;
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'New username',
                      prefixIcon: const Icon(Icons.supervisor_account),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WtbTravelFullAppScreen(
                                title: 'wtb-travel',
                                token: widget.token,
                                user: widget.user,
                              ), // panggil controller changeusername
                            ),
                          );
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
                        onPressed: () {},
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

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key, required this.token, required this.user})
      : super(key: key);

  final String token;
  final profilUser user;

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  var password;

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
              'Change password',
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
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      password = value;
                      return null;
                    },
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff543c0d)),
                      ),
                      hintText: 'Current password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter new password';
                      }
                      password = value;
                      return null;
                    },
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff543c0d)),
                      ),
                      hintText: 'New password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      password = value;
                      return null;
                    },
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff543c0d)),
                      ),
                      hintText: 'Confirm password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WtbTravelFullAppScreen(
                                title: 'wtb-travel',
                                token: widget.token,
                                user: widget.user,
                              ), //panggil change password controller
                            ),
                          );
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
                        onPressed: () {},
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

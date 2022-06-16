import 'package:flutter/material.dart';
import 'package:wtb_travel/controllers/login_controller.dart';
import 'package:wtb_travel/views/full_app_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  // Future<void> loginUsers() async {
  //   if (_formKey.currentState!.validate()) {
  //     //show snackbar to indicate loading
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: const Text('Processing Data'),
  //       backgroundColor: Colors.green.shade300,
  //     ));

  //     //get response from ApiClient
  //     dynamic res = await login(
  //       emailController.text,
  //       passwordController.text,
  //     );
  //     ScaffoldMessenger.of(context).hideCurrentSnackBar();

  //     //if there is no error, get the user's accesstoken and pass it to HomeScreen
  //     if (res['ErrorCode'] == null) {
  //       String accessToken = res['access_token'];
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => HomeScreen(accesstoken: accessToken)));
  //     } else {
  //       //if an error occurs, show snackbar with error message
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text('Error: ${res['Message']}'),
  //         backgroundColor: Colors.red.shade300,
  //       ));
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var username, password;
    return Scaffold(
      backgroundColor: const Color(0xfff6f0e4),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Log In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your username',
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
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      username = value;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff543c0d)),
                      ),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      password = value;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(login(username, password));
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WtbTravelFullAppScreen(
                                title: 'WTB-Travel'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                        primary: const Color(0xff543c0d)),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_shoes/homepage.dart';
import 'package:go_shoes/globals.dart' as globals;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final logoPath = 'assets/logo.png';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _validateEmail = false;
  bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SafeArea(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) /
                      2,
                  color: const Color(0xffff642f),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) /
                      2,
                  color: const Color(0xfff4f4f4),
                ),
              ],
            ),
            Align(
              child: Container(
                margin: const EdgeInsets.only(bottom: 60),
                width: 350,
                height: 460,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xfff6f8f6),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Login to your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      color: Color(0xff393a3a),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              child: Container(
                  margin: const EdgeInsets.only(top: 60),
                  width: 350,
                  height: 460,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(logoPath, height: 170, width: 170),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          controller: emailController,
                          decoration: InputDecoration(
                              errorText: _validateEmail
                                  ? 'Email Field must be filled with correct format'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xfff6f8f6),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Color(0xffff642f),
                              ),
                              hintText: "Email",
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          controller: passwordController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                              errorText: _validatePassword
                                  ? _validatePassword.toString()
                                  : null,
                              filled: true,
                              fillColor: const Color(0xfff6f8f6),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xffff642f),
                              ),
                              hintText: "Password",
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffff642f),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size(320, 45),
                          ),
                          onPressed: () {
                            setState(() {
                              passwordController.text.isEmpty
                                  ? _validatePassword = true
                                  : false;

                              emailController.text.isEmpty
                                  ? _validateEmail = true
                                  : false;

                              !emailController.text.contains('@')
                                  ? _validateEmail = true
                                  : _validateEmail = false;
                              !emailController.text.contains('.com')
                                  ? _validateEmail = true
                                  : _validateEmail = false;

                              if (_validateEmail == false &&
                                  _validatePassword == false) {
                                globals.username = emailController.text
                                    .substring(
                                        0, emailController.text.indexOf('@'));
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage(email: emailController.text);
                                }), (route) => false);
                              }
                            });
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Color(0xffffffff), fontSize: 18),
                          )),
                      const SizedBox(height: 20),
                      const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Color(0xffff642f),
                            decoration: TextDecoration.underline,
                            fontSize: 15),
                      ),
                    ],
                  )),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                title: const Text(''), // You can add title here
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.blue
                    .withOpacity(0.0), //You can make this transparent
                elevation: 0.0, //No shadow
              ),
            ),
          ],
        ))
      ],
    ));
  }
}

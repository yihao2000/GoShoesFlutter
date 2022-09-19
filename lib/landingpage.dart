import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_shoes/loginpage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  final logoPath = 'assets/logo.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff3f1f2),
        body: SafeArea(
            child: Stack(
          children: [
            Image.asset('assets/store.jpg'),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xfff4f4f4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              margin: const EdgeInsets.only(top: 235),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Image.asset(logoPath, height: 200, width: 200),
                  ),
                  const Text(
                    "Welcome to GoShoes",
                    style: TextStyle(
                      fontSize: 33,
                      color: Color(0xff393a3a),
                    ),
                  ),
                  const SizedBox(height: 8, width: double.infinity),
                  const Text(
                    "The #1 Leading Retail Shoes Store",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40, width: double.infinity),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffff642f),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: const Size(320, 40),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginPage();
                        }));
                      },
                      child: const Text(
                        "Login",
                        style:
                            TextStyle(color: Color(0xffffffff), fontSize: 18),
                      )),
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Don't have an account yet?",
                      style: TextStyle(color: Color(0xff393A3A), fontSize: 15),
                    ),
                  ),
                  const Text(
                    "Register Here",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffff642f),
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            )
          ],
        )));
  }
}

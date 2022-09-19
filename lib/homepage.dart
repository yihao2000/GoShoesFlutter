import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_shoes/changethemebutton.dart';
import 'package:go_shoes/itempage.dart';
import 'package:go_shoes/landingpage.dart';
import 'package:go_shoes/loginpage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_shoes/globals.dart' as globals;

class HomePage extends StatefulWidget {
  List<String> imgList = [
    'assets/carouselmain.jpg',
    'assets/carousel1.jpeg',
    'assets/carousel2.jpg'
  ];
  String email;

  final String firstParagraph =
      'Go Shoes founded by Andrew Giovanni - Active Laboratory Assistant who is passionate about shoes, and wanted to help distribute and provide the people with easy and quick shopping experience for those who wanted to level up their fashion game.';

  final String secondParagraph =
      'He broke the record for the most growing shoes store in Indonesia,  and decided to  expand his business not only in traditional brick & mortar store, but also wanted to reach the online customer segmentation in order to continue serve and provide high quality shoes for the online community.';

  final logoPath = 'assets/logo.png';
  final shoesCoverPath = 'assets/shoes2.jpg';

  HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffff642f),
        elevation: 0,
        title: const Text(
          "GoShoes",
        ),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xffff642f),
                ),
                accountName: Text(
                  globals.username,
                  style: const TextStyle(fontSize: 17),
                ),
                accountEmail:
                    Text(widget.email, style: const TextStyle(fontSize: 17)),
                currentAccountPicture: const Icon(
                  Icons.account_circle_rounded,
                  size: 70,
                  color: Colors.white,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Color(0xfff89344),
                ),
                title: const Text("Home"),
                onTap: () => {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.shopping_cart,
                  color: Color(0xfff89344),
                ),
                title: const Text("Products"),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ItemPage(
                      email: widget.email,
                    );
                  }))
                },
              ),
              const Divider(
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app_rounded,
                  color: Color(0xfff89344),
                ),
                title: const Text("Logout"),
                onTap: () => {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const LandingPage();
                  }), (route) => false)
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset(widget.shoesCoverPath,
                    height: 575,
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromRGBO(255, 255, 255, 0.9),
                    colorBlendMode: BlendMode.modulate),
                const SizedBox(
                  width: 290,
                  child: Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Text(
                        "\"Good shoes takes you to good places\"",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontFamily: "Font1"),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  indent: 60,
                  endIndent: 10,
                )
              ],
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 390,
                  color: const Color.fromARGB(228, 12, 21, 22),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 30, top: 20),
                      child: Text(
                        "Origin Story",
                        style: TextStyle(
                          fontFamily: "Font2",
                          fontSize: 30,
                          color: Color(0xfff89344),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 30, top: 10),
                        child: SizedBox(
                          width: 320,
                          child: Text(
                            widget.firstParagraph,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.5,
                                fontFamily: "Font2"),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(right: 30, top: 10),
                        child: SizedBox(
                          width: 320,
                          child: Text(
                            widget.secondParagraph,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.5,
                                fontFamily: "Font2"),
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 500,
                      child: Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffff642f),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              minimumSize: const Size(270, 45),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ItemPage(
                                  email: widget.email,
                                );
                              }));
                            },
                            child: const Text(
                              "View Products",
                              style: TextStyle(
                                  color: Color(0xffffffff), fontSize: 18),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 410,
                  color: const Color.fromARGB(228, 12, 21, 22),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 30, top: 20),
                      child: Text(
                        "Check Us Out",
                        style: TextStyle(
                          fontFamily: "Font2",
                          fontSize: 30,
                          color: Color(0xfff89344),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          viewportFraction: 0.9,
                          enlargeCenterPage: true,
                        ),
                        items: widget.imgList
                            .map((item) => Container(
                                  child: Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0)),
                                        child: Stack(
                                          children: <Widget>[
                                            Image.asset(item,
                                                fit: BoxFit.cover,
                                                width: 1000.0),
                                          ],
                                        )),
                                  ),
                                ))
                            .toList()),
                    const Padding(
                      padding: EdgeInsets.only(left: 30, top: 10),
                      child: Text(
                        "Contact us at: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Font2",
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.web,
                                  size: 15,
                                  color: Color(0xffff642f),
                                ),
                              ),
                            ),
                            TextSpan(
                                text: 'www.goshoesstore.com',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Font2",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.mail,
                                  size: 15,
                                  color: Color(0xffff642f),
                                ),
                              ),
                            ),
                            TextSpan(
                                text: 'goshoesstore@gmail.com',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Font2",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.phone,
                                  size: 15,
                                  color: Color(0xffff642f),
                                ),
                              ),
                            ),
                            TextSpan(
                                text: '+6283921109232',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Font2",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

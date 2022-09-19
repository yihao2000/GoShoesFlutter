import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_shoes/changethemebutton.dart';
import 'package:go_shoes/detailpage.dart';
import 'package:go_shoes/homepage.dart';
import 'package:go_shoes/landingpage.dart';
import 'package:go_shoes/loginpage.dart';
import 'package:go_shoes/post.dart';

class ItemPage extends StatefulWidget {
  String email;
  ItemPage({super.key, required this.email});

  var posts = [
    Post(
        id: 1,
        title: "Air Jordan 1 Rebellionaire",
        image: 'assets/product1-removebg-preview.png',
        description:
            "“Rebellionaire” as a nod to Jordan Brand's way of saying Michael Jordan was a rebel by wearing the “Banned” AJ1s even though the NBA fined him \$5,000 each game. Nike ended up paying the fines as MJ continued to wear the shoes."),
    Post(
        id: 2,
        title: "Air Jordan 1 Newspaper",
        image: 'assets/product2-removebg-preview.png',
        description:
            "The Air Jordan 1 Mid SE \"Newspaper Air Times\" finds another way to honor the great achievements of Michael Jordan through unique sneaker design. Much of the Air Jordan 1 stays classic with the classic design. But this design features the newspaper graphic print that covers the side and toe box of the shoe"),
    Post(
        id: 3,
        title: "Ultraboost 21 Multicolor",
        image: 'assets/product3-removebg-preview.png',
        description:
            "The Adidas Ultraboost 21 is a heavy, firm but cushioned trainer with a durable outsole and smooth ride transitions. It's been revamped from the ground up but the loose heel and relaxed upper limit the Ultraboost 21 to only straight-line running at relaxed paces."),
    Post(
        id: 4,
        title: "Air Force 1 Triple White",
        image: 'assets/product4-removebg-preview.png',
        description:
            "The Nike Air Force 1 07 in triple white has been one of the most popular and best-selling sneakers for a long time. This basic white form's appeal illustrates that a classic design in a delicate white rendition remains unequaled."),
    Post(
        id: 5,
        title: "Yeezy Beluga 350 V2 Reflective",
        image: 'assets/product5-removebg-preview.png',
        description:
            "The Yeezy Beluga 2.0 colorway combines gray, bold orange, and dark gray to create its design. The upper mixes the to gray tones, and there is a gray line across the later side with SPLY-350 lettered inside."),
    Post(
        id: 6,
        title: "Yezzy Zebra 350 V2",
        image: 'assets/product6-removebg-preview.png',
        description:
            "The Yeezy Boost 350 v2 “Zebra” combines hits of both “Core Black” and “Core White,” using the two shades to create a design akin to the striped animal."),
  ];

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xffff642f),
          elevation: 0,
          title: const Text(
            "Our Products",
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
                    widget.email.substring(1, widget.email.indexOf('@')),
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
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage(
                        email: widget.email,
                      );
                    }))
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_cart,
                    color: Color(0xfff89344),
                  ),
                  title: const Text("Products"),
                  onTap: () => {},
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
            child: Stack(children: [
          Container(
            height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/homewallpaper2.jpg"),
                    fit: BoxFit.cover)),
          ),
          Column(children: [
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                "Featured Products",
                style: TextStyle(
                  fontFamily: "Font2",
                  fontSize: 30,
                  color: Color(0xfff89344),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: widget.posts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 10),
                        child: Card(
                            child: ListTile(
                          title: Text(widget.posts[index].title),
                          subtitle: Text(
                            widget.posts[index].description,
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: SizedBox(
                              width: 100,
                              child: OverflowBox(
                                  child: Image(
                                      image:
                                          AssetImage(widget.posts[index].image),
                                      fit: BoxFit.cover))),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailPage(
                                email: widget.email,
                                productId: widget.posts[index].id,
                                productTitle: widget.posts[index].title,
                                productDesc: widget.posts[index].description,
                                productImage: widget.posts[index].image,
                              );
                            }));
                          },
                        )),
                      );
                    }))
          ]),
        ])));
  }
}

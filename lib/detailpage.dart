import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_shoes/changethemebutton.dart';

import 'package:go_shoes/commenttab.dart';
import 'package:go_shoes/infotab.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  String email;
  int productId;
  String productTitle;
  String productDesc;
  String productImage;

  DetailPage(
      {super.key,
      required this.email,
      required this.productId,
      required this.productTitle,
      required this.productDesc,
      required this.productImage});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xffff642f),
            elevation: 0,
            title: const Text(
              "Product Detail",
            ),
            actions: [
              ChangeThemeButtonWidget(),
            ],
          ),
          body: SafeArea(
              child: Column(
            children: [
              TabBar(tabs: [
                Tab(
                  icon: Icon(
                    Icons.info,
                    color: Color(0xfff89344),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.comment,
                    color: Color(0xfff89344),
                  ),
                ),
              ]),
              Expanded(
                  child: TabBarView(
                children: [
                  InfoTab(
                    email: email,
                    productId: productId,
                    productTitle: productTitle,
                    productDesc: productDesc,
                    productImage: productImage,
                  ),
                  CommentTab(postId: this.productId)
                ],
              ))
            ],
          )),
        ));
  }
}

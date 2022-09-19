import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_shoes/comment.dart';

import 'package:provider/provider.dart';
import 'package:go_shoes/globals.dart' as globals;

class InfoTab extends StatelessWidget {
  String email;
  int productId;
  String productTitle;
  String productDesc;
  String productImage;
  InfoTab(
      {super.key,
      required this.email,
      required this.productId,
      required this.productTitle,
      required this.productDesc,
      required this.productImage});

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(50),
            child: Image.asset(productImage),
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffff642f),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 320,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 10),
                  child: Text(
                    productTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Font1",
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Text(
                    productDesc,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Font2", fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
                  child: Text(
                    "Add a comment for this product: ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Font1", fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: commentController,
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      // controller: emailController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Color(0xfff89344),
                            ),
                            onPressed: () {
                              if (commentController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Comments cannot be empty !")));
                              } else {
                                globals.commentList.add(Comment(
                                    postId: productId,
                                    userName: globals.username,
                                    userComment: commentController.text));

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Success"),
                                        content: const Text(
                                            "Your comment has been successfully added!"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Ok"))
                                        ],
                                      );
                                    });
                              }
                            },
                          ),
                          contentPadding:
                              EdgeInsets.only(bottom: 30 / 2, left: 10),
                          filled: true,
                          fillColor: const Color(0xfff6f8f6),
                          hintText: "Comment... (Cannot be empty)",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

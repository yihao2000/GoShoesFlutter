import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_shoes/globals.dart' as globals;

class CommentTab extends StatefulWidget {
  int postId;
  CommentTab({super.key, required this.postId});

  @override
  State<CommentTab> createState() => _CommentTabState();
}

class _CommentTabState extends State<CommentTab> {
  @override
  Widget build(BuildContext context) {
    if (!globals.commentList
        .any((element) => element.postId == widget.postId)) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          "There is no comment for this product yet!",
          style: TextStyle(
              fontFamily: "Font1", fontSize: 15, color: Color(0xffff642f)),
        ),
      );
    } else {
      return Expanded(
          child: ListView.builder(
              itemCount: globals.commentList.length,
              itemBuilder: (context, index) {
                if (globals.commentList[index].postId == widget.postId) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Card(
                        child: ListTile(
                      title: Text(globals.commentList[index].userName),
                      subtitle: Text(
                        globals.commentList[index].userComment,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person_rounded,
                            color: Color(0xffff642f),
                          ),
                        ],
                      ),
                    )),
                  );
                } else {
                  return Container();
                }
              }));
    }
  }
}

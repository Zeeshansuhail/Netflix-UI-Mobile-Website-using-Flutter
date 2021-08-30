import 'package:flutter/material.dart';
import 'package:netflix/model/content.dart';

class Contentlist extends StatelessWidget {
  final String title;
  final List<Content> contentlist;
  final bool myoriginals;
  const Contentlist(
      {Key key,
      @required this.title,
      @required this.contentlist,
      this.myoriginals = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            height: myoriginals ? 500.0 : 220.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contentlist.length,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print(contentlist[index].name);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      height: myoriginals ? 400.0 : 200,
                      width: myoriginals ? 200.0 : 130.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(contentlist[index].imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                })),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:netflix/model/content.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentlist;
  const Previews({Key key, @required this.title, @required this.contentlist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            height: 165,
            child: ListView.builder(
              itemCount: contentlist.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    print(contentlist[index].name);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(contentlist[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: contentlist[index].color, width: 4.0)),
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black87,
                                Colors.black45,
                                Colors.transparent,
                              ],
                              stops: [0, 0.25, 1],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: contentlist[index].color, width: 4.0)),
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Image.asset(
                                  contentlist[index].titleImageUrl)))
                    ],
                  ),
                );
              },
            ))
      ],
    );
  }
}

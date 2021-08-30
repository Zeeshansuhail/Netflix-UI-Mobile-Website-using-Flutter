import 'package:flutter/material.dart';
import 'package:netflix/assets.dart';
import 'package:netflix/widgets/responsive.dart';

class CustomAppbar extends StatelessWidget {
  final double scrolloffset;
  const CustomAppbar({Key key, this.scrolloffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color:
          Colors.black.withOpacity((scrolloffset / 350).clamp(0, 1).toDouble()),
      child: Resposive(
        Mobile: CustomAppbarmobile(),
        Desktop: CustomAppbardesktop(),
      ),
    );
  }
}

class CustomAppbarmobile extends StatelessWidget {
  const CustomAppbarmobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Appbutton(Title: "TV Shows", onTap: () => "Tv shows"),
                Appbutton(Title: "Movies", onTap: () => "Movies"),
                Appbutton(
                  Title: "My List",
                  onTap: () => print("Mylist"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppbardesktop extends StatelessWidget {
  const CustomAppbardesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Appbutton(
                  Title: "Home",
                  onTap: () => print('Home'),
                ),
                Appbutton(Title: "TV Shows", onTap: () => print('Tv Shows')),
                Appbutton(Title: "Movies", onTap: () => print('Movies')),
                Appbutton(Title: "Latest", onTap: () => print('Tv shows')),
                Appbutton(
                  Title: "My List",
                  onTap: () => print('Mylist'),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.search),
                  onPressed: () => print('search'),
                  iconSize: 28.0,
                  color: Colors.white,
                ),
                Appbutton(Title: "Kids", onTap: () => print('Kids')),
                Appbutton(Title: "DVD", onTap: () => print('DVD')),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.card_giftcard),
                  onPressed: () => print('card'),
                  iconSize: 28.0,
                  color: Colors.white,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.notifications),
                  onPressed: () => print('Notification'),
                  iconSize: 28.0,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Appbutton extends StatelessWidget {
  final String Title;
  final Function onTap;
  const Appbutton({Key key, @required this.Title, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap,
        child: Text(
          Title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ));
  }
}

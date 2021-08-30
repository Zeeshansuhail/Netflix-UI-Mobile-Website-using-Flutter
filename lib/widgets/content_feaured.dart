import 'package:flutter/material.dart';
import 'package:netflix/data/content_data.dart';
import 'package:netflix/model/content.dart';
import 'package:netflix/widgets/responsive.dart';
import 'package:video_player/video_player.dart';

class Content_featured extends StatelessWidget {
  final Content featuredContent;
  const Content_featured({Key key, @required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Resposive(
        Mobile: Resposivemobile(featuredContent: featuredContent),
        Desktop: Resposivedesktop(featuredContent: featuredContent));
  }
}

class Resposivemobile extends StatelessWidget {
  final Content featuredContent;
  const Resposivemobile({Key key, this.featuredContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 480.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(sintelContent.imageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 480,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(sintelContent.titleImageUrl),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
              onTap: () {
                print("Add");
              },
              child: Column(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Text(
                    "List",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            FlatButton.icon(
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
                onPressed: () {},
                color: Colors.white,
                icon: Icon(Icons.play_arrow),
                label: Text(
                  "Play",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                )),
            GestureDetector(
              onTap: () {
                print("Info");
              },
              child: Column(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  Text(
                    "Info",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class Resposivedesktop extends StatefulWidget {
  final Content featuredContent;
  const Resposivedesktop({Key key, this.featuredContent}) : super(key: key);

  @override
  _ResposivedesktopState createState() => _ResposivedesktopState();
}

class _ResposivedesktopState extends State<Resposivedesktop> {
  VideoPlayerController videocontroller;
  bool ismuted = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videocontroller =
        VideoPlayerController.network(widget.featuredContent.videoUrl)
          ..initialize().then((_) => setState(() {}))
          ..setVolume(0)
          ..play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videocontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => videocontroller.value.isPlaying
          ? videocontroller.pause()
          : videocontroller.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: videocontroller.value.isInitialized
                ? videocontroller.value.aspectRatio
                : 2.344,
            child: videocontroller.value.isInitialized
                ? VideoPlayer(videocontroller)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1.0,
            child: AspectRatio(
              aspectRatio: videocontroller.value.isInitialized
                  ? videocontroller.value.aspectRatio
                  : 2.344,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )),
              ),
            ),
          ),
          Positioned(
              left: 60.0,
              right: 60.0,
              bottom: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250.0,
                    child: Image.asset(widget.featuredContent.titleImageUrl),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    widget.featuredContent.description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2.0, 4.0),
                            blurRadius: 6.0,
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 28.0,
                  ),
                  Row(
                    children: [
                      FlatButton.icon(
                          padding: EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
                          onPressed: () => print("play"),
                          color: Colors.white,
                          icon: Icon(Icons.play_arrow),
                          label: Text(
                            "Play",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0),
                          )),
                      SizedBox(
                        width: 15.0,
                      ),
                      FlatButton.icon(
                          // padding: EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
                          onPressed: () => print("INFO"),
                          color: Colors.white,
                          icon: Icon(Icons.info_outline),
                          label: Text(
                            "More Info",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0),
                          )),
                      const SizedBox(
                        width: 20.0,
                      ),
                      if (videocontroller.value.isInitialized)
                        IconButton(
                            icon: Icon(
                                ismuted ? Icons.volume_off : Icons.volume_up),
                            iconSize: 30.0,
                            color: Colors.white,
                            onPressed: () => setState(() {
                                  ismuted
                                      ? videocontroller.setVolume(100)
                                      : videocontroller.setVolume(0);
                                  ismuted = videocontroller.value.volume == 0;
                                }))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}

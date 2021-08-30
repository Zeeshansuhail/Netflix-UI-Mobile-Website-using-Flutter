import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/data/content_data.dart';
import 'package:netflix/widgets/Previews.dart';
import 'package:netflix/widgets/content_feaured.dart';
import 'package:netflix/widgets/contentlist.dart';
import 'package:netflix/widgets/customappbar.dart';
import 'package:netflix/cubit/cuibit_cubit.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        context.bloc<CuibitCubit>().setoffset(_controller.offset);
      });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white24,
        child: IconButton(
          icon: Icon(
            Icons.cast,
            color: Colors.white,
          ),
          onPressed: () {
            print("cast");
          },
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50.0),
        child: BlocBuilder<CuibitCubit, double>(
          builder: (context, Scrolloffset) {
            return CustomAppbar(
              scrolloffset: Scrolloffset,
            );
          },
        ),
      ),
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverToBoxAdapter(
            child: Content_featured(
              featuredContent: sintelContent,
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
              child: Previews(
                  title: "Previews",
                  key: PageStorageKey('previews'),
                  contentlist: previews)),
          SliverToBoxAdapter(
            child: Contentlist(
                title: "My List",
                key: PageStorageKey('myList'),
                contentlist: myList),
          ),
          SliverToBoxAdapter(
            child: Contentlist(
              key: PageStorageKey('originals'),
              title: "Netflix Originals",
              contentlist: originals,
              myoriginals: true,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: Contentlist(
                  title: "Trending",
                  key: PageStorageKey('trending'),
                  contentlist: trending),
            ),
          ),
        ],
      ),
    );
  }
}

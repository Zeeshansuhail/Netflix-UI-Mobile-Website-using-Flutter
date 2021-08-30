import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/cubit/cuibit_cubit.dart';
import 'package:netflix/screen/homescreen.dart';
import 'package:netflix/widgets/responsive.dart';

class Nav_menu extends StatefulWidget {
  @override
  _Nav_menuState createState() => _Nav_menuState();
}

class _Nav_menuState extends State<Nav_menu> {
  final List<Widget> navmenu = [
    Homescreen(
      key: PageStorageKey('homescreen'),
    ),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> nav_item = const {
    "Home": Icons.home,
    "Search": Icons.search,
    "Coming Soon": Icons.queue_play_next,
    "Downloads": Icons.file_download,
    "More": Icons.menu
  };

  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<CuibitCubit>(
        create: (_) => CuibitCubit(),
        child: navmenu[_currentindex],
      ),
      bottomNavigationBar: !Resposive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              items: nav_item
                  .map(
                    (title, icon) => MapEntry(
                        title,
                        BottomNavigationBarItem(
                          icon: Icon(
                            icon,
                            size: 30,
                          ),
                          title: Text(title),
                        )),
                  )
                  .values
                  .toList(),
              currentIndex: _currentindex,
              selectedFontSize: 11.0,
              selectedItemColor: Colors.white,
              unselectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              onTap: (index) => setState(() => _currentindex = index))
          : null,
    );
  }
}

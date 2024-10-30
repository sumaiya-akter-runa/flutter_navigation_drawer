import 'package:flutter/material.dart';
import 'package:flutter_navigation_drawer/fragment/archive_fragment.dart';
import 'package:flutter_navigation_drawer/fragment/calender_fragment.dart';
import 'package:flutter_navigation_drawer/fragments/about_fragment.dart';
import 'package:flutter_navigation_drawer/fragments/contact_fragment.dart';

import '../fragment/about_fragment.dart';
import '../fragment/contact_fragment.dart';
import '../fragment/profile_fragment.dart';
import '../fragment/profile_fragment.dart';
import 'fragment/chat.dart';
import 'fragment/settings.dart';
import 'fragment/star.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    DrawerItem("Profile", Icons.person),
    DrawerItem("About", Icons.account_box_outlined),
    DrawerItem("Contact", Icons.call),
    DrawerItem("Chat", Icons.chat_bubble),
    DrawerItem("Starred", Icons.star_rate_sharp),
    DrawerItem("Calender", Icons.calendar_view_day),
    DrawerItem("Archive", Icons.archive_sharp),
    DrawerItem("Settings", Icons.settings)
  ];

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return ProfileFragment();
      case 1:
        return AboutFragment();
      case 2:
        return ContactFragment();
      case 3:
        return Chat();
      case 4:
        return Star();
      case 5:
        return ClenderFragment();
      case 6:
        return ArchiveFragment();
      case 7:
        return Settings();


      default:
        return Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(

        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.drawerItems[_selectedDrawerIndex].title,
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF800080), // Purple
                Color(0xFFFF0000), // Red
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      drawer: Drawer(

        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF800080), // Purple
                    Color(0xFFFF0000), // Red
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),


              accountName: Text("Sumaiya Akter Runa"),
              accountEmail: Text("sumaiyaakterruna@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Icon(
                    Icons.person_rounded,
                    size: 60,
                  ),
                ),
              ),
            ),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
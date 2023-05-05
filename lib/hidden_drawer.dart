import 'package:flutter/material.dart';
import 'package:flutter_project/page/home_page.dart';
import 'package:flutter_project/page/setting_page.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget{
  const HiddenDrawer({Key? key}):super(key: key);
  @override
  State<HiddenDrawer> createState()=>_HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer>{
  List<ScreenHiddenDrawer>_pages= [];

  final unSelectStyle = TextStyle(color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18);
  final selectedStyle = TextStyle(color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Home Page',
          baseStyle: selectedStyle,
          selectedStyle:selectedStyle,
          colorLineSelected: Colors.deepPurple,

        ),
        HomePage(),
      ),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Setting page',
            baseStyle: selectedStyle,
            selectedStyle: selectedStyle,
            colorLineSelected: Colors.deepPurple,
          ),
          SettingPage(),
      )
    ];

  }
  @override
  Widget build(BuildContext context){


    return

      HiddenDrawerMenu(
      backgroundColorMenu: Colors.deepPurple.shade200,
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 60,
    );

  }
}
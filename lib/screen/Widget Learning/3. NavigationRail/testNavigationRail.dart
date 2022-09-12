import 'package:flutter/material.dart';

class TestNavigationRail extends StatefulWidget {
  const TestNavigationRail({Key? key}) : super(key: key);

  @override
  State<TestNavigationRail> createState() => _TestNavigationRailState();
}

class _TestNavigationRailState extends State<TestNavigationRail> {
  int _selectedIndex = 0;
  double railWidth = 80;
  changeDestination(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            minWidth: railWidth,
            leading: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Icon(Icons.arrow_back_ios),
            ),
            groupAlignment: 1,
            elevation: 10,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.house_outlined),
                selectedIcon: Icon(Icons.house),
                label: Text('Page1'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.house_outlined),
                selectedIcon: Icon(Icons.house),
                label: Text('Page2'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.house_outlined),
                selectedIcon: Icon(Icons.house),
                label: Text('Page3'),
              ),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: changeDestination,
            labelType: NavigationRailLabelType.selected,
            useIndicator: true,
            indicatorColor: Color.fromARGB(255, 80, 94, 255),
            selectedIconTheme: IconThemeData(color: Colors.white),
            selectedLabelTextStyle: TextStyle(
              color: Color.fromARGB(255, 80, 94, 255),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - railWidth,
            child: Center(
              child: Text(
                _selectedIndex.toString(),
                textScaleFactor: 6.0,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

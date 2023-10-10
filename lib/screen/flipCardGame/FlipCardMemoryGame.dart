import 'package:flutter/material.dart';
import 'package:practice_ui/helper/config/themes/app_text_style.dart';

import 'flipcardgame.dart';
import 'data.dart';

class FlipCardGameHOme extends StatefulWidget {
  const FlipCardGameHOme({Key? key}) : super(key: key);

  @override
  State<FlipCardGameHOme> createState() => _FlipCardGameHOmeState();
}

class _FlipCardGameHOmeState extends State<FlipCardGameHOme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          icon: BackButton(
            color: Colors.black,
          ),
        ),
        title: Text(
          "FlipCard Game",
          style: AppTextStyle.header1(),
        ),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => _list[index].goto,
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _list[index].secondarycolor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _list[index].primarycolor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black38,
                            spreadRadius: 1,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          _list[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 4,
                                color: Colors.black38,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Detail {
  String name;
  Color primarycolor;
  Color secondarycolor;
  Widget goto;
  Detail({
    required this.name,
    required this.primarycolor,
    required this.secondarycolor,
    required this.goto,
  });
}

List<Detail> _list = [
  Detail(
    name: "EASY",
    primarycolor: Colors.black.withOpacity(0.4),
    secondarycolor: Colors.black.withOpacity(0.4),
    goto: FlipCardGame(level: Level.Easy),
  ),
  Detail(
    name: "MEDIUM",
    primarycolor: Colors.black.withOpacity(0.4),
    secondarycolor: Colors.black.withOpacity(0.4),
    goto: FlipCardGame(level: Level.Medium),
  ),
  Detail(
    name: "HARD",
    primarycolor: Colors.black.withOpacity(0.4),
    secondarycolor: Colors.black.withOpacity(0.4),
    goto: FlipCardGame(level: Level.Hard),
  ),
];

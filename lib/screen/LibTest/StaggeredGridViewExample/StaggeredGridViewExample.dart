import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridViewExample extends StatefulWidget {
  const StaggeredGridViewExample({Key? key}) : super(key: key);

  @override
  State<StaggeredGridViewExample> createState() =>
      _StaggeredGridViewExampleState();
}

class _StaggeredGridViewExampleState extends State<StaggeredGridViewExample> {
  List<String> images = [
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
    'assets/images/background-5.jpeg',
    'assets/images/background-7.jpeg',
    'assets/images/background-8.png',
    'assets/images/background-9-2.png',
    'assets/images/background-9.png',
    'assets/images/background-10.jpg',
  ];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: images.length * 500),
          curve: Curves.linear);
    });

    super.initState();
  }

  static const pattern = [
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 2),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: SizedBox(
                width: size.width,
                height: size.height * 3,
                child: GridView.custom(
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: pattern,
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final tile = pattern[index % pattern.length];
                      return Container(
                        width: tile.crossAxisCount * 100,
                        height: tile.mainAxisCount * 100,
                        color: Colors.black,
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(1),
                      ]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.network(
                      'https://img.icons8.com/material/2x/unsplash--v2.png',
                      color: Colors.white,
                    ),
                    Text(
                      "Unsplash",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

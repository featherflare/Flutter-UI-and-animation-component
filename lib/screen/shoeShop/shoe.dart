import 'package:flutter/material.dart';
import 'package:practice_ui/screen/shoeShop/fadeAnimation.dart';

class Shoes extends StatefulWidget {
  final String image;
  final String tag;

  const Shoes({Key? key, required this.image, required this.tag})
      : super(key: key);

  @override
  State<Shoes> createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> {
  int _choiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Hero(
        tag: widget.tag,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(189, 189, 189, 1),
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite_border,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: FadeAnimation(
                  1,
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.9),
                          Colors.black.withOpacity(.0),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FadeAnimation(
                          1.3,
                          Text(
                            "Sneakers",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        FadeAnimation(
                          1.4,
                          Text(
                            "Size",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            FadeAnimation(
                              1.5,
                              chip(text: "40", index: 0),
                            ),
                            FadeAnimation(
                              1.45,
                              chip(text: "42", index: 1),
                            ),
                            FadeAnimation(
                              1.46,
                              chip(text: "44", index: 2),
                            ),
                            FadeAnimation(
                              1.47,
                              chip(text: "46", index: 3),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        FadeAnimation(
                          1.5,
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget chip({text, index}) {
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: ChoiceChip(
          label: Text(text),
          selected: _choiceIndex == index,
          selectedColor: Colors.white,
          onSelected: (selected) => setState(
            () {
              _choiceIndex = selected ? index : 0;
            },
          ),
          backgroundColor: Colors.transparent,
          labelStyle: _choiceIndex == index
              ? TextStyle(fontSize: 16)
              : TextStyle(fontSize: 16, color: Colors.white),
          labelPadding: _choiceIndex == index
              ? EdgeInsets.symmetric(horizontal: 5, vertical: 5)
              : EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

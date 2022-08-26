import 'package:flutter/material.dart';
import 'package:practice_ui/screen/shoeShop/fadeAnimation.dart';
import 'package:practice_ui/screen/shoeShop/shoe.dart';

class ShoeShop extends StatefulWidget {
  const ShoeShop({Key? key}) : super(key: key);

  @override
  State<ShoeShop> createState() => _ShoeShopState();
}

class _ShoeShopState extends State<ShoeShop> {
  int _choiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Shoes",
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    chip(text: "All", index: 0),
                  ),
                  FadeAnimation(
                    1.1,
                    chip(text: "Sneakers", index: 1),
                  ),
                  FadeAnimation(
                    1.2,
                    chip(text: "Football", index: 2),
                  ),
                  FadeAnimation(
                    1.3,
                    chip(text: "Soccer", index: 3),
                  ),
                  FadeAnimation(
                    1.4,
                    chip(text: "Golf", index: 4),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FadeAnimation(
              1.5,
              makeItem(
                  image: 'assets/images/one-7.jpeg',
                  tag: 'red',
                  context: context),
            ),
            FadeAnimation(
              1.6,
              makeItem(
                  image: 'assets/images/two-7.jpeg',
                  tag: 'blue',
                  context: context),
            ),
            FadeAnimation(
              1.7,
              makeItem(
                  image: 'assets/images/three-7.jpeg',
                  tag: 'white',
                  context: context),
            ),
          ],
        ),
      ),
    );
  }

  Widget chip({text, index}) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(text),
        selected: _choiceIndex == index,
        selectedColor: Colors.grey[200],
        onSelected: (selected) => setState(
          () {
            _choiceIndex = selected ? index : 0;
          },
        ),
        backgroundColor: Colors.white,
        labelStyle: _choiceIndex == index
            ? TextStyle(fontSize: 20)
            : TextStyle(fontSize: 17),
        labelPadding: _choiceIndex == index
            ? EdgeInsets.symmetric(horizontal: 20, vertical: 5)
            : EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        shadowColor: Colors.transparent,
      ),
    );
  }

  Widget makeItem({image, tag, context}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Shoes(
                image: image,
                tag: tag,
              ),
            ),
          );
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(189, 189, 189, 1),
                blurRadius: 10,
                offset: Offset(0, 10),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(
                          1,
                          Text(
                            "Sneakers",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                          1.1,
                          Text(
                            "Nike",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FadeAnimation(
                    1.2,
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
                    ),
                  )
                ],
              ),
              FadeAnimation(
                1.2,
                Text(
                  "100\$",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

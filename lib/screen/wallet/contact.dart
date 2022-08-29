import 'package:align_positioned/align_positioned.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_ui/screen/wallet/sendMoney.dart';

import '../../helper/fadeAnimation.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final List<dynamic> _contacts = [
    {
      'name': 'John',
      'avatar': 'assets/images/avatar-1.png',
    },
    {
      'name': 'Samantha',
      'avatar': 'assets/images/avatar-2.png',
    },
    {
      'name': 'Mary',
      'avatar': 'assets/images/avatar-3.png',
    },
    {
      'name': 'Julian',
      'avatar': 'assets/images/avatar-4.png',
    },
    {
      'name': 'Sara',
      'avatar': 'assets/images/avatar-5.png',
    },
    {
      'name': 'Kabir Singh',
      'avatar': 'assets/images/avatar-6.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Contacts",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: FadeAnimation(
            delay: 0,
            duration: 500,
            child: Container(
              height: 40,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: "Search contacts",
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            FadeAnimation(
              duration: 500,
              child: Container(
                width: double.infinity,
                height: 300,
                padding: const EdgeInsets.all(90.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200, width: 1.0),
                ),
                child: Stack(
                  children: [
                    for (double i = 0; i < 360; i += 60)
                      AnimChain(
                        initialDelay: Duration(milliseconds: i.toInt()),
                      )
                          .next(
                            wait: const Duration(milliseconds: 1000),
                            widget: AnimatedAlignPositioned(
                              dx: 0,
                              dy: 150,
                              duration: const Duration(seconds: 1),
                              rotateDegrees: 0 - 3.5,
                              touch: Touch.middle,
                              child: user(0, i),
                            ),
                          )
                          .next(
                            wait: const Duration(seconds: 2),
                            widget: AnimatedAlignPositioned(
                              dx: i / 360,
                              dy: 150,
                              duration: const Duration(seconds: 1),
                              rotateDegrees: i - 3.5,
                              touch: Touch.middle,
                              child: user(0, i),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            FadeAnimation(
              duration: 500,
              fadeVertical: false,
              begin: 100,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, bottom: 15.0, top: 10.0),
                child: Text(
                  'Most Recent',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              height: 90,
              padding: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return FadeAnimation(
                    duration: (index * 200) + 500,
                    fadeVertical: false,
                    begin: 100,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SendMoney(
                              name: _contacts[index]['name'],
                              avatar: _contacts[index]['avatar'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blueGrey[100],
                              backgroundImage:
                                  AssetImage(_contacts[index]['avatar']),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              _contacts[index]['name'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FadeAnimation(
              duration: 500,
              fadeVertical: false,
              begin: 100,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, bottom: 15.0, top: 10.0),
                child: Text(
                  'All Contacts',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              padding: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return FadeAnimation(
                    duration: (index * 200) + 500,
                    fadeVertical: false,
                    begin: 100,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.red[100],
                                backgroundImage:
                                    AssetImage(_contacts[index]['avatar']),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                _contacts[index]['name'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 15,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget user(int index, double number) {
    index = number ~/ 60;
    return FadeAnimation(
      delay: 2,
      duration: (index * 100) + 500,
      fadeVertical: false,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SendMoney(
                name: _contacts[index]['name'],
                avatar: _contacts[index]['avatar'],
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: number / 60 * 5.2,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green.shade100,
                  backgroundImage: AssetImage(_contacts[index]['avatar']),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container circle(Color color, [double diameter = 50.0]) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

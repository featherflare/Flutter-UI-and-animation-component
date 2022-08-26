import 'dart:math' as math;

import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  String headerText;
  String headerList;

  List<int> listItem;
  ListAnimation(
      {Key? key,
      required this.listItem,
      this.headerText = "Selected item",
      this.headerList = ""})
      : super(key: key);

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation> {
  List<int> _list = [];
  List<int> _selected = [];
  List<int> _foundedItem = [];

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> selectedListKey =
      GlobalKey<AnimatedListState>();

  @override
  void initState() {
    _list = widget.listItem;
    super.initState();
    setState(() {
      _foundedItem = _list;
    });
  }

  onSearch(search) {
    setState(() {
      _foundedItem =
          _list.where((item) => item.toString().contains(search)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30.0),
      color: Colors.white,
      width: double.infinity,
      height: 600,
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(widget.headerText),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: AnimatedList(
                  key: selectedListKey,
                  scrollDirection: Axis.horizontal,
                  initialItemCount: _selected.length,
                  itemBuilder: (context, index, animation) {
                    return selectedComponent(
                        _selected[index], index, animation);
                  },
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade500,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
              hintText: "Search Users",
            ),
          ),
          widget.headerList != ""
              ? const SizedBox(
                  height: 30,
                )
              : const SizedBox(),
          widget.headerList != ""
              ? Text(
                  widget.headerList,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                )
              : const SizedBox(),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: _foundedItem.length > 0
                ? AnimatedList(
                    key: listKey,
                    initialItemCount: _foundedItem.length,
                    itemBuilder: (context, index, animation) {
                      return itemList(_foundedItem[index], index, animation);
                    },
                  )
                : Center(
                    child: Text("No Item"),
                  ),
          ),
        ],
      ),
    );
  }

  Widget selectedComponent(int select, index, animation) {
    return FadeTransition(
      opacity: animation,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: Color(
                  (math.Random().nextDouble() * 0xFFFFFF).toInt(),
                ).withOpacity(1.0),
                child: Center(
                  child: Text(
                    select.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 15,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedListKey.currentState?.removeItem(
                    index,
                    (context, animation) => itemList(select, index, animation),
                    duration: const Duration(milliseconds: 300),
                  );

                  listKey.currentState?.insertItem(
                    _foundedItem.length,
                    duration: const Duration(milliseconds: 500),
                  );

                  _selected.remove(select);
                  _foundedItem.add(select);
                });
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: const Center(
                  child: Icon(
                    Icons.close,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemList(int item, index, animation) {
    return GestureDetector(
      onTap: () {
        setState(() {
          listKey.currentState?.removeItem(
            index,
            (context, animation) => itemList(item, index, animation),
            duration: const Duration(milliseconds: 300),
          );

          selectedListKey.currentState?.insertItem(
            _selected.length,
            duration: const Duration(milliseconds: 500),
          );

          _selected.add(item);
          _foundedItem.remove(item);
        });
      },
      child: FadeTransition(
        opacity: animation,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Color(
                          (math.Random().nextDouble() * 0xFFFFFF).toInt(),
                        ).withOpacity(1.0),
                        child: Center(
                          child: Text(
                            item.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Number: $item",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "asdasdasdasd",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TestAutoComplete extends StatefulWidget {
  const TestAutoComplete({Key? key}) : super(key: key);

  @override
  State<TestAutoComplete> createState() => _TestAutoCompleteState();
}

class _TestAutoCompleteState extends State<TestAutoComplete> {
  static final List<Obj> myObject = <Obj>[
    Obj(obj1: 'Alice', obj2: 'alice@example.com'),
    Obj(obj1: 'Bob', obj2: 'bob@example.com'),
    Obj(obj1: 'Charlie', obj2: 'charlie123@gmail.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Autocomplete<Obj>(
              optionsBuilder: (textEditingValue) {
                return myObject.where(
                  (obj) => obj.obj1.contains(
                    textEditingValue.text,
                  ),
                );
              },
              displayStringForOption: (myCustomsType) => myCustomsType.obj1,
              // optionsViewBuilder: (context, onSelected, options) =>
              //     ListView.builder(
              //   itemCount: myObject.length,
              //   itemBuilder: (context, index) {
              //     return Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: GestureDetector(
              //         onTap: () {
              //           myObject.where(
              //             (obj) => obj.obj1.contains(),
              //           );
              //         },
              //         child: Text(
              //           myObject[index].obj1.toString(),
              //           style: TextStyle(fontSize: 20, color: Colors.black),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              onSelected: (Obj obj) {
                debugPrint('You just selected ${(obj)}');
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) =>
                  TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Obj {
  final obj1;
  final obj2;
  Obj({
    required this.obj1,
    required this.obj2,
  });
}

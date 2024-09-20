import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestReorderableListView extends StatefulWidget {
  const TestReorderableListView({Key? key}) : super(key: key);

  @override
  State<TestReorderableListView> createState() =>
      _TestReorderableListViewState();
}

class _TestReorderableListViewState extends State<TestReorderableListView> {
  final List<int> _items = List<int>.generate(50, (int index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        children: [
          for (int index = 0; index < _items.length; index++)
            ListTile(
              key: Key('$index'),
              tileColor: _items[index].isOdd
                  ? Colors.blue.withOpacity((index + 1) * 0.02)
                  : Colors.green.withOpacity((index) * 0.02),
              title: Text('Item ${_items[index]}'),
              trailing: Container(
                padding: EdgeInsets.all(16),
                child: const Icon(Icons.drag_handle),
              ),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}

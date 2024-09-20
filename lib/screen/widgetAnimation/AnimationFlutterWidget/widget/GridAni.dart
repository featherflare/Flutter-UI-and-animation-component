import 'package:flutter/material.dart';
import 'package:practice_ui/helper/config/themes/app_text_style.dart';

class GrdiAni extends StatefulWidget {
  final double value;
  const GrdiAni({super.key, required this.value});

  @override
  State<GrdiAni> createState() => _GrdiAniState();
}

class _GrdiAniState extends State<GrdiAni> {
  final GlobalKey<AnimatedGridState> _gridKey = GlobalKey<AnimatedGridState>();
  final GlobalKey<AnimatedGridState> _listKey = GlobalKey<AnimatedGridState>();
  late ListModel<int> _list;
  late ListModel<int> _list2;
  int? _selectedItem;
  late int
      _nextItem; // The next item inserted when the user presses the '+' button.

  @override
  void initState() {
    super.initState();
    _list = ListModel<int>(
      listKey: _gridKey,
      initialItems: <int>[0, 1, 2, 3, 4, 5],
      removedItemBuilder: _buildRemovedItem,
    );
    _list2 = ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2, 3, 4, 5],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 6;
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: item,
      removing: true,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  // Insert the "next item" into the list model.
  void _insert() {
    final int index =
        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem!);
    setState(() {
      _list.insert(index, _nextItem++);
      _list2.insert(index, _nextItem++);
    });
  }

  // Remove the selected item from the list model.
  void _remove() {
    if (_selectedItem != null) {
      setState(() {
        _list.removeAt(_list.indexOf(_selectedItem!));
        _list2.removeAt(_list.indexOf(_selectedItem!));
        _selectedItem = null;
      });
    } else if (_list.length > 0) {
      setState(() {
        _list.removeAt(_list.length - 1);
        _list2.removeAt(_list.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle),
                iconSize: 32,
                onPressed: (_list.length > 0) ? _remove : null,
                tooltip: 'remove the selected item',
              ),
              const Text(
                'AnimatedGrid',
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle),
                iconSize: 32,
                onPressed: _insert,
                tooltip: 'insert a new item',
              ),
            ],
          ),
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedGrid(
                key: _gridKey,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                initialItemCount: _list.length,
                itemBuilder: _buildItem,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _list.length,
                itemBuilder: _buildItem,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

typedef RemovedItemBuilder<T> = Widget Function(
    T item, BuildContext context, Animation<double> animation);

class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<E>? initialItems,
  }) : _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedGridState> listKey;
  final RemovedItemBuilder<E> removedItemBuilder;
  final List<E> _items;

  AnimatedGridState? get _animatedGrid => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedGrid!.insertItem(
      index,
      duration: const Duration(milliseconds: 500),
    );
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedGrid!.removeItem(
        index,
        (BuildContext context, Animation<double> animation) {
          return removedItemBuilder(removedItem, context, animation);
        },
      );
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    this.onTap,
    this.selected = false,
    this.removing = false,
    required this.animation,
    required this.item,
  }) : assert(item >= 0);

  final Animation<double> animation;
  final VoidCallback? onTap;
  final int item;
  final bool selected;
  final bool removing;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headlineMedium!;
    if (selected) {
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: FadeTransition(
        opacity: CurvedAnimation(
            parent: animation,
            curve: removing ? Curves.easeInOut : Curves.bounceOut),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(
            height: 80.0,
            child: Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: Center(
                child: Text('${item + 1}', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

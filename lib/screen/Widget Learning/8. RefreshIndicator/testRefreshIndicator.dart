import 'package:flutter/material.dart';

class TestRefreshIndicator extends StatefulWidget {
  const TestRefreshIndicator({Key? key}) : super(key: key);

  @override
  State<TestRefreshIndicator> createState() => _TestRefreshIndicatorState();
}

class _TestRefreshIndicatorState extends State<TestRefreshIndicator> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator Sample'),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        displacement: 300, // margin top
        edgeOffset: 20,
        strokeWidth: 4,
        color: Colors.white,
        backgroundColor: Colors.blue,
        child: Scrollbar(
          child: ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
        ),
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show refresh indicator programmatically on button tap.
          _refreshIndicatorKey.currentState?.show();
        },
        icon: const Icon(Icons.refresh),
        label: const Text('Show Indicator'),
      ),
    );
  }
}

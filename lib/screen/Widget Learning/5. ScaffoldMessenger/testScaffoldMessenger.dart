import 'package:flutter/material.dart';

class TestScaffoldMessenger extends StatefulWidget {
  const TestScaffoldMessenger({Key? key}) : super(key: key);

  @override
  State<TestScaffoldMessenger> createState() => _TestScaffoldMessengerState();
}

class _TestScaffoldMessengerState extends State<TestScaffoldMessenger> {
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TestTest(),
                ),
              ),
              child: Text("test"),
            ),
            MyStatelessWidget(),
          ],
        ),
      ),
      bottomNavigationBar: ScaffoldMessenger(
        child: Container(
          width: 200,
          height: 30,
          color: Colors.red,
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('A SnackBar has been shown.'),
          ),
        );
      },
      child: const Text('Show SnackBar'),
    );
  }
}

class TestTest extends StatefulWidget {
  const TestTest({Key? key}) : super(key: key);

  @override
  State<TestTest> createState() => _TestTestState();
}

class _TestTestState extends State<TestTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
    );
  }
}

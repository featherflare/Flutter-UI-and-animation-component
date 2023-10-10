import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class TestListTile extends StatefulWidget {
  const TestListTile({Key? key}) : super(key: key);

  @override
  State<TestListTile> createState() => _TestListTileState();
}

class _TestListTileState extends State<TestListTile> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  bool _switch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text('ListTile'),
              subtitle: Text('Hot and Cold?'),
              leading: Icon(Icons.ac_unit),
              trailing: Icon(Icons.fire_extinguisher),
            ),
            SwitchListTile(
              value: _switch,
              onChanged: (_) => _switch = !_switch,
              title: Text('SwitchListTile'),
              subtitle: Text('Hot and Cold?'),
              secondary: Icon(Icons.ac_unit),
            ),
            CheckboxListTile(
              value: _switch,
              onChanged: (_) => _switch = !_switch,
              title: Text('SwitchListTile'),
              subtitle: Text('Hot and Cold?'),
              secondary: Icon(Icons.ac_unit),
            ),
            RadioListTile(
              groupValue: _character,
              value: SingingCharacter.lafayette,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
              title: Text('SwitchListTile'),
              subtitle: Text('Hot and Cold?'),
              secondary: Icon(Icons.ac_unit),
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Thomas Jefferson'),
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

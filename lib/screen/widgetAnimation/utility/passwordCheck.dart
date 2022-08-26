import 'package:flutter/material.dart';

class PassWordCheck extends StatefulWidget {
  const PassWordCheck({Key? key}) : super(key: key);

  @override
  State<PassWordCheck> createState() => _PassWordCheckState();
}

class _PassWordCheckState extends State<PassWordCheck> {
  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasPasswordOneUppercase = false;
  bool _hasPasswordOneSpecialCharacters = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final hasSpecialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    final hasUppercase = RegExp(r'[A-Z]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;

      _hasPasswordOneUppercase = false;
      if (hasUppercase.hasMatch(password)) _hasPasswordOneUppercase = true;

      _hasPasswordOneSpecialCharacters = false;
      if (hasSpecialCharacters.hasMatch(password)) {
        _hasPasswordOneSpecialCharacters = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (password) => onPasswordChanged(password),
          obscureText: !_isVisible,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              icon: _isVisible
                  ? Icon(
                      Icons.visibility,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            hintText: "Password",
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: _isPasswordEightCharacters
                    ? Colors.green
                    : Colors.transparent,
                border: _isPasswordEightCharacters
                    ? Border.all(color: Colors.transparent)
                    : Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text("Contains at least 8 characters")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color:
                    _hasPasswordOneNumber ? Colors.green : Colors.transparent,
                border: _hasPasswordOneNumber
                    ? Border.all(color: Colors.transparent)
                    : Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text("Contains atleast 1 number")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: _hasPasswordOneUppercase
                    ? Colors.green
                    : Colors.transparent,
                border: _hasPasswordOneUppercase
                    ? Border.all(color: Colors.transparent)
                    : Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text("Contains at least 1 uppercase")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: _hasPasswordOneSpecialCharacters
                    ? Colors.green
                    : Colors.transparent,
                border: _hasPasswordOneSpecialCharacters
                    ? Border.all(color: Colors.transparent)
                    : Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text("Contains at least 1 speacial characters")
          ],
        ),
      ],
    );
  }
}

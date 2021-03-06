import 'package:flutter/material.dart';
import 'package:shopping_comp/ui/android/pages/login.page.dart';
import 'package:shopping_comp/ui/android/pages/signup.page.dart';

class UnauthenticateUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 60,
        ),
        FlatButton(
          child: Text('Autentique-se'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
        FlatButton(
          child: Text('Ainda não sou cadastrado'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignupPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}

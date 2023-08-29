import 'package:face_net_authentication/pages/home.dart';
import 'package:face_net_authentication/pages/models/user.model.dart';

import 'package:flutter/material.dart';

class SignInSheet extends StatelessWidget {
  SignInSheet({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: size.width,
      height: 120,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'Bem-vindo de volta, ${user.user}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
                (route) => false),
            child: Text(
              'Retornar ao menu',
            ),
          )
        ],
      ),
    );
  }
}

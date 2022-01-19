import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: Column(children: [
          _Logo(),

      ],)
   );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(children: [
          Image(image: AssetImage('assets/tag-logo.png'))
        ],),
      ),
    );
  }
}
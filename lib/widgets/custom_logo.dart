import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/tag-logo.png'),
              height: 170,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Mensseger',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}

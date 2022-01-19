import 'package:flutter/material.dart';

class BtnPrimary extends StatelessWidget {
  final String text;
  final Function onPressed;

  const BtnPrimary({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          onPressed: onPressed(),
          elevation: 2,
          highlightElevation: 5,
          color: Colors.blue,
          shape: StadiumBorder(),
          child: Container(
            width: double.infinity,
            height: 55,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )),
    );
  }
}

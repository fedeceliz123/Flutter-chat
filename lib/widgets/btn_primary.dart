

import 'package:flutter/material.dart';

class BtnPrimary extends StatelessWidget {
  final String text;
  final  Function  Click;

  const BtnPrimary({
    Key? key,
    required this.text,
    required this.Click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: TextButton(
          onPressed: (){Click();},
          
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26.0))),
            
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

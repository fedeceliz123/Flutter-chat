import 'package:flutter/material.dart';

class Labes extends StatelessWidget {

final String ruta;
final String text;
final String subText;

  const Labes({
    Key? key, 
    required this.ruta,
    required this.text,
    required this.subText
    
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.subText,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Text(
              this.text,
              style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onTap: (){
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          )
        ],
      ),
    );
  }
}

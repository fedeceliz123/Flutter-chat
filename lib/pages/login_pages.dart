import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _Logo(),
            _Form(),
            _Labes(),
            Text('Termino y condiciones de uso',style: TextStyle(fontWeight: FontWeight.w200),)
      
        ],),
      )
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
          Image(image: AssetImage('assets/tag-logo.png')),
          SizedBox(height: 20,),
          Text('Mensseger',style: TextStyle(fontSize: 30,),)
        ],),
      ),
    );
  }
}

class _Form extends StatefulWidget {
 

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        TextField(),
        TextField(),
        RaisedButton(
          onPressed: (){},)
    ],),
      
    );
  }
}

class _Labes extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text('¿No tienes cuenta?',style: TextStyle(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.w300),),
        SizedBox(height: 10,),
        Text('Crea una ahora!', style: TextStyle(color: Colors.blue.shade600,fontSize: 18,fontWeight: FontWeight.bold),)
      ],),
    );
  }
}
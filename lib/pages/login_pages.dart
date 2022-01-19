import 'package:flutter/material.dart';

import 'package:chat_tiempo_real/widgets/btn_primary.dart';
import 'package:chat_tiempo_real/widgets/custom_input.dart';
import 'package:chat_tiempo_real/widgets/custom_labels.dart';
import 'package:chat_tiempo_real/widgets/custom_logo.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Logo(),
              _Form(),
              Labes(),
              Text(
                'Termino y condiciones de uso',
                style: TextStyle(fontWeight: FontWeight.w200),
              )
            ],
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Email',
            keyBoardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.password_outlined,
            placeholder: 'Password',
            keyBoardType: TextInputType.text,
            textController: passCtrl,
            isPassword: true,
          ),
          BtnPrimary(
            text: 'Ingrese',
            onPressed: () {
              print(passCtrl);
              print(emailCtrl);
            },
          ),
        ],
      ),
    );
  }
}

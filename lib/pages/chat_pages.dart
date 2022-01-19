import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          title: Column(
            children: [
              CircleAvatar(
                child: Text(
                  'Te',
                  style: TextStyle(fontSize: 12),
                ),
                backgroundColor: Colors.blueAccent,
                maxRadius: 14,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'Tereza',
                style: TextStyle(color: Colors.black87, fontSize: 12),
              )
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  // lista de chats
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, i) => Text('$i'),
                  reverse: true,
                ),
              ),
              Divider(
                height: 1,
              ),
              Container(
                color: Colors.white,
                child: _inputChat(),
              )
            ],
          ),
        ));
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmit,
            onChanged: (String texto) {
              // cuando esta escribiendo para q avise
            },
            decoration: InputDecoration(hintText: 'Enviar mensaje'),
            focusNode: _focusNode,
          )),
          //boton de enviar
          Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ?
                  //boton ios
                  CupertinoButton(
                      child: Text('Enviar'),
                      onPressed: () {},
                    )
                  //boton andriod
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.blue.shade400,
                        ),
                        onPressed: () {},
                      ),
                    ))
        ],
      ),
    ));
  }

  _handleSubmit(String texto) {
    print(texto);
    //limpiar caja de texto
    _textController.clear();
    // dejar el teclado levantado
    _focusNode.requestFocus();
  }
}

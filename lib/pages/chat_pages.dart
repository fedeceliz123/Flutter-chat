import 'package:chat_tiempo_real/widgets/chat_menssage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _messages = [];

  bool _staEcribiendo = false;

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
                  itemCount: _messages.length,
                  itemBuilder: (_, i) => _messages[i],
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
              setState(() {
                if (texto.trim().length > 0) {
                  _staEcribiendo = true;
                } else {
                  _staEcribiendo = false;
                }
              });
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
                      onPressed: _staEcribiendo
                          ? () => _handleSubmit(_textController.text)
                          : null,
                    )
                  //boton andriod
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue.shade400),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.send,
                          ),
                          onPressed: _staEcribiendo
                              ? () => _handleSubmit(_textController.text)
                              : null,
                        ),
                      ),
                    ))
        ],
      ),
    ));
  }

  _handleSubmit(String texto) {
// si no hay texto salir
    if (texto.length == 0) {
      return;
    }

    print(texto);
    //limpiar caja de texto
    _textController.clear();
    // dejar el teclado levantado
    _focusNode.requestFocus();

    //insertar mensaje

    final newMessage = new ChatMessage(
        texto: texto,
        uid: '123',
        animationController: AnimationController(
            vsync: this, duration: Duration(milliseconds: 600)));
    _messages.insert(0, newMessage);
    //empezar animacion
    newMessage.animationController.forward();
    // volver a falso el boton de enviar
    setState(() {
      _staEcribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}



import 'package:chat_tiempo_real/pages/chat_pages.dart';
import 'package:chat_tiempo_real/pages/loading_page.dart';
import 'package:chat_tiempo_real/pages/login_pages.dart';
import 'package:chat_tiempo_real/pages/register_page.dart';
import 'package:chat_tiempo_real/pages/user_pages.dart';
import 'package:flutter/cupertino.dart';

final Map<String,Widget Function(BuildContext)> appRoute={

'usuario':(_) => UsuariosPage(),
'chat':(_)=>ChatPage(),
'login':(_)=>LoginPage(),
'register':(_)=>RegisterPage(),
'loading':(_)=>LoadingPage()

};
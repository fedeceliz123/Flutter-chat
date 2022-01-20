import 'package:flutter/material.dart';
import 'package:chat_tiempo_real/models/usuarios.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class UsuariosPage extends StatefulWidget {

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {


RefreshController _refreshController = RefreshController(initialRefresh: false);

final usuarios =[
  Usuarios(uid: '1',nombre: 'Juan', email:'juan@gmail.com',online: true),
   Usuarios(uid: '2',nombre: 'Maria', email:'maria@gmail.com',online: false),
    Usuarios(uid: '3',nombre: 'Hector', email:'hector@gmail.com',online: true),
     Usuarios(uid: '4',nombre: 'Flor', email:'flor@gmail.com',online: false),

];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Messeger',style: TextStyle(color: Colors.black),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.exit_to_app,color: Colors.black87,),onPressed: (){},)
        ,actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
           //  child: Icon(Icons.check_circle,color: Colors.blue,),
             child: Icon(Icons.offline_bolt,color: Colors.red,),
          )
        ],)
        ,

      
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header:WaterDropHeader(
          complete: Icon(Icons.check,color: Colors.blue.shade400,),
          waterDropColor: Colors.blue.shade400,
        ),
        child: _ListViewUsuarios(),
      )
     );
   
  }

  ListView _ListViewUsuarios() {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_,i)=>_userListTile(usuarios[i]), 
        separatorBuilder: (_,i)=>Divider(), 
        itemCount: usuarios.length);
  }

  ListTile _userListTile(Usuarios usuario) {
    return ListTile(
          title: Text(usuario.nombre),
          subtitle: Text(usuario.email),
          leading: CircleAvatar(
            backgroundColor: Colors.blue.shade200,
            child:Text(usuario.nombre.substring(0,2)) ,),
            trailing: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color:  usuario.online==false ? Colors.green:Colors.green,
                borderRadius: BorderRadius.circular(100)
              ),
            ),
        );
  }

  _cargarUsuarios()async{
  
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  

  }
} 
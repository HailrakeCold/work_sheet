import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
        title: Text('Work List', style: TextStyle(color: Colors.black87),),
    centerTitle: true,
    ),
    body:Column(
      children: [
        Text('MainScreen'),
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context,'/todo');
        }, child: Text('Pass by'))
      ],
    )
    );
}
}

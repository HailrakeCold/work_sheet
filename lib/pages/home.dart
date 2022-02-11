
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  late String _addedElement;
  List todolist = [];

  @override
  void initState() {
    super.initState();
    todolist.addAll(["walk", 'eat', 'wash']);
  }
void _menuOpen(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(title: Text('Menu'),
          centerTitle: true,),
          body: Row(
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.restorablePushNamedAndRemoveUntil(context, '/', (route) => false);
                  },
                  child: Text('To Main Page')),
              Padding(padding: EdgeInsets.only(left: 15),)

            ],
          )
        );
      })
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: _menuOpen,
              icon: Icon(Icons.menu))
        ],
        title: Text('Work List'),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: todolist.length,
          itemBuilder: (BuildContext context , int index){
          return Dismissible(
              key: Key(todolist[index]),
              child: Card(
                child: ListTile(
                    title: Text(todolist[index]),
                    trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.deepOrange,
                    ),
                      onPressed:(){
                        setState(() {
                          todolist.removeAt(index);
                        });
                      },
                ),
                ),

              ),

              onDismissed: (direction){
               // if(direction == DismissDirection.endToStart)
                setState(() {
                  todolist.removeAt(index);
                });
          },
          );
          }

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed:(){
         showDialog(context: context, builder: (BuildContext context){
           return AlertDialog(
             title: Text('Add element'),
             content: TextField(
            onChanged: (String value){
               _addedElement = value;
            },

             ),
             actions: [
               ElevatedButton(onPressed: (){
                 setState(() {
                   todolist.add(_addedElement);
                 });
                 Navigator.of(context).pop();

               },

                   child: Text('add'))
             ],
           );
               } );

        },
        child: Icon(
          Icons.add_box,
          color: Colors.yellow,
        ),
      ),
    );
  }
}

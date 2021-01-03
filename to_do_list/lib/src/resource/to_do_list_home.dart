import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/bloc/to_do_bloc.dart';
import 'package:to_do_list/events/delete_to_do_event.dart';
import 'package:to_do_list/events/initial_to_do_event.dart';
import 'package:to_do_list/models/to_do.dart';
import 'package:to_do_list/src/resource/dialog_text_field.dart';

class ToDoListHome extends StatefulWidget {
  @override
  _ToDoListHomeState createState() => _ToDoListHomeState();
}

class _ToDoListHomeState extends State<ToDoListHome> {
  ToDoBloc bloc;

  _onPressFltActBtn() {
    MyDialog().showDialogTextField(context, bloc);
  }

  _deleteToDoListItem(ToDo toDo) {
    print('delete To do');
    bloc.event.add(DeleteToDoEvent(toDo: toDo));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('initial');
    bloc = Provider.of<ToDoBloc>(context);
    bloc.event.add(InitialToDoEvent());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('To Do List'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.blue,
        ),
        onPressed: _onPressFltActBtn,
      ),
      body: Consumer<ToDoBloc>(
          builder: (context, bloc, child) => StreamBuilder<List<ToDo>>(
              stream: bloc.toDoStream,
              builder: (context, snapshot) {
                if (snapshot.data == null ||
                    snapshot.data.isEmpty ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text('To do not found!',
                        style: TextStyle(fontSize: 20)),
                  );
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case ConnectionState.waiting:
                    break;
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return SafeArea(
                        minimum:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Container(
                          constraints: BoxConstraints.expand(),
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                ToDo toDo = snapshot.data[index];
                                return Card(
                                  color: Colors.blue[400],
                                  elevation: 3.0,
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: Icon(Icons.alarm),
                                      title: Text(
                                        toDo.title,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      subtitle: Text(
                                        toDo.content,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      trailing: GestureDetector(
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.redAccent,
                                        ),
                                        onTap: () => _deleteToDoListItem(toDo),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ));
                    break;
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}

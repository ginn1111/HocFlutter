import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_list/events/add_to_do_event.dart';
import 'package:to_do_list/models/to_do.dart';

class MyDialog {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  var key = GlobalKey<FormState>();
  Widget _buildTitleTF() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: _titleController,
        validator: (value) =>
            value == null || value.isEmpty ? 'please enter title' : null,
        decoration: InputDecoration(
            labelText: 'Add title',
            labelStyle: TextStyle(fontSize: 15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))),
      ),
    );
  }

  Widget _buildContentTF() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: _contentController,
        validator: (value) =>
            value == null || value.isEmpty ? 'please enter content' : null,
        decoration: InputDecoration(
            labelText: 'Add title',
            labelStyle: TextStyle(fontSize: 15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))),
      ),
    );
  }

  void showDialogTextField(BuildContext context, dynamic bloc) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              scrollable: true,
              title: Text(
                'Add to do',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              content: Container(
                  height: 200,
                  width: 150,
                  child: Form(
                    key: key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_buildTitleTF(), _buildContentTF()],
                    ),
                  )),
              actions: [
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    print('add to do');
                    if (key.currentState.validate())
                      bloc.event.add(AddToDoEvent(
                          toDo: ToDo(
                              id: Random().nextInt(100000000),
                              title: _titleController.text,
                              content: _contentController.text)));
                  },
                  child: Text('Ok'),
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
              ],
            ));
  }
}

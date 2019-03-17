import 'package:flutter/material.dart';
import 'package:flutter_todo/bloc/bloc_provider.dart';
import 'package:flutter_todo/ui/addtask/add_task_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldState =
      GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AddTaskBloc createTaskBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: _formState,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(hintText: "Title"),
                validator: (value) {
                  return value.isEmpty ? "Title Cannot be Empty" : null;
                },
                onSaved: (value) {
                  createTaskBloc.updateTitle = value;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
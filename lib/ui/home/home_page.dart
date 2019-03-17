import 'package:flutter/material.dart';
import 'package:flutter_todo/bloc/bloc_provider.dart';
import 'package:flutter_todo/data/db/label_db.dart';
import 'package:flutter_todo/data/db/project_db.dart';
import 'package:flutter_todo/data/db/task_db.dart';
import 'package:flutter_todo/ui/addtask/add_task.dart';
import 'package:flutter_todo/ui/addtask/add_task_bloc.dart';
import 'package:flutter_todo/ui/home/home_bloc.dart';
import 'package:flutter_todo/ui/home/side_drawer.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
          initialData: "Today",
          stream: homeBloc.title,
          builder: (context, snapshot) {
            return Text(snapshot.data);
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          var blocProviderAddTask = BlocProvider(
            bloc: AddTaskBloc(TaskDB.get(), ProjectDB.get(), LabelDB.get()),
            child: AddTaskScreen(),
          );
          Navigator.push(context, 
          MaterialPageRoute<bool>(builder: (context) => blocProviderAddTask));
        },
      ),
      drawer: SideDrawer()
    );
  }
}

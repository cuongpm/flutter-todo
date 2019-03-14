import 'package:flutter/material.dart';
import 'package:flutter_todo/bloc/bloc_provider.dart';
import 'package:flutter_todo/data/model/project.dart';
import 'package:flutter_todo/ui/project/project_bloc.dart';
import 'package:flutter_todo/utils/collapsable_expand_tile.dart';
import 'package:flutter_todo/utils/color_util.dart';

class AddProject extends StatelessWidget {
  final expansionTile = GlobalKey<CollapsibleExpansionTileState>();
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ProjectBloc _projectBloc = BlocProvider.of(context);
    ColorPalette currentSelectedPalette;
    String projectName = "";
    return Scaffold(
      appBar: AppBar(
        title: Text("Add project"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.send,
          color: Colors.white,
        ),
        onPressed: () {
          if(_formState.currentState.validate()){
            _formState.currentState.save();
            var project = Project.create(
                  projectName,
                  currentSelectedPalette.colorValue,
                  currentSelectedPalette.colorName);
            _projectBloc.createProject(project);
            Navigator.pop(context, true);
          }
        },
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formState,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Project name"),
                maxLength: 20,
                validator: (value){
                  return value.isEmpty ? "Project name cannot be empty" : null;
                },
                onSaved: (value) {
                  projectName = value;
                }
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: StreamBuilder(
              stream: _projectBloc.colorSelection,
              initialData: ColorPalette("Grey", Colors.grey.value),
              builder: (context, snapshot) {
                currentSelectedPalette = snapshot.data;
                return CollapsibleExpansionTile(
                  key: expansionTile,
                  title: Text(currentSelectedPalette.colorName),
                  leading: Container(
                    width: 12.0,
                    height: 12.0,
                    child: CircleAvatar(
                      backgroundColor: Color(currentSelectedPalette.colorValue),
                    ),
                  ),
                  children: buildMaterialColors(_projectBloc)
                );
              }
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildMaterialColors(ProjectBloc projectBloc) {
  List<Widget> projectWidgetList = List();
  colorsPalettes.forEach((color) {
    projectWidgetList.add(ListTile(
      title: Text(color.colorName),
      leading: Container(
        width: 12.0,
        height: 12.0,
        child: CircleAvatar(
          backgroundColor: Color(color.colorValue),
        ),
      ),
      onTap: () {
        expansionTile.currentState.collapse();
        projectBloc.updateColorSelection(
          ColorPalette(color.colorName, color.colorValue)
        );
      }
    ));
  });
  return projectWidgetList;
  }
}
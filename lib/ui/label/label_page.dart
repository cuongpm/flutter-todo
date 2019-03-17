import 'package:flutter/material.dart';
import 'package:flutter_todo/bloc/bloc_provider.dart';
import 'package:flutter_todo/data/db/label_db.dart';
import 'package:flutter_todo/data/model/label.dart';
import 'package:flutter_todo/ui/label/add_label.dart';
import 'package:flutter_todo/ui/label/label_bloc.dart';

class LabelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LabelBloc labelBloc = BlocProvider.of(context);
    return StreamBuilder(
      stream: labelBloc.labels ,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return LabelExpansionTileWidget(snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class LabelExpansionTileWidget extends StatelessWidget {
  final List<Label> _labels;

  LabelExpansionTileWidget(this._labels);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.label),
      title: Text("Labels", 
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
      children: buildLabels(context),
    );
  }

  List<Widget> buildLabels(BuildContext context) {
    LabelBloc _labelBloc = BlocProvider.of(context);
    List<Widget> projectWidgetList = List();
    _labels.forEach((label) => projectWidgetList.add(LabelRow(label)));
    projectWidgetList.add(ListTile(
      leading: Icon(Icons.add),
      title: Text("Add Label"),
      onTap: () async {
        Navigator.pop(context);
        var blocLabelProvider = BlocProvider(
            bloc: LabelBloc(LabelDB.get()),
            child: AddLabel(),
          );
        await Navigator.push(context,
            MaterialPageRoute<bool>(builder: (context) => blocLabelProvider));
        _labelBloc.refresh();
      },
    ));
    return projectWidgetList;
  }
}

class LabelRow extends StatelessWidget {
  final Label label;

  LabelRow(this.label);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("@ ${label.name}"),
      leading: Container(
        width: 24.0,
        height: 24.0,
      ),
      trailing: Container(
        width: 10.0,
        height: 10.0,
        child: Icon(
          Icons.label,
          size: 16.0,
          color: Color(label.colorValue),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

}
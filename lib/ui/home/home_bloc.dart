import 'dart:async';

import 'package:flutter_todo/bloc/bloc_provider.dart';
import 'package:flutter_todo/data/model/filter.dart';

class HomeBloc extends BlocBase {
  StreamController<String> _tittleController =
      StreamController<String>.broadcast();

  StreamController<Filter> _filterController =
      StreamController<Filter>.broadcast();

  Stream<String> get title => _tittleController.stream;

  Stream<Filter> get filter => _filterController.stream;

  @override
  void dispose() {
    _tittleController.close();
    _filterController.close();
  }

  void updateTitle(String title) {
    _tittleController.sink.add(title);
  }

  void applyFilter(String title, Filter filter) {
    _filterController.sink.add(filter);
    updateTitle(title);
  }
}

import 'package:flutter_todo/data/model/task.dart';

enum FILTER_STATUS { BY_TODAY, BY_WEEK, BY_PROJECT, BY_LABEL, BY_STATUS }

class Filter {
  String labelName;
  int projectId;
  FILTER_STATUS filterStatus;
  TaskStatus status;

  Filter.byToday() {
    filterStatus = FILTER_STATUS.BY_TODAY;
  }

  Filter.byNextWeek() {
    filterStatus = FILTER_STATUS.BY_WEEK;
  }

  Filter.byProject(this.projectId) {
    filterStatus = FILTER_STATUS.BY_PROJECT;
  }

  Filter.byLabel(this.labelName) {
    filterStatus = FILTER_STATUS.BY_LABEL;
  }

  Filter.byStatus(this.status) {
    filterStatus = FILTER_STATUS.BY_STATUS;
  }
}
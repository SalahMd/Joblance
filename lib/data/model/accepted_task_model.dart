import 'package:joblance/data/model/task_model.dart';

class AcceptedTaskModel {
  int? duration;
  String? taskStateName;
  TaskModel? task;

  AcceptedTaskModel({this.duration, this.taskStateName, this.task});

  AcceptedTaskModel.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    taskStateName = json['task_state_name'];
    task = json['task'] != null ? new TaskModel.fromJson(json['task']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration'] = this.duration;
    data['task_state_name'] = this.taskStateName;
    if (this.task != null) {
      data['task'] = this.task!.toJson();
    }
    return data;
  }
}



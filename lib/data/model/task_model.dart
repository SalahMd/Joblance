class TaskModel {
  int? id;
  String? name;
  String? image;
  int? userId;
  String? taskTitle;
  String? aboutTask;
  String? requirements;
  String? additionalInformation;
  int? taskDuration;
  int? budgetMin;
  int? budgetMax;
  String? createdAt;
  String? updatedAt;
  String? majorName;
  int? active;
  int? majorId;
  int? roleId;

  TaskModel(
      {this.id,
      this.name,
      this.image,
      this.userId,
      this.taskTitle,
      this.aboutTask,
      this.requirements,
      this.additionalInformation,
      this.taskDuration,
      this.budgetMin,
      this.majorId,
      this.active,
      this.budgetMax,
      this.createdAt,
      this.roleId,
      this.majorName,
      this.updatedAt});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    userId = json['user_id'];
    taskTitle = json['task_title'];
    aboutTask = json['about_task'];
    requirements = json['requirements'];
    additionalInformation = json['additional_information'];
    taskDuration = json['task_duration'];
    budgetMin = json['budget_min'];
    budgetMax = json['budget_max'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    majorName = json["major_name"];
    active = json['active'];
    majorId = json["major_id"];
    roleId = json['user_role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['task_title'] = this.taskTitle;
    data['about_task'] = this.aboutTask;
    data['requirements'] = this.requirements;
    data['additional_information'] = this.additionalInformation;
    data['task_duration'] = this.taskDuration;
    data['budget_min'] = this.budgetMin;
    data['budget_max'] = this.budgetMax;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['major_name'] = this.majorName;
    data['active'] = this.active;
    data['major_id'] = this.majorId;
    data ['user_role']= this.roleId;
    return data;
  }
}

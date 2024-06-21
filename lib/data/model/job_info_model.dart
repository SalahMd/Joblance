class JobModel {
  String? jobTitle;
  String? jobDescription;
  double? salary;
  String? location;
  String? jobTypeName;
  int? jobTypeId;
  int? mojorId;
  String? mojorName;
  int? remoteId;
  String? remoteName;
  String? requirements;
  String? additionalInfo;
  int? experienceLevelId;
  String? experienceLevelName;
  String? aboutCompany;
  String? date;
  String? companyName;
  String? companyImage;
  int? id;
  int? companyId;
  int? active;
  String? numOfEmployees;

  JobModel(
      {this.jobTitle,
      this.jobDescription,
      this.salary,
      this.location,
      this.jobTypeName,
      this.jobTypeId,
      this.mojorId,
      this.mojorName,
      this.remoteId,
      this.remoteName,
      this.requirements,
      this.additionalInfo,
      this.experienceLevelId,
      this.experienceLevelName,
      this.aboutCompany,
      this.date,
      this.companyName,
      this.companyImage,
      this.id,
      this.active,
      this.companyId,
      this.numOfEmployees});

  JobModel.fromJson(Map<String, dynamic> json) {
    jobTitle = json['job_title'];
    jobDescription = json['job_description'];
    salary = json['salary'];
    location = json['location'];
    jobTypeName = json['job_type_name'];
    jobTypeId = json['job_type_id'];
    mojorId = json['mojor_id'];
    mojorName = json['mojor_name'];
    remoteId = json['remote_id'];
    remoteName = json['remote_name'];
    requirements = json['requirements'];
    additionalInfo = json['additional_info'];
    experienceLevelId = json['experience_level_id'];
    experienceLevelName = json['experience_level_name'];
    aboutCompany = json['about_company'];
    date = json['date'];
    companyName = json['company_name'];
    companyImage = json['company_image'];
    id = json['id'];
    active = json['active'];
    numOfEmployees = json['num_of_employees'];
    companyId = json['company_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_title'] = this.jobTitle;
    data['job_description'] = this.jobDescription;
    data['salary'] = this.salary;
    data['location'] = this.location;
    data['job_type_name'] = this.jobTypeName;
    data['job_type_id'] = this.jobTypeId;
    data['mojor_id'] = this.mojorId;
    data['mojor_name'] = this.mojorName;
    data['remote_id'] = this.remoteId;
    data['remote_name'] = this.remoteName;
    data['requirements'] = this.requirements;
    data['additional_info'] = this.additionalInfo;
    data['experience_level_id'] = this.experienceLevelId;
    data['experience_level_name'] = this.experienceLevelName;
    data['about_company'] = this.aboutCompany;
    data['date'] = this.date;
    data['company_name'] = this.companyName;
    data['company_image'] = this.companyImage;
    data['id'] = this.id;
    data['active'] = this.active;
    data['num_of_employees'] = this.numOfEmployees;
    data['company_id'] = this.companyImage;
    return data;
  }
}

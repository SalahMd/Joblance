class JobModel {
  String? jobTitle;
  String? jobDescription;
  int? salary;
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
  bool? isFavorite;

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
      this.isFavorite,
      this.numOfEmployees});

  JobModel.fromJson(Map<String, dynamic> json) {
    jobTitle = json['title'];
    jobDescription = json['about_job'];
    salary = json['salary'];
    location = json['location'];
    jobTypeName = json['job_type_name'];
    jobTypeId = json['job_type_id'];
    mojorId = json['major_id'];
    mojorName = json['major_name'];
    remoteId = json['remote_id'];
    remoteName = json['remote_name'];
    requirements = json['requirements'];
    additionalInfo = json['additional_information'];
    experienceLevelId = json['experience_level_id'];
    experienceLevelName = json['experience_level_name'];
    aboutCompany = json['about_company'];
    date = json['date'];
    companyName = json['company_name'];
    companyImage = json['image'];
    id = json['id'];
    active = json['active'];
    numOfEmployees = json['num_of_employees'];
    companyId = json['company_id'];
    isFavorite = json['favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.jobTitle;
    data['about_job'] = this.jobDescription;
    data['salary'] = this.salary;
    data['location'] = this.location;
    data['job_type_name'] = this.jobTypeName;
    data['job_type_id'] = this.jobTypeId;
    data['major_id'] = this.mojorId;
    data['major_name'] = this.mojorName;
    data['remote_id'] = this.remoteId;
    data['remote_name'] = this.remoteName;
    data['requirements'] = this.requirements;
    data['additional_information'] = this.additionalInfo;
    data['experience_level_id'] = this.experienceLevelId;
    data['experience_level_name'] = this.experienceLevelName;
    data['about_company'] = this.aboutCompany;
    data['date'] = this.date;
    data['company_name'] = this.companyName;
    data['image'] = this.companyImage;
    data['id'] = this.id;
    data['active'] = this.active;
    data['num_of_employees'] = this.numOfEmployees;
    data['company_id'] = this.companyImage;
    data['favourite']= this.isFavorite;
    return data;
  }
}

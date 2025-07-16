class JobApplicantsModel {
  int? id;
  int? jobDetailId;
  int? freelancerId;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? coverLetter;
  String? cV;
  String? createdAt;
  String? updatedAt;
  String? majorName;
  String? image;
  String? name;

  JobApplicantsModel(
      {this.id,
      this.jobDetailId,
      this.freelancerId,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.coverLetter,
      this.cV,
      this.createdAt,
      this.updatedAt,
      this.majorName,
      this.image,
      this.name});

  JobApplicantsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobDetailId = json['job_detail_id'];
    freelancerId = json['freelancer_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    coverLetter = json['cover_letter'];
    cV = json['CV'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    majorName = json['major_name'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_detail_id'] = this.jobDetailId;
    data['freelancer_id'] = this.freelancerId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['cover_letter'] = this.coverLetter;
    data['CV'] = this.cV;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['major_name'] = this.majorName;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

class UserModel {
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? password;
  String? isCompany;
  String? majorId;
  String? description;
  String? studyCaseId;
  String? birthDate;
  String? numOfEmployees;
  String? openToWork;
  String? location;
  String? image;

  UserModel(
      {this.name,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.password,
      this.isCompany,
      this.majorId,
      this.description,
      this.studyCaseId,
      this.birthDate,
      this.numOfEmployees,
      this.openToWork,
      this.location,
      this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    isCompany = json['is_company'];
    majorId = json['major_id'];
    description = json['description'];
    studyCaseId = json['study_case_id'];
    birthDate = json['birth_date'];
    numOfEmployees = json['num_of_employees'];
    openToWork = json['open_to_work'];
    location = json['location'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    data['is_company'] = this.isCompany;
    data['major_id'] = this.majorId;
    data['description'] = this.description;
    data['study_case_id'] = this.studyCaseId;
    data['birth_date'] = this.birthDate;
    data['num_of_employees'] = this.numOfEmployees;
    data['open_to_work'] = this.openToWork;
    data['location'] = this.location;
    data['image'] = this.image;
    return data;
  }
}

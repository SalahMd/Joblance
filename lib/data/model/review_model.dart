class ReviewModel {
  int? id;
  var level;
  String? comment;
  int? userId;
  String? firstName;
  String? lastName;
  String? image;
  String? createdAt;

  ReviewModel(
      {this.id,
      this.level,
      this.comment,
      this.userId,
      this.firstName,
      this.lastName,
      this.image,
      this.createdAt});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    comment = json['comment'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level'] = this.level;
    data['comment'] = this.comment;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}

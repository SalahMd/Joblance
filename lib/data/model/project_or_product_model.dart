class ProjectOrProductModel {
  String? projectName;
  int? id;
  String? projectDescription;
  String? link;
  int? userId;
  List<Images>? images;

  ProjectOrProductModel(
      {this.projectName,
      this.id,
      this.projectDescription,
      this.link,
      this.userId,
      this.images});

  ProjectOrProductModel.fromJson(Map<String, dynamic> json) {
    projectName = json['project_name'];
    id = json['id'];
    projectDescription = json['project_description'];
    link = json['link'];
    userId = json['user_id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_name'] = this.projectName;
    data['id'] = this.id;
    data['project_description'] = this.projectDescription;
    data['link'] = this.link;
    data['user_id'] = this.userId;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? image;
  int? id;

  Images({this.image, this.id});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}

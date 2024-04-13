class ChatModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? lastMessage;

  ChatModel({this.id, this.createdAt, this.updatedAt, this.lastMessage});

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastMessage = json['last_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_message'] = this.lastMessage;
    return data;
  }
}
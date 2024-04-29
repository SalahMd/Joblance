class MessageModel {
  String? id;
  var message;
  String? timeStamp;
  String? senderId;
  String? reciverId;
  String? type;
  String? senderName;
  String? fileName;

  MessageModel(
      {this.id,
      this.message,
      this.timeStamp,
      this.senderId,
      this.reciverId,
      this.type,
      this.senderName,
      this.fileName});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    timeStamp = json['created_at'];
    senderId = json['sender_id'];
    reciverId = json['reciver_id'];
    senderName = json['sender_name'];
    type = json['type'];
    fileName = json['file_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['time_stamp'] = this.timeStamp;
    data['sender_id'] = this.senderId;
    data['reciver_id'] = this.reciverId;
    data['sender_name'] = this.senderName;
    data['file_name'] = this.fileName;
    return data;
  }
}

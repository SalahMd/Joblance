class MessageModel {
  String? id;
  String? message;
  String? timeStamp;
  String? senderId;
  String? reciverId;
  String? senderName;

  MessageModel(
      {this.id,
      this.message,
      this.timeStamp,
      this.senderId,
      this.reciverId,
      this.senderName});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    timeStamp = json['time_stamp'];
    senderId = json['sender_id'];
    reciverId = json['reciver_id'];
    senderName = json['sender_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['time_stamp'] = this.timeStamp;
    data['sender_id'] = this.senderId;
    data['reciver_id'] = this.reciverId;
    data['sender_name'] = this.senderName;
    return data;
  }
}

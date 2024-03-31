class MessageModel {
  final String message;
  final String timeStamp;
  final String senderId;
  final String reciverId;
  final String senderName;

  MessageModel(
      {required this.message,
      required this.timeStamp,
      required this.senderId,
      required this.reciverId,
      required this.senderName});
}

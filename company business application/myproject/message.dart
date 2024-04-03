class Message{
  late String sender;
  late String receiver;
  late String date;
  late String body;
  Message(String sender,String receiver,String date,String body){
    this.sender=sender;
    this.receiver=receiver;
    this.date=date;
    this.body=body;
  }
}
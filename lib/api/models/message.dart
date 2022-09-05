///Model class
class Message {
  ///constructor to accept string
  const Message(this.message);

  ///Message to be printed out
  final String message;

  @override
  String toString() {
    return message;
  }
}

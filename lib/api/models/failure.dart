///Failure model to be returned in
///case of any exceptions
class Failure with Exception {
  ///constructor accepting a string as
  ///a parameter
  const Failure(this.message);

  ///Message to be printed out
  final String message;

  @override
  String toString() => message;
}

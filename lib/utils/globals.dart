//Singleton =>  can have only one object
class Globals {
  String? name, email, phone, address;

  //1: create private named constructor
  Globals._();

  //2: assign private named constructor into static final object
  static final Globals globals = Globals._();

  void reset() {
    //Chained assign expression
    name = email = phone = address = null;
  }
}

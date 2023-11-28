class ContactModel {
  final String lastname;
  final String firstname;
  final String mobileno;
  final String email;

  const ContactModel({
    required this.firstname,
    required this.lastname,
    required this.mobileno,
    required this.email,
  });
  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'mobileno': mobileno,
      'email': email,
    };
  }

  String toString() {
    return 'ContactModel{firstname: $firstname, lastname: $lastname, mobileno: $mobileno,email: $email}';
  }
}

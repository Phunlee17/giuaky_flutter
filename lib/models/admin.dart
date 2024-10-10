class Admin {
  String id;
  String name;
  String email;

  Admin({required this.id, required this.name, required this.email});

  factory Admin.fromMap(Map<String, dynamic> data, String documentId) {
    return Admin(
      id: documentId,
      name: data['name'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}

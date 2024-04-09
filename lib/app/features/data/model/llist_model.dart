class PasswordList {
  int? id;
  String title;
  String password;

  PasswordList({required this.title, required this.password, this.id});

  static PasswordList fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final title = map['title'] as String;
    final password = map['password'] as String;

    return PasswordList(title: title, password: password, id: id);
  }
}

import 'package:equatable/equatable.dart';

void main() {
  print('Hello, World!');

  User user1 = User('Alice', 30);
  User user2 = User('Alice', 30);

  print(user1 == user2);

  UserEquatable userEq1 = UserEquatable('Bob', 25);
  UserEquatable userEq2 = UserEquatable('Bob', 25);

  print(userEq1 == userEq2);

}


// A simple User class without value equality
class User {
  String name;
  int age;

  User(this.name, this.age);

  @override
  bool operator ==(Object other) =>
      other is User &&
          other.runtimeType == runtimeType &&
          other.name == name &&
          other.age == age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

}

// To enable value equality, you can use the equatable package
class UserEquatable extends Equatable {
  final String name;
  final int age;

  const UserEquatable(this.name, this.age);

  @override
  List<Object?> get props => [name, age];
}
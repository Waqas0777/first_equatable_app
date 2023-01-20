import 'package:equatable/equatable.dart';

class ModelPerson extends Equatable {
  final int id;
  final String username;
  final String gender;
  final int age;

  const ModelPerson(this.id, this.username, this.gender, this.age);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelPerson &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          username == other.username &&
          gender == other.gender &&
          age == other.age;

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ gender.hashCode ^ age.hashCode;

  @override
  List<Object> get props => [id, username, gender, age];
}

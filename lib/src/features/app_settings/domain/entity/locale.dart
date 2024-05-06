import 'package:equatable/equatable.dart';

class LocaleEntity extends Equatable {
  final String name;

  const LocaleEntity({required this.name});

  @override
  List<Object?> get props => [name];
}

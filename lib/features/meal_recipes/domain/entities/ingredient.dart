import 'package:equatable/equatable.dart';

class Ingredient extends Equatable{
  const Ingredient({
    required this.name,
    required this.measure,
  });

  final String name;
  final String measure;

  @override
  // TODO: implement props
  List<Object?> get props => [name, measure,];
}

import 'package:equatable/equatable.dart';

class StateEntity extends Equatable {
  final String? name;
  final String? state;
  final String? image;
  final int? totalCases;
  final String? lastModified;
  final String? x;
  final String? notes;

  const StateEntity({
    required this.x,
    required this.notes,
    required this.name,
    required this.state,
    required this.image,
    required this.totalCases,
    required this.lastModified,
  });

  @override
  List<Object?> get props => [
        name,
        state,
        image,
        totalCases,
        lastModified,
        x,
        notes,
      ];
}

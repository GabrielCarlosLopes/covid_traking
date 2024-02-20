// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class StateEntity extends Equatable {
  final String? name;
  final String? state;
  final String? image;
  final int? totalCases;
  final String? lastModified;

  const StateEntity({
    required this.name,
    required this.state,
    required this.image,
    required this.totalCases,
    required this.lastModified,
  });

  @override
  List<Object?> get props => [name, state, image, totalCases, lastModified];

  StateEntity copyWith({
    String? name,
    String? state,
    String? image,
    int? totalCases,
    String? lastModified,
  }) {
    return StateEntity(
      name: name ?? this.name,
      state: state ?? this.state,
      image: image ?? this.image,
      totalCases: totalCases ?? this.totalCases,
      lastModified: lastModified ?? this.lastModified,
    );
  }
}

import 'package:covid_traking/features/more_details/domain/entities/state_entity.dart';

class StateModel {
  final String? name;
  final String? state;
  final String? image;
  final int? totalCases;
  final String? lastModified;
  final String? notes;
  final String? x;

  StateModel({
    required this.name,
    required this.state,
    required this.image,
    required this.totalCases,
    required this.lastModified,
    required this.x,
    required this.notes,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      name: json['name'],
      state: json['state'],
      image: json['image'],
      totalCases: json['totalCases'],
      lastModified: json['lastModified'],
      x: json['twitter'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'state': state,
      'image': image,
      'totalCases': totalCases,
      'lastModified': lastModified,
      'x': x,
      'notes': notes,
    };
  }

  StateEntity toEntity() {
    return StateEntity(
      name: name,
      state: state,
      image: image,
      totalCases: totalCases,
      lastModified: lastModified,
      x: x,
      notes: notes,
    );
  }

  factory StateModel.fromEntity(StateEntity entity) {
    return StateModel(
      name: entity.name,
      state: entity.state,
      image: entity.image,
      totalCases: entity.totalCases,
      lastModified: entity.lastModified,
      x: entity.x,
      notes: entity.notes,
    );
  }
}

import 'package:equatable/equatable.dart';

class CovidInfosEntity extends Equatable {
  final String lastModified;
  final int deaths;
  final int positive;
  final int negative;
  final int? recovered;
  final int total;
  final int pending;

  const CovidInfosEntity({
    required this.lastModified,
    required this.deaths,
    required this.positive,
    required this.negative,
    this.recovered,
    required this.total,
    required this.pending,
  });

  @override
  List get props => [
        lastModified,
        deaths,
        positive,
        negative,
        recovered ?? 0,
        total,
        pending,
      ];
}

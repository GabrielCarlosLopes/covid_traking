import 'package:covid_traking/features/home/domain/entities/covid_infos_entity.dart';

class CovidInfosModel {
  final String lastModified;
  final int deaths;
  final int positive;
  final int negative;
  final int? recovered;
  final int total;
  final int pending;

  CovidInfosModel({
    required this.lastModified,
    required this.deaths,
    required this.positive,
    required this.negative,
    required this.recovered,
    required this.total,
    required this.pending,
  });

  factory CovidInfosModel.fromJson(Map<String, dynamic> json) {
    return CovidInfosModel(
      lastModified: json['lastModified'],
      deaths: json['death'],
      positive: json['positive'],
      negative: json['negative'],
      recovered: json['recovered'],
      total: json['total'],
      pending: json['pending'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastModified': lastModified,
      'deaths': deaths,
      'positive': positive,
      'negative': negative,
      'recovered': recovered,
      'total': total,
      'pending': pending,
    };
  }

  CovidInfosEntity toEntity() {
    return CovidInfosEntity(
      lastModified: lastModified,
      deaths: deaths,
      positive: positive,
      negative: negative,
      recovered: recovered ?? 0,
      total: total,
      pending: pending,
    );
  }

  factory CovidInfosModel.fromEntity(CovidInfosEntity entity) {
    return CovidInfosModel(
      lastModified: entity.lastModified,
      deaths: entity.deaths,
      positive: entity.positive,
      negative: entity.negative,
      recovered: entity.recovered,
      total: entity.total,
      pending: entity.pending,
    );
  }
}

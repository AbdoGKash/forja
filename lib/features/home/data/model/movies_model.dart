import 'package:json_annotation/json_annotation.dart';
part 'movies_model.g.dart';

@JsonSerializable()
class Movies {
  int? status;
  String? message;
  List<MoviesDetails>? foryou;
  List<MoviesDetails>? action;
  List<MoviesDetails>? romantic;
  List<MoviesDetails>? animation;
  List<MoviesDetails>? comedy;

  Movies(
      {this.status,
      this.message,
      this.foryou,
      this.action,
      this.romantic,
      this.animation,
      this.comedy});
  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}

@JsonSerializable()
class MoviesDetails {
  int? id;
  String? name;
  String? cover;
  String? video;
  String? year;
  String? rating;
  String? duration;
  String? section;
  String? summary;
  String? director;
  String? stars;

  MoviesDetails(
      {this.id,
      this.name,
      this.cover,
      this.video,
      this.year,
      this.rating,
      this.duration,
      this.section,
      this.summary,
      this.director,
      this.stars});

  factory MoviesDetails.fromJson(Map<String, dynamic> json) =>
      _$MoviesDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesDetailsToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'movice_model.g.dart';

@JsonSerializable()
class Movice {
  List<MoviceDetails>? foryou;
  List<MoviceDetails>? action;
  List<MoviceDetails>? romantic;
  List<MoviceDetails>? animation;
  List<MoviceDetails>? comedy;

  Movice(
      {this.foryou, this.action, this.romantic, this.animation, this.comedy});
  factory Movice.fromJson(Map<String, dynamic> json) => _$MoviceFromJson(json);
  Map<String, dynamic> toJson() => _$MoviceToJson(this);
}

@JsonSerializable()
class MoviceDetails {
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

  MoviceDetails(
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

  factory MoviceDetails.fromJson(Map<String, dynamic> json) =>
      _$MoviceDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$MoviceDetailsToJson(this);
}

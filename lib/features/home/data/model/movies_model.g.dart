// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      foryou: (json['foryou'] as List<dynamic>?)
          ?.map((e) => MoviesDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      action: (json['action'] as List<dynamic>?)
          ?.map((e) => MoviesDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      romantic: (json['romantic'] as List<dynamic>?)
          ?.map((e) => MoviesDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      animation: (json['animation'] as List<dynamic>?)
          ?.map((e) => MoviesDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      comedy: (json['comedy'] as List<dynamic>?)
          ?.map((e) => MoviesDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'foryou': instance.foryou,
      'action': instance.action,
      'romantic': instance.romantic,
      'animation': instance.animation,
      'comedy': instance.comedy,
    };

MoviesDetails _$MoviesDetailsFromJson(Map<String, dynamic> json) =>
    MoviesDetails(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      cover: json['cover'] as String?,
      video: json['video'] as String?,
      year: json['year'] as String?,
      rating: json['rating'] as String?,
      duration: json['duration'] as String?,
      section: json['section'] as String?,
      summary: json['summary'] as String?,
      director: json['director'] as String?,
      stars: json['stars'] as String?,
    );

Map<String, dynamic> _$MoviesDetailsToJson(MoviesDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover': instance.cover,
      'video': instance.video,
      'year': instance.year,
      'rating': instance.rating,
      'duration': instance.duration,
      'section': instance.section,
      'summary': instance.summary,
      'director': instance.director,
      'stars': instance.stars,
    };

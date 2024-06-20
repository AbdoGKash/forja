// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movice _$MoviceFromJson(Map<String, dynamic> json) => Movice(
      foryou: (json['foryou'] as List<dynamic>?)
          ?.map((e) => MoviceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      action: (json['action'] as List<dynamic>?)
          ?.map((e) => MoviceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      romantic: (json['romantic'] as List<dynamic>?)
          ?.map((e) => MoviceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      animation: (json['animation'] as List<dynamic>?)
          ?.map((e) => MoviceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      comedy: (json['comedy'] as List<dynamic>?)
          ?.map((e) => MoviceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviceToJson(Movice instance) => <String, dynamic>{
      'foryou': instance.foryou,
      'action': instance.action,
      'romantic': instance.romantic,
      'animation': instance.animation,
      'comedy': instance.comedy,
    };

MoviceDetails _$MoviceDetailsFromJson(Map<String, dynamic> json) =>
    MoviceDetails(
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

Map<String, dynamic> _$MoviceDetailsToJson(MoviceDetails instance) =>
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

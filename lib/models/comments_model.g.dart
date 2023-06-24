// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) =>
    CommentsModel(
      title: json['title'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CommentsModelToJson(CommentsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'thumbnailUrl': instance.thumbnailUrl,
      'url': instance.url,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCommentsModel _$ListCommentsModelFromJson(Map<String, dynamic> json) =>
    ListCommentsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CommentsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCommentsModelToJson(ListCommentsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

import 'package:json_annotation/json_annotation.dart';
part 'comments_model.g.dart';

@JsonSerializable()
class CommentsModel {
  String? title;
  String? thumbnailUrl;
  String? url;

  CommentsModel({this.title, this.thumbnailUrl, this.url});

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentsModelToJson(this);
}

import 'package:bayesian_assignment/models/comments_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'list_comments_model.g.dart';

@JsonSerializable()
class ListCommentsModel {
  List<CommentsModel>? data;
  ListCommentsModel({this.data});

  factory ListCommentsModel.fromJson(Map<String, dynamic> json) =>
      _$ListCommentsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListCommentsModelToJson(this);
}

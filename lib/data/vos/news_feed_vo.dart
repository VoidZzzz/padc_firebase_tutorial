import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'news_feed_vo.g.dart';

@JsonSerializable()
class NewsfeedVO{
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "post_image")
  String? postImage;

  @JsonKey(name: "profile_picture")
  String? profilePicture;

  @JsonKey(name: "username")
  String? userName;

  NewsfeedVO(this.id, this.description, this.postImage, this.profilePicture,
      this.userName);

  factory NewsfeedVO.fromJson(Map<String, dynamic> json) => _$NewsfeedVOFromJson(json);

  Map<String, dynamic> toJson() => _$NewsfeedVOToJson(this);

  @override
  String toString() {
    return 'NewsfeedVO{id: $id, description: $description, postImage: $postImage, profilePicture: $profilePicture, userName: $userName}';
  }
}
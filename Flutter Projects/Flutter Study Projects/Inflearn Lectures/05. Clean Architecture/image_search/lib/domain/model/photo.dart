import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'photo.g.dart';

@JsonSerializable(explicitToJson: true)
class Photo {
  int id;
  String tags;
  @JsonKey(name: 'url')
  String previewUrl;

  Photo({
    required this.id,
    required this.tags,
    required this.previewUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

/// 기존에 수동으로 만들었던 Model
// class Photo {
//   final int id;
//   final String pageUrl;
//   final String type;
//   final String tags;
//   final String previewUrl;
//   final int previewWidth;
//   final int previewHeight;
//   final String webformatUrl;
//   final int webformatWidth;
//   final int webformatHeight;
//   final String largeImageUrl;
//   final int imageWidth;
//   final int imageHeight;
//   final int imageSize;
//   final int views;
//   final int downloads;
//   final int collections;
//   final int likes;
//   final int comments;
//   final int userId;
//   final String user;
//   final String userImageUrl;
//
//   Photo({
//     required this.id,
//     required this.pageUrl,
//     required this.type,
//     required this.tags,
//     required this.previewUrl,
//     required this.previewWidth,
//     required this.previewHeight,
//     required this.webformatUrl,
//     required this.webformatWidth,
//     required this.webformatHeight,
//     required this.largeImageUrl,
//     required this.imageWidth,
//     required this.imageHeight,
//     required this.imageSize,
//     required this.views,
//     required this.downloads,
//     required this.collections,
//     required this.likes,
//     required this.comments,
//     required this.userId,
//     required this.user,
//     required this.userImageUrl,
//   });
//
//   factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Photo.fromJson(Map<String, dynamic> json) => Photo(
//         id: json["id"],
//         pageUrl: json["pageURL"],
//         type: json["type"],
//         tags: json["tags"],
//         previewUrl: json["previewURL"],
//         previewWidth: json["previewWidth"],
//         previewHeight: json["previewHeight"],
//         webformatUrl: json["webformatURL"],
//         webformatWidth: json["webformatWidth"],
//         webformatHeight: json["webformatHeight"],
//         largeImageUrl: json["largeImageURL"],
//         imageWidth: json["imageWidth"],
//         imageHeight: json["imageHeight"],
//         imageSize: json["imageSize"],
//         views: json["views"],
//         downloads: json["downloads"],
//         collections: json["collections"],
//         likes: json["likes"],
//         comments: json["comments"],
//         userId: json["user_id"],
//         user: json["user"],
//         userImageUrl: json["userImageURL"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "pageURL": pageUrl,
//         "type": type,
//         "tags": tags,
//         "previewURL": previewUrl,
//         "previewWidth": previewWidth,
//         "previewHeight": previewHeight,
//         "webformatURL": webformatUrl,
//         "webformatWidth": webformatWidth,
//         "webformatHeight": webformatHeight,
//         "largeImageURL": largeImageUrl,
//         "imageWidth": imageWidth,
//         "imageHeight": imageHeight,
//         "imageSize": imageSize,
//         "views": views,
//         "downloads": downloads,
//         "collections": collections,
//         "likes": likes,
//         "comments": comments,
//         "user_id": userId,
//         "user": user,
//         "userImageURL": userImageUrl,
//       };
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is Photo && runtimeType == other.runtimeType && id == other.id;
//
//   @override
//   int get hashCode => id.hashCode;
//
//   @override
//   String toString() {
//     return 'Photo{id: $id}';
//   }
// }
